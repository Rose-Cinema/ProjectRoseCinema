package rose.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import rose.DTO.TicketDTO;
import java.util.Calendar;
import java.util.HashMap;
import java.sql.Timestamp;

@Controller
public class mymovieBean {
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/reserveList")
	public String reservelist(HttpSession session, HttpServletRequest request) throws Exception{
		int memNum = (int) session.getAttribute("memNum");
		System.out.println(memNum);
		
		
		//java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		

		List list = sqlMapClient.queryForList("mypage.myTicket", memNum);
		
		request.setAttribute("ticket", list);	
		
		return "/mypage/myMovie/reserveList.jsp";
		
	}
	

}
