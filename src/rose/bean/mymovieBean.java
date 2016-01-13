package rose.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import rose.DTO.McardInfoDTO;
import rose.DTO.TicketDTO;
import java.util.Calendar;
import java.util.HashMap;
import java.sql.Timestamp;

@Controller
public class mymovieBean {
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	
	/***볼예정인 내 영화내역, 예매 내역, 최근 1개월 동안 카운트*******/
	@RequestMapping("/reserveList")
	public String reservelist(HttpSession session, HttpServletRequest request) throws Exception{
		int memNum = (int) session.getAttribute("memNum");
		System.out.println(memNum);
		
		
		//java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		

		List list = sqlMapClient.queryForList("mypage.myTicketAfter", memNum);
		
		request.setAttribute("ticket", list);	
		
		return "/mypage/myMovie/reserveList.jsp";
		
	}
	
	/****취소 영화 내역*****/
	
	
	@RequestMapping("/cancelList")
	public String cancellist(HttpSession session, HttpServletRequest request) throws Exception{
		int memNum = (int) session.getAttribute("memNum");
		
		//java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		

		List list = sqlMapClient.queryForList("mypage.myTicketCancel", memNum);
		
		request.setAttribute("ticket", list);	
		
		return "/mypage/myMovie/cancelList.jsp";
		
	}
	
	
	@RequestMapping("/movieHistory")
	public String moviehistory(HttpSession session, HttpServletRequest request) throws Exception{
		int memNum = (int) session.getAttribute("memNum");
		System.out.println(memNum);
		
		
		//java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		
		List list = sqlMapClient.queryForList("mypage.myTicket", memNum);
		
		request.setAttribute("ticket", list);	
		
		return "/mypage/myMovie/movieHistory.jsp";
	}
	
	
	@RequestMapping("/reserveDelete")
	public String reservedelete(TicketDTO dto){
		
		sqlMapClient.delete("mypage.reservedel", dto);
		
		return "/mypage/myMovie/reserveDelete.jsp";
	}
	

}
