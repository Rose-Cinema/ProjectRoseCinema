package rose.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import rose.DTO.CommentInfoDTO;

@Controller
public class CommentBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/movie/commentinsert.do")
	public ModelAndView comment(HttpSession session, CommentInfoDTO dto )throws Exception{
		//dto.setId((String)session.getAttribute("memId")); // 회원정보 연결후 .. 사용
		dto.setId("test");
		sqlMapClient.insert("comment.commentinsert", dto);
	
		
		ModelAndView mv = new ModelAndView();
				
		mv.setViewName("/comment/commentinsert.jsp");
		return mv;
	}

}
