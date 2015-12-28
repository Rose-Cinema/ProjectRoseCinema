package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.dto.AreaDTO;

public class AreaInfoBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;

	// GET : get area list
	// @ResponseBody : send json data to client
	@RequestMapping(value = "/area", method = RequestMethod.GET)
	@ResponseBody
	public List<AreaDTO> getAreaList() {
		List<AreaDTO> area_list = (List<AreaDTO>)sqlMapClient.queryForList("area.getAreaList", null);
		return area_list;
	}
	
	// POST : add new area information
	// @RequestBody : change json to java object
	@RequestMapping(value = "/area" , method = RequestMethod.POST)
	@ResponseBody
	public List<AreaDTO> setNewArea(@RequestBody  AreaDTO new_area){
		sqlMapClient.queryForObject("area.setNewArea", new_area);
		// �� ������ ����ϸ� ����Ʈ�� ȣ���ؼ� �����ش�. ����Ʈ�� ���� ����.
		return getAreaList();
	}
	
	// GET : area information
	@RequestMapping(value = "/area/{area_id}", method = RequestMethod.GET)
	@ResponseBody
	public AreaDTO getAreaInfo(@PathVariable("area_id") int area_id) {
		AreaDTO area_info = (AreaDTO)sqlMapClient.queryForObject("area.getAreaInfo", area_id);
		return area_info;
	}
	
	// PUT : update area information
	@RequestMapping(value = "/area/{area_id}", method = RequestMethod.PUT)
	@ResponseBody
	public List<AreaDTO> updateAreaInfo(@RequestBody  AreaDTO update_area) {
		sqlMapClient.queryForObject("area.updateAreaInfo", update_area);
		// ���� ������ �����ص� ����Ʈ�� ȣ���ؼ� �����ش�. ����Ʈ�� ���� ����.
		return getAreaList();
	}
	
	// DELETE : delete area from area_id
	@RequestMapping(value = "/area/{area_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public List<AreaDTO> deleteAreaInfo(@PathVariable("area_id") int area_id) {
		sqlMapClient.queryForObject("area.deleteAreaInfo", area_id);
		// ���� ������ �����ص� ����Ʈ�� ȣ���ؼ� �����ش�. ����Ʈ�� ���� ����.
		return getAreaList();
	}
}
