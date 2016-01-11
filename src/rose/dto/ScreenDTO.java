package rose.dto;

public class ScreenDTO {
	private int screenID;
	private int theaterID;
	private String screenName;
	private int screenType;
	private int seatCnt;
	
	public int getScreenID() {
		return screenID;
	}
	public void setScreenID(int screenID) {
		this.screenID = screenID;
	}
	public int getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(int theaterID) {
		this.theaterID = theaterID;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public int getScreenType() {
		return screenType;
	}
	public void setScreenType(int screenType) {
		this.screenType = screenType;
	}
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	
	
}
