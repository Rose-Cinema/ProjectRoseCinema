package rose.bean;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView ticket() throws Exception{
		System.out.println(2);
		Timetable timeTable = (Timetable)sqlMapClient.queryForObject("timetable.getTimetableInfo", 2);
		System.out.println(timeTable.getMovie_id());
		System.err.println(timeTable.getScreen_id());
		String movie = (String)sqlMapClient.queryForObject("movie.selectMovieNameByID", timeTable.getMovie_id());
		String screen = (String)sqlMapClient.queryForObject("screen.selectScreenNameByID", timeTable.getScreen_id());
		List<SeatDTO> seatList = (List<SeatDTO>)sqlMapClient.queryForList("seat.selectSeatByScreenID", timeTable.getScreen_id());
		System.out.println(movie);
		System.out.println(screen);
		ModelAndView mv = new ModelAndView();
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
