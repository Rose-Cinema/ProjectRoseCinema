package rose.bean;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import rose.DTO.SeatDTO;
import rose.DTO.TicketDTO;
import rose.event.dto.MovieDTO;
import rose.theater.bean.Theater;
import rose.timetable.bean.Timetable;

@Controller
public class TicketInfoBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/insertTicketForm")
	public String insertTicketForm() {
		return "/ticket/admin/insertTicketForm.jsp";
	}
	
	@RequestMapping("/updateTicketForm")
	public String updateTicketForm() {
		return "/ticket/admin/ticketForm.jsp";
	}
	
	@RequestMapping("/deleteTicket/{ticketID}")
	@ResponseBody
	public int deleteTicket(@PathVariable String ticketID) {
		System.out.println(ticketID);
		return sqlMapClient.delete("ticket.deleteTicket", ticketID);
	}
	
	@RequestMapping("/selectAllTicket")
	@ResponseBody
	public List<TicketDTO> selectAllTicket() {
		System.out.println("1");
		List<TicketDTO> ticketList = (List<TicketDTO>)sqlMapClient.queryForList("ticket.selectAllTicket",null);
		System.out.println("2");
		return ticketList;
	}
	
	@RequestMapping("/getNextTicketID")
	@ResponseBody
	public int getNextTicketID() {
		int lastTicketIDSEQ = (int)sqlMapClient.queryForObject("ticket.selectLastTicketIDSEQ", null);
		return lastTicketIDSEQ+=1;
	}
	
	@RequestMapping("/updateThisData/{ticketID}/{column}/{value}")
	@ResponseBody
	public int updateThisData(@PathVariable String ticketID, @PathVariable String column, @PathVariable String value) {
		System.out.println(ticketID);
		System.out.println(column);
		System.out.println(value);
		
		HashMap<String,String> updateData = new HashMap<>();
		updateData.put("TICKETID", ticketID);
		updateData.put("COLUMN", column);
		updateData.put("VALUE", value);
		
		return sqlMapClient.update("ticket.updateInputData", updateData);
	}
	
	@RequestMapping("/ticket/ticket.do")
	public ModelAndView ticket(HttpSession session, HttpServletRequest request) throws Exception{
		//request.getParameter("timetable_id");
		System.out.println(2);
		Timetable timeTable = (Timetable)sqlMapClient.queryForObject("timetable.getTimetableInfo", Integer.parseInt(request.getParameter("timetable_id")));
		System.out.println(timeTable.getMovie_id());
		System.err.println(timeTable.getScreen_id());
		String movie = (String)sqlMapClient.queryForObject("movie.selectMovieNameByID", timeTable.getMovie_id());
		String screen = (String)sqlMapClient.queryForObject("screen.selectScreenNameByID", timeTable.getScreen_id());
		List<SeatDTO> seatList = (List<SeatDTO>)sqlMapClient.queryForList("seat.selectSeatByScreenID", timeTable.getScreen_id());
		int memberid = (int)session.getAttribute("memNum");
		System.out.println("memberid"+memberid);
		int cardCount = (int)sqlMapClient.queryForObject("mcard.selectMcardCount", memberid);
		ModelAndView mv = new ModelAndView();
		if(cardCount != 0) {
			List<Integer> mcardidList = (List<Integer>)sqlMapClient.queryForList("mcard.selectMcardIDByMemberID", memberid);
			mv.addObject("mcardIDList", mcardidList);
		}
		System.out.println(cardCount);
		System.out.println(movie);
		System.out.println(screen);
		
		mv.addObject("timeTable", timeTable);
		mv.addObject("movie", movie);
		mv.addObject("screen", screen);
		mv.addObject("seatList", seatList);
		mv.setViewName("/ticket/test.jsp");
		return mv;
	}
	
	@RequestMapping("/ticket/goInsertTicketOptionForm")
	public String goInsertTicketOptionForm() {
		return "/ticket/insertTicketOptionForm.jsp";
	}
	
