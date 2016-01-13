package rose.event.bean;

import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import rose.event.dto.EventDTO;

@Controller
public class EventBean{
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/event")
	public String event(HttpServletRequest request) throws Exception{
		List couponlist = sqlMapClient.queryForList("event.couponlist",null);
		List tablelist = sqlMapClient.queryForList("event.timeTableInfo",null);
		request.setAttribute("couponlist", couponlist);
		request.setAttribute("timeTableInfo", tablelist);
		return "/event/event.jsp";
	}
	@RequestMapping("/eventMain")
	public String eventMain(HttpServletRequest request)throws Exception{
		return "/event/eventMain.jsp";
	}
	@RequestMapping("/eventPro")
	public String eventPro(MultipartHttpServletRequest request)throws Exception{
		
		//������ ���޹��� �Ķ���͸� DTO�� ���� 
		EventDTO dto = new EventDTO();
		
		dto.setEventtype_id(Integer.parseInt(request.getParameter("eventtype_id")));
		
		String s = request.getParameter("estart_date");
		s = s.replace('-','/');
		
		String e = request.getParameter("eend_date");
		e = e.replace('-','/');
		
		Date start = new Date(s);
		Date end = new Date(e)
				;
		System.out.println(start.getTime());
		dto.setEstart_date(new Timestamp(start.getTime()));
		dto.setEend_date(new Timestamp(end.getTime()));
		dto.setEvent_name(request.getParameter("event_name"));
		dto.setCoupon_id(Integer.parseInt(request.getParameter("coupon_id")));
		dto.setTimetable_id(Integer.parseInt(request.getParameter("timetable_id")));
		
		
		String path = request.getRealPath("/event/img");  //�̹��� ������
		MultipartFile mf = request.getFile("event_image"); // ���ε� �̹���
		MultipartFile mfp = request.getFile("event_poster"); // ���ε� �̹���
		
		String imageName = mf.getOriginalFilename();  // �̹����� �����̸�
		String poster = mfp.getOriginalFilename();  // �̹����� �����̸�
		
		dto.setEvent_image(imageName);
		dto.setEvent_poster(poster);
		
		File image = new File(path+"//"+imageName);
		File fp = new File(path+"//"+poster);
		
		mf.transferTo(image);
		mfp.transferTo(fp);
		
		
		sqlMapClient.insert("event.eventInsert", dto);
		
		return "/event/eventPro.jsp";
	}
	
	@RequestMapping("/eventList")
	public String eventList(HttpServletRequest request) throws Exception{
		List eventlist = sqlMapClient.queryForList("event.eventList",null);
		request.setAttribute("eventlist", eventlist);
		return "/event/eventList.jsp";
	}
	@RequestMapping("/eventEndList")
	public String eventEndList(HttpServletRequest request) throws Exception{
		List eventlist = sqlMapClient.queryForList("event.eventEndList",null);
		request.setAttribute("eventlist", eventlist);
		return "/event/eventList.jsp";
	}
	
	
	
	@RequestMapping("/eventContent")
	public String eventContent(String event_id, HttpServletRequest request) throws Exception{
		EventDTO dto = (EventDTO)sqlMapClient.queryForObject("event.eventContent",event_id);
		
		request.setAttribute("dto", dto);
		return "/event/eventContent.jsp";
	}
	
	@RequestMapping("/top")
	public String top(HttpServletRequest request)throws Exception{
		return "/event/top.jsp";
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request)throws Exception{
		return "/event/main.jsp";
	}
	
	@RequestMapping("/bottom")
	public String bottom(HttpServletRequest request)throws Exception{
		return "/event/bottom.jsp";
	}
}










