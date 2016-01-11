package test.rose.bean;

import java.util.Date;

public class MpointHistoryDTO {

	private int member_id;
	private int point;
	private int change_point;
	private int change_type;
	private Date change_time;
	private String pay_content;
	private int pay_sum;
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getChange_point() {
		return change_point;
	}
	public void setChange_point(int change_point) {
		this.change_point = change_point;
	}
	public int getChange_type() {
		return change_type;
	}
	public void setChange_type(int change_type) {
		this.change_type = change_type;
	}
	public Date getChange_time() {
		return change_time;
	}
	public void setChange_time(Date change_time) {
		this.change_time = change_time;
	}
	public String getPay_content() {
		return pay_content;
	}
	public void setPay_content(String pay_content) {
		this.pay_content = pay_content;
	}
	public int getPay_sum() {
		return pay_sum;
	}
	public void setPay_sum(int pay_sum) {
		this.pay_sum = pay_sum;
	}
}
