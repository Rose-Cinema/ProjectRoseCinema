package rose.theater.bean;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class TheaterAdminBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping(value = "/theaters/admin", method = RequestMethod.GET)
	public String getTheaterAdminMain(HttpServletRequest req){

		return "/theaters/admin/main.jsp";
	}
	
	@RequestMapping(value = "/theaters/admin/edit/{theater_id}", method = RequestMethod.GET)
	public String getTheaterAdminEditPage(HttpServletRequest req, @PathVariable("theater_id") int theater_id) {

		Theater theater = (Theater)sqlMapClient.queryForObject("theaters.getTheaterInfo", theater_id);
		req.setAttribute("theater_id", theater.getTheater_id());
		req.setAttribute("theater_name", theater.getTheater_name());
		req.setAttribute("area_id", theater.getArea_id());
		req.setAttribute("adress", theater.getAdress());
		req.setAttribute("phone", theater.getPhone());
		req.setAttribute("location_x", theater.getLocation_x());
		req.setAttribute("location_y", theater.getLocation_y());
		req.setAttribute("total_screen", theater.getTotal_screen());
		req.setAttribute("total_seats", theater.getTotal_seats());
		
		return  "/theaters/admin/edit.jsp";
	}
	
	@RequestMapping(value = "/theaters/admin/add", method = RequestMethod.GET)
	public String getTheaterAdminAddPage(HttpServletRequest req) {

		return  "/theaters/admin/add.jsp";
	}
	
	@RequestMapping(value = "/theaters/admin/upload_image/{theater_id}", method = RequestMethod.POST)
	@ResponseBody
	public String setTheaterUploadImage(MultipartHttpServletRequest req, @PathVariable("theater_id") int theater_id) throws Exception {
		MultipartFile file = req.getFile("img_file");
		//String ori_name = file.getOriginalFilename();
		//String file_ext = ori_name.substring(ori_name.lastIndexOf('.') + 1,ori_name.length());
		String name = "/theaters/image/"+theater_id+".jpg";
		name = req.getSession().getServletContext().getRealPath(name);
		File sf = new File(name);
		file.transferTo(sf);
		
		return "upload image";
	}
	
	
}
