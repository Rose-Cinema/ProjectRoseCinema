package rose.theater.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TheaterUserBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;

	@RequestMapping(value = "/theaters/main", method = RequestMethod.GET)
	public String getTheaterMain(HttpServletRequest req){
		return getTheaterPageTimetable(req, 1);
	}

	@RequestMapping(value = "/theaters/{theater_id}/timetable", method = RequestMethod.GET)
	public String getTheaterPageTimetable(HttpServletRequest req, 	@PathVariable("theater_id") int theater_id) {

		getTheaterInfo(theater_id, req);
		req.setAttribute("view_type", "timetable");
		
		return "/theaters/main.jsp";
	}
	
	@RequestMapping(value = "/theaters/{theater_id}/location", method = RequestMethod.GET)
	public String getTheaterPageLocation(HttpServletRequest req, 	@PathVariable("theater_id") int theater_id) {

		Theater theater = getTheaterInfo(theater_id, req);
		req.setAttribute("view_type", "location");
		req.setAttribute("location_x", theater.getLocation_x());
		req.setAttribute("location_y", theater.getLocation_y());
		req.setAttribute("image", theater.getImage());
		
		return "/theaters/main.jsp";
	}
	
	@RequestMapping(value = "/theaters/{theater_id}/price", method = RequestMethod.GET)
	public String getTheaterPagePrice(HttpServletRequest req, 	@PathVariable("theater_id") int theater_id) {

		getTheaterInfo(theater_id, req);
		req.setAttribute("view_type", "price");
		
		return "/theaters/main.jsp";
	}

	private Theater getTheaterInfo(int theater_id, HttpServletRequest req) {

		Theater theater = (Theater)sqlMapClient.queryForObject("theaters.getTheaterInfo", theater_id);
		if( req != null ) {
			req.setAttribute("theater_id", theater.getTheater_id());
			req.setAttribute("theater_name", theater.getTheater_name());
			req.setAttribute("area_id", theater.getArea_id());
			req.setAttribute("adress", theater.getAdress());
			req.setAttribute("phone", theater.getPhone());
			req.setAttribute("total_screen", theater.getTotal_screen());
			req.setAttribute("total_seats", theater.getTotal_seats());
		}
		
		return theater;
	}
}