/*	@RequestMapping("/ticket/ticket.do")
	public ModelAndView ticket() {
		ModelAndView mv = new ModelAndView();
		List<MovieDTO> movieList = (List<MovieDTO>)sqlMapClient.queryForList("movie.selectMovieIDName", null);
		mv.addObject("movieList", movieList);
		List<Theater> theaterList = (List<Theater>)sqlMapClient.queryForList("theaters.selectTheaterIDName", null);
		mv.addObject("theaterList", theaterList);
		List<Timetable> timetableList = (List<Timetable>)sqlMapClient.queryForList("timetable.selectAllTimetable", null);
		mv.addObject("timetableList", timetableList);
		mv.setViewName("/ticket/ticket.jsp");
		return mv;
	}*/
	
	@RequestMapping("/ticket/goTicket.do")
	public String goTicket() {
		return "/RoseCinema/ticket/ticket.jsp";
	}
	
	@RequestMapping("/ticket/checkMovie/{moviename}")
	@ResponseBody
	public ModelAndView checkMovie(@PathVariable String moviename) {
		System.out.println(moviename);
		ModelAndView mv = new ModelAndView();
		mv.addObject("moviename", moviename);
		mv.setViewName("/ticket/ticket.jsp");
		return mv;
	}
	
	@RequestMapping("/ticket/insertTicket.do")
	public String insertTicket(HttpServletRequest request, HttpSession session) {
		TicketDTO ticket = new TicketDTO();

		String ticketID = request.getParameter("ticket_id");
		int ticketid = Integer.parseInt(ticketID);
		ticket.setTicketID(ticketid);
		
		String screenID = request.getParameter("screen_id");
		int screenid = Integer.parseInt(screenID);
/*		ticket.ti
		
		String memberID = request.getParameter("member_id");
		int memberid = Integer.parseInt(memberID);
		
		int no = ticketid+screenid+memberid;*/
		
		System.out.println("아오씨TLTLTLTLTL");
		ticket.setScreenID(Integer.parseInt(request.getParameter("SCREENID")));
		System.out.println("아아아아아아아앙");
		int memberid = (int)session.getAttribute("memNum");
		System.out.println("ㅇ나아아아아아");
		
		ticket.setMemberID(memberid);
		System.out.println("아아아아");
		
			if(request.getAttribute("MCARDID") == null) {
				System.out.println("tlqkfdasd");
			}
			
			System.out.println(request.getParameter("MCARDID"));
			System.out.println(request.getParameter("MCARDID"));
			System.out.println(request.getParameter("MCARDID"));
			System.out.println(request.getParameter("MCARDID"));
/*		if (mcardid != null || mcardid != "") {
				System.out.println("@@@"+mcardid+"@@@");
				ticket.setMcardID(Integer.parseInt(mcardid));
		}*/
			System.out.println("아아아아");
		System.out.println("111111");
		ticket.setMovie(request.getParameter("MOVIE"));
		System.out.println("1");
		ticket.setTheater(request.getParameter("THEATER"));
		System.out.println("2");
		ticket.setScreen(request.getParameter("SCREEN"));
		System.out.println("3");
		ticket.setCount(request.getParameter("COUNT"));
		System.out.println("4");
		ticket.setSeat1(request.getParameter("SEAT1"));
		System.out.println("5");
		ticket.setSeat2(request.getParameter("SEAT2"));
		System.out.println("6");
		ticket.setSeat3(request.getParameter("SEAT3"));
		System.out.println("7");
		ticket.setSeat4(request.getParameter("SEAT4"));
		System.out.println("8");
		ticket.setSeat5(request.getParameter("SEAT5"));
		System.out.println("9");
		ticket.setSeat6(request.getParameter("SEAT6"));
		System.out.println("10");
		ticket.setSeat7(request.getParameter("SEAT7"));
		System.out.println("11");
		ticket.setSeat8(request.getParameter("SEAT8"));
		
		sqlMapClient.insert("ticket.insertTicket", ticket);
		return "/movie/movielist.do";
		
	}
	
	@RequestMapping("/ticket/admin.do")
	public String admin() {
		return "/ticket/admin/selectTicketForm.jsp";
	}
	
/*	@RequestMapping("/getTicketList")
	@ResponseBody
	public List<TicketDTO> getTicketList(int member_id) {
		List<TicketDTO> ticket_list = (List<TicketDTO>)sqlMapClient.queryForList("ticket.getTicketList", member_id);
		return ticket_list;
	}
	
	@RequestMapping("/getTicket")
	@ResponseBody
	public TicketDTO getTicket(String no) {
		TicketDTO ticket = (TicketDTO)sqlMapClient.queryForObject("ticket.getTIcket", no);
		return ticket;
	}
	
	@RequestMapping("/cancelTicket")
	@ResponseBody
	public int cancelTicket(String no) {
		int success = (int)sqlMapClient.queryForObject("ticket.cancelTicket", no);
		return success;
	}
	
	@RequestMapping("/buyTicket")
	@ResponseBody
	public void buyTicket(TicketDTO ticket) {
		sqlMapClient.queryForObject("ticket.buyTicket", ticket);
	}*/
	

}
