package rose.event.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.event.dto.EventTypeDTO;

@Controller
public class EventTypeBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/eventType")
	public String eventtype(HttpServletRequest request)throws Exception{
		return "/event/eventType.jsp";
	}
	
	@RequestMapping("/eventTypePro")
	public String eventtypePro(EventTypeDTO dto)throws Exception{
		
		sqlMapClient.insert("event.typeInsert", dto);
		
		return "/event/eventTypePro.jsp";
	}
}