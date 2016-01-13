package rose.timetable.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TimetableViewBean {

	@RequestMapping(value = "/timetable/admin/list", method = RequestMethod.GET)
	public String viewListPage() {
		return "/timetable/admin/list.jsp";
	}
	
	@RequestMapping(value = "/timetable/admin/info", method = RequestMethod.GET)
	public String viewInfoPage() {
		return "/timetable/admin/info.jsp";
	}
	
	@RequestMapping(value = "/timetable/admin/add", method = RequestMethod.GET)
	public String viewAddPage() {
		return "/timetable/admin/add.jsp";
	}
}
