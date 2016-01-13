package rose.theater.bean;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class TheaterInfoBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping(value = "/theaters", method = RequestMethod.GET)
	@ResponseBody
	public List<Theater> getTheaterList(){
		List<Theater> theater_list = (List<Theater>)sqlMapClient.queryForList("theaters.getTheaterList", null);
		return theater_list;
	}
	
	@RequestMapping(value = "/theaters/{theater_id}", method = RequestMethod.GET)
	@ResponseBody
	public Theater getTheaterInfo(@PathVariable("theater_id") int theater_id) {
		Theater theater_info = (Theater)sqlMapClient.queryForObject("theaters.getTheaterInfo", theater_id);
		return theater_info;
	}
	
	@RequestMapping(value = "/theaters", method = RequestMethod.POST)
	@ResponseBody
	public List<Theater> setTheaterInfo(@RequestBody Theater new_theater) {
			sqlMapClient.queryForObject("theaters.setNewTheater", new_theater);
			return getTheaterList();
	}
	
	@RequestMapping(value = "/theaters", method = RequestMethod.PUT)
	@ResponseBody
	public List<Theater> updateTheaterInfo(@RequestBody Theater update_theater) {
			sqlMapClient.queryForObject("theaters.updateTheaterInfo", update_theater);
			return getTheaterList();
	}
	
	@RequestMapping(value = "/theaters/{theater_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public List<Theater> deleteTheaterInfo(@PathVariable("theater_id") int theater_id) {
			sqlMapClient.queryForObject("theaters.deleteTheaterInfo", theater_id);
			return getTheaterList();
	}
	
	//SAMARA907
	@RequestMapping("/selectTheaterNameByScreenID/{screen_id}")
	@ResponseBody
	public String selectTheaterNameByScreenID(@PathVariable String screen_id) {
		String theater_name = (String)sqlMapClient.queryForObject("theaters.selectTheaterNameByScreenID", screen_id);
		return theater_name;
	}
	
	//SAMARA907
	@RequestMapping("/selectAllTheaterName")
	@ResponseBody
	public List<String> selectAllTheaterName() {
		List<String> theaterNameList= (List<String>)sqlMapClient.queryForList("theaters.selectAllTheaterName", null);
		return theaterNameList;
	}
	
	//SAMARA907
	@RequestMapping("/selectTheaterIDName")
	@ResponseBody
	public List<Theater> selectTheaterIDName() {
		List<Theater> theaterList = (List<Theater>)sqlMapClient.queryForList("theaters.selectTheaterIDName", null);
		return theaterList;
	}
	
}
