package rose.timetable.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TimetableViewBean {

	@RequestMapping(value = "/timetable/admin/list", method = RequestMethod.GET)
	public String viewListPage() {
		return "/timetable/admin/list.jsp";
	}
	
	@RequestMapping(value = "/timetable/admin/info/{timetable_id}", method = RequestMethod.GET)
	public String viewInfoPage(HttpServletRequest req, @PathVariable int timetable_id) {
		req.setAttribute("timetable_id", timetable_id);
		return "/timetable/admin/info.jsp";
	}
	
	@RequestMapping(value = "/timetable/admin/add", method = RequestMethod.GET)
	public String viewAddPage() {
		return "/timetable/admin/add.jsp";
	}
}
