package rose.dto;

import java.util.Date;

public class MovieDTO {
	private int movie_id;
	private String movie_name;
	private String movie_image;
	private int ticket_rate;
	private int score;
	private Date opendate;
	private String director;
	private String actor;
	private int genre_id;
	private String synopsis;
	private String stilcut;
	private String video;
	private int grade_id;
	public int getMovie_id() {
		return movie_id;
	}
	
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_image() {
		return movie_image;
	}
	public void setMovie_image(String movie_image) {
		this.movie_image = movie_image;
	}
	public int getTicket_rate() {
		return ticket_rate;
	}
	public void setTicket_rate(int ticket_rate) {
		this.ticket_rate = ticket_rate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getOpendate() {
		return opendate;
	}
	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String drictor) {
		this.director = drictor;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getGenre_id() {
		return genre_id;
	}
	public void setGenre_id(int genre_id) {
		this.genre_id = genre_id;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getStilcut() {
		return stilcut;
	}
	public void setStilcut(String stilcut) {
		this.stilcut = stilcut;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public int getGrade_id() {
		return grade_id;
	}
	public void setGrade_id(int grade_id) {
		this.grade_id = grade_id;
	}
}
