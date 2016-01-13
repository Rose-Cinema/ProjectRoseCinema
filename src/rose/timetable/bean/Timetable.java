package rose.timetable.bean;

public class Timetable {
	private int timetable_id;
	private int theater_id;
	private int movie_id;
	private int screen_id;
	private String year_info;
	private String date_info;
	private String start_time;
	private String end_time;
	private int sale_type;
	private int total_seats;
	private int remain_seats;
	public int getTimetable_id() {
		return timetable_id;
	}
	public void setTimetable_id(int timetable_id) {
		this.timetable_id = timetable_id;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public int getScreen_id() {
		return screen_id;
	}
	public void setScreen_id(int screen_id) {
		this.screen_id = screen_id;
	}
	public String getYear_info() {
		return year_info;
	}
	public void setYear_info(String year_info) {
		this.year_info = year_info;
	}
	public String getDate_info() {
		return date_info;
	}
	public void setDate_info(String date_info) {
		this.date_info = date_info;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getSale_type() {
		return sale_type;
	}
	public void setSale_type(int sale_type) {
		this.sale_type = sale_type;
	}
	public int getTotal_seats() {
		return total_seats;
	}
	public void setTotal_seats(int total_seats) {
		this.total_seats = total_seats;
	}
	public int getRemain_seats() {
		return remain_seats;
	}
	public void setRemain_seats(int remain_seats) {
		this.remain_seats = remain_seats;
	}
}
