package rose.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoseMainBean {

	@RequestMapping("/")
	public String showMain(){
		return "/main.jsp";
	}
	
	@RequestMapping("/admin")
	public String showAdminMain(){
		return "/admin/main.jsp";
	}
	
	@RequestMapping("/need_login")
	public String showNeedLogin(){
		return "/need_login.jsp";
	}
}
