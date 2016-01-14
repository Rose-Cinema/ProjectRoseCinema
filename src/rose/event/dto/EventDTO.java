package rose.event.dto;

import java.sql.Timestamp;
import java.util.Date;

public class EventDTO {
	private int event_id;
	private int eventtype_id;
	private Timestamp estart_date;
	private Timestamp eend_date;
	private String event_name;
	private String event_image;
	private int timetable_id;
	private int coupon_id;
	private String event_poster;
	
	
	public String getEvent_poster() {
		return event_poster;
	}
	public void setEvent_poster(String event_poster) {
		this.event_poster = event_poster;
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public int getEventtype_id() {
		return eventtype_id;
	}
	public void setEventtype_id(int eventtype_id) {
		this.eventtype_id = eventtype_id;
	}
	
	
	
	public Timestamp getEstart_date() {
		return estart_date;
	}
	public void setEstart_date(Timestamp estart_date) {
		this.estart_date = estart_date;
	}
	public Timestamp getEend_date() {
		return eend_date;
	}
	public void setEend_date(Timestamp eend_date) {
		this.eend_date = eend_date;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_image() {
		return event_image;
	}
	public void setEvent_image(String event_image) {
		this.event_image = event_image;
	}
	public int getTimetable_id() {
		return timetable_id;
	}
	public void setTimetable_id(int timetable_id) {
		this.timetable_id = timetable_id;
	}
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
}
