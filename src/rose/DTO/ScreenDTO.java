package rose.DTO;

public class ScreenDTO {
	private int screen_id;
	private int theater_id;
	private String screen_name;
	private int screen_type;
	private int seat_cnt;
	public int getScreen_id() {
		return screen_id;
	}
	public void setScreen_id(int screen_id) {
		this.screen_id = screen_id;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public int getScreen_type() {
		return screen_type;
	}
	public void setScreen_type(int screen_type) {
		this.screen_type = screen_type;
	}
	public int getSeat_cnt() {
		return seat_cnt;
	}
	public void setSeat_cnt(int seat_cnt) {
		this.seat_cnt = seat_cnt;
	}
	
	
}
