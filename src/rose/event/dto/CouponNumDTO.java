package rose.event.dto;

import java.util.Date;

public class CouponNumDTO {
	private int coupon_num;
	private int coupon_id;
	private String used_date;
	private String id;
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}

	public String getUsed_date() {
		return used_date;
	}
	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
