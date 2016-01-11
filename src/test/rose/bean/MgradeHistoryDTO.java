package test.rose.bean;

public class MgradeHistoryDTO {

	private int member_id;
	private int mgrade_id;
	private String year;
	private int buy_count;
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getMgrade_id() {
		return mgrade_id;
	}
	public void setMgrade_id(int mgrade_id) {
		this.mgrade_id = mgrade_id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
}
