package rose.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import rose.DTO.MpointHistoryDTO;
import rose.DTO.McardInfoDTO;
import java.sql.Timestamp;

@Controller
public class PointBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/meminfoForm")
	public String meminfo(HttpSession session , HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("memId");		
		id += "_mpoint";
		List<?> pointlist = sqlMapClient.queryForList("mypage.mpointhistory", id);
		request.setAttribute("mpoint", pointlist);
		
		String memNum = Integer.toString((int) session.getAttribute("memNum"));
		List<?> cardlist = sqlMapClient.queryForList("mypage.memcardinfo", memNum);
		request.setAttribute("memcard", cardlist);
		
			
		
		return "/mypage/membership/meminfoForm.jsp";
	}
	
	
	/*****¸â¹ö½Ê Ä«µå*****/
	@RequestMapping("/memcardRegister")
	public String memcardregister(){
		
		java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		System.out.println(ts); //2006-05-11 21:53:33.093

		
		System.out.println("form");
		
		
		return "/mypage/membership/memcardRegister.jsp";
	}

	
	@RequestMapping("/memcardRegisterPro")
	public String memcardregisterpro(McardInfoDTO dto, HttpServletRequest request){
		
		sqlMapClient.insert("mypage.memcard", dto);
		request.setAttribute("name", dto.getMcard_id());
		
		return "/mypage/membership/memcardRegisterPro.jsp";
	}
	
	
	@RequestMapping("/memcardDelete")
	public String memcarddelete(McardInfoDTO dto){
		
		sqlMapClient.delete("mypage.memcarddel", dto);
		
		return "/mypage/membership/mcardDelete.jsp";
	}
	
	
	
	
	
	
	

}
