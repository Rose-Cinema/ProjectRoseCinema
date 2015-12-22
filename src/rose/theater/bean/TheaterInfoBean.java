package rose.theater.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/theaters")
public class TheaterInfoBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;

	@RequestMapping("/main.do")
	public String TheaterMain(){

		
		return "/theaters/main.jsp";
	}

	@RequestMapping(value = "/get/list", method = RequestMethod.GET)
	@ResponseBody
	public List<Theater> getListByJson(){
		List<Theater> theater_list = (List<Theater>)sqlMapClient.queryForList("theaters.getTheaterList", null);
		return theater_list;
	}
}
