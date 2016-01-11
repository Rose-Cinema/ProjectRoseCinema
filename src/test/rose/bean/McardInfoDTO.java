package test.rose.bean;

public class McardInfoDTO {

	private int mcard_id;
	private int member_id;
	private String first_date;
	private String last_date;
	private int isactive;
	
	public int getMcard_id() {
		return mcard_id;
	}
	public void setMcard_id(int mcard_id) {
		this.mcard_id = mcard_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getFirst_date() {
		return first_date;
	}
	public void setFirst_date(String first_date) {
		this.first_date = first_date;
	}
	public String getLast_date() {
		return last_date;
	}
	public void setLast_date(String last_date) {
		this.last_date = last_date;
	}
	public int getIsactive() {
		return isactive;
	}
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
}
