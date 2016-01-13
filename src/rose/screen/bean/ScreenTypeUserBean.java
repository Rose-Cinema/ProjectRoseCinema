package rose.screen.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScreenTypeUserBean {

	@RequestMapping(value = "/screens/special", method = RequestMethod.GET)
	public String viewScreenPages(){
		return "/screens/main.jsp";
	}
	@RequestMapping(value = "/screens/special/3d", method = RequestMethod.GET)
	public String viewScreenPages3d(){
		return "/screens/3d.jsp";
	}
	@RequestMapping(value = "/screens/special/4d", method = RequestMethod.GET)
	public String viewScreenPages4d(){
		return "/screens/4d.jsp";
	}
	@RequestMapping(value = "/screens/special/imax", method = RequestMethod.GET)
	public String viewScreenPagesIMAX(){
		return "/screens/imax.jsp";
	}
}
