package rose.timetable.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class TimetableInfoBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping(value = "/timetable", method = RequestMethod.GET)
	@ResponseBody
	public List<Timetable> getTimetables() {
		List<Timetable> timetable_list = (List<Timetable>)sqlMapClient.queryForList("timetable.getTimetables", null);
		return timetable_list;
	}
	
	@RequestMapping(value = "/timetable/theater/{theater_id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Timetable> getTimetablebyTheater(@PathVariable("theater_id") int theater_id) {

		SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
		Calendar today = Calendar.getInstance();
		String date = sdf.format(today.getTime());
		
		return getTimetablebyTheater(theater_id, date);
	}
	
	@RequestMapping(value = "/timetable/theater/{theater_id}/date/{date}", method = RequestMethod.GET)
	@ResponseBody
	public List<Timetable> getTimetablebyTheater(@PathVariable("theater_id") int theater_id, @PathVariable("date") String date) {
		
		Timetable timetable = new Timetable();
		timetable.setTheater_id(theater_id);
		timetable.setDate_info(date);

		SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
		Calendar today = Calendar.getInstance();
		String now_date = sdf.format(today.getTime());
		if( date.equals(now_date) ){
			sdf = new SimpleDateFormat("HHmm");
			String time = sdf.format(today.getTime());
			timetable.setStart_time(time);
		}
		else
			timetable.setStart_time("0000");
		
		List<Timetable> timetable_list = (List<Timetable>)sqlMapClient.queryForList("timetable.getTimetablebyTheater", timetable);

		return timetable_list;
	}
	
	@RequestMapping(value = "/timetables", method = RequestMethod.POST)
	@ResponseBody
	public String setNewTimetable(@RequestBody Timetable new_timetable) {
		sqlMapClient.queryForObject("timetable.setNewTimetable", new_timetable);
		return "add";
	}
	

	@RequestMapping(value = "/timetable", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteTimetable(@PathVariable int timetable_id) {
		sqlMapClient.queryForObject("timetable.deleteTimetable", timetable_id);
		return "delete";
	}
	
	@RequestMapping(value = "/timetable/dates/{theater_id}", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> getDates(@PathVariable("theater_id") int theater_id) {

		SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
		Calendar today = Calendar.getInstance();
		String date = sdf.format(today.getTime());

		Timetable tt = new Timetable();
		tt.setTheater_id(theater_id);
		tt.setDate_info(date);
		
		ArrayList<String> result = (ArrayList<String>)sqlMapClient.queryForList("timetable.getPlayDatesFromTimetable", tt);
		return result;
	}
}
