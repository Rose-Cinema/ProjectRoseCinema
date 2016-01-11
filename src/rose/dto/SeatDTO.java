package rose.dto;

public class SeatDTO {

	private int seat_id;
	private int screen_id;
	private String line_no;
	private int seat_no;
	private int seat_type;
	private int seatable;
	private int primezone;
	
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getScreen_id() {
		return screen_id;
	}
	public void setScreen_id(int screen_id) {
		this.screen_id = screen_id;
	}
	public String getLine_no() {
		return line_no;
	}
	public void setLine_no(String line_no) {
		this.line_no = line_no;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getSeat_type() {
		return seat_type;
	}
	public void setSeat_type(int seat_type) {
		this.seat_type = seat_type;
	}
	public int getSeatable() {
		return seatable;
	}
	public void setSeatable(int seatable) {
		this.seatable = seatable;
	}
	public int getPrimezone() {
		return primezone;
	}
	public void setPrimezone(int primezone) {
		this.primezone = primezone;
	}
}
