package rose.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.dto.FaqDTO;

@Controller
public class FaqBean {

//	@Autowired
//	private SqlMapClientTemplate sqlMapClient;
//	
//	@RequestMapping("/insertFaq")
//	public String insertFaq(HttpServletRequest request, FaqDTO faq) {
//		sqlMapClient.insert("faq.insertFaq", faq);
//		return "/RoseCinema/center/centerMenu.jsp";
//	}
}
