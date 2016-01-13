package rose.event.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.event.dto.CouponTypeDTO;

@Controller
public class CouponTypeBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/couponType")
	public String typeForm()throws Exception{
		return "/event/couponType.jsp";
	}
	
	@RequestMapping("/couponTypePro")
	public String typeFormPro(CouponTypeDTO dto)throws Exception{
		
		sqlMapClient.insert("event.typeInsert", dto);
		
		return "/event/couponTypePro.jsp";
	}
}













