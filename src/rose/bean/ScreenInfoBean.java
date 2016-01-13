package rose.bean;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.DTO.ScreenDTO;

@Controller
public class ScreenInfoBean {

	@Autowired
	SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/selectAllScreenInfo")
	@ResponseBody
	public List<ScreenDTO> selectAllScreenInfo() {
		List<ScreenDTO> screenInfoList = (List<ScreenDTO>)sqlMapClient.queryForList("screen.selectAllScreenInfo", null);
		return screenInfoList;
	}
	
	@RequestMapping("/selectAllScreenID")
	@ResponseBody
	public List<Integer> selectAllScreenID() {
		@SuppressWarnings("unchecked")
		List<Integer> screenIDList = (List<Integer>)sqlMapClient.queryForList("screen.selectAllScreenID", null);
		return screenIDList;
	}

	// mingyeong
	@RequestMapping(value = "/screen/{screen_id}", method = RequestMethod.GET)
	@ResponseBody
	public ScreenDTO selectScreenInfo(@PathVariable int screen_id) {
		ScreenDTO screenInfoList = (ScreenDTO)sqlMapClient.queryForObject("screen.getScreenInfo", screen_id);
		return screenInfoList;
	}
	@RequestMapping(value = "/screen", method = RequestMethod.POST)
	@ResponseBody
	public String addScreenInfo(@RequestBody ScreenDTO screen) {
		sqlMapClient.queryForObject("screen.setNewScreen", screen);
		return "add";
	}
	@RequestMapping(value = "/screen/{screen_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteScreenInfo(@PathVariable int screen_id) {
		sqlMapClient.queryForObject("screen.deleteScreen", screen_id);
		return "delete";
	}
	@RequestMapping(value = "/screen/theater/{theater_id}", method = RequestMethod.GET)
	@ResponseBody
	public List<ScreenDTO> selectScreenInfoByTheater(@PathVariable int theater_id) {
		List<ScreenDTO> screenInfoList = (List<ScreenDTO>)sqlMapClient.queryForList("screen.getScreenInfoByTheater", theater_id);
		return screenInfoList;
	}
	
}
