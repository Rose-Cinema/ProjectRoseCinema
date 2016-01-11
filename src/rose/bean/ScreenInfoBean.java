package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.dto.ScreenDTO;

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
		List<Integer> screenIDList = (List<Integer>)sqlMapClient.queryForList("screen.selectAllScreenID", null);
		return screenIDList;
	}
}
