package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class McardInfoBean {

	@Autowired
	SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/selectMcardIDByMemberID")
	@ResponseBody
	public List<Integer> selectMcardIDByMemberID(int memberID) {
		List<Integer> memberIDList = sqlMapClient.queryForList("mcard.selectMcardIDByMemberID", memberID);
		return memberIDList;
	}
}
