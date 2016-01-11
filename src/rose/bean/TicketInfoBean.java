package rose.bean;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.dto.TicketDTO;

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
		List<TicketDTO> ticketList = (List<TicketDTO>)sqlMapClient.queryForList("ticket.selectAllTicket",null);
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
	
	@RequestMapping("/ticket/{timeTable}")
	public String ticket(@PathVariable String timeTable) {
		return "test";
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
