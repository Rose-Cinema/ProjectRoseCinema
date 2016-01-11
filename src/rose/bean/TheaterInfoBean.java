package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.dto.TheaterDTO;

public class TheaterInfoBean {
	@Autowired
	private SqlMapClientTemplate sqlMapClient;

	@RequestMapping(value = "/theaters", method = RequestMethod.GET)
	@ResponseBody
	public List<TheaterDTO> getTheaterList(){
		List<TheaterDTO> theater_list = (List<TheaterDTO>)sqlMapClient.queryForList("theaters.getTheaterList", null);
		return theater_list;
	}
	
	@RequestMapping(value = "/theaters/{theater_id}", method = RequestMethod.GET)
	@ResponseBody
	public TheaterDTO getTheaterInfo(@PathVariable("theater_id") int theater_id) {
		TheaterDTO theater_info = (TheaterDTO)sqlMapClient.queryForObject("theaters.getTheaterInfo", theater_id);
		return theater_info;
	}
}
