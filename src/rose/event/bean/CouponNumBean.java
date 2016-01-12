package rose.event.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.event.dto.CouponNumDTO;


@Controller
public class CouponNumBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/couponNum")
	public String couponNum(HttpServletRequest request)throws Exception{
		List couponlist = sqlMapClient.queryForList("event.couponNumList",null);
		request.setAttribute("couponNumList", couponlist);
		return "/event/couponNum.jsp";
	}
	
	@RequestMapping("/couponNumPro")
	public String couponNumPro(CouponNumDTO dto)throws Exception{
		
		sqlMapClient.insert("event.numInsert", dto);
		
		return "/event/couponNumPro.jsp";
	}
}