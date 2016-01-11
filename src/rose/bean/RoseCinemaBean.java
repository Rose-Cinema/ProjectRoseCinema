package rose.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoseCinemaBean {

	@RequestMapping("/showMovieMenu")
	public String showMovieMenu() {
		return "/movie/movieList.jsp";
	}
	
	@RequestMapping("/showCenterMenu")
	public String showCenterMenu() {
		return "/RoseCinema/center/centerMenu.jsp";
	}
	
	@RequestMapping("/insertFaqForm")
	public String insertFaqForm() {
		return "/RoseCinema/center/faq/insertFaqForm.jsp";
	}
}
