package rose.event.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.event.dto.CouponDTO;

@Controller
public class CouponBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/coupon")
	public String coupon(HttpServletRequest request)throws Exception{
		
		List list = sqlMapClient.queryForList("event.typeList",null);
		request.setAttribute("typeList", list);
		return "/event/coupon.jsp";
	}
	
	@RequestMapping("/couponPro")
	public String couponPro(CouponDTO dto)throws Exception{
		
		sqlMapClient.insert("event.couponInsert", dto);
		
		return "/event/couponPro.jsp";
	}
	
	@RequestMapping("/couponList")
	public String event(HttpServletRequest request) throws Exception{
		List coulist = sqlMapClient.queryForList("event.couponlist",null);
		request.setAttribute("couponlist", coulist);
		return "/event/couponList.jsp";
	}
}
