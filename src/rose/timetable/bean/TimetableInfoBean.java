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
		List<Timetable> timetable_list = (List<Timetable>)sqlMapClient.queryForList("timetable.getTimetableList", null);
		return timetable_list;
	}
	
	@RequestMapping(value = "/timetable/{timetable_id}", method = RequestMethod.GET)
	@ResponseBody
	public Timetable getTimetablesInfo(@PathVariable("timetable_id") int timetable_id) {
		Timetable timetable = (Timetable)sqlMapClient.queryForObject("timetable.getTimetableInfo", timetable_id);
		return timetable;
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
	
	@RequestMapping(value = "/timetables", method = RequestMethod.PUT)
	@ResponseBody
	public String editTimetable(@RequestBody Timetable timetable) {
		sqlMapClient.queryForObject("timetable.updateTimetable", timetable);
		return "edit";
	}
	
	@RequestMapping(value = "/timetables/{timetable_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteTimetable(@PathVariable("timetable_id") int timetable_id) {
		sqlMapClient.queryForObject("timetable.deleteTimetable", timetable_id);
		return "delete";
	}
	
	@RequestMapping(value = "/timetable/dates", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> getDatesAll() {

		SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
		Calendar today = Calendar.getInstance();
		String date = sdf.format(today.getTime());
		
		ArrayList<String> result = (ArrayList<String>)sqlMapClient.queryForList("timetable.getPlayDatesFromTimetableAll", date);
		return result;
	}
	
	@RequestMapping(value = "/timetable/dates/{theater_id}", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> getDatesTheater(@PathVariable("theater_id") int theater_id) {

		SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
		Calendar today = Calendar.getInstance();
		String date = sdf.format(today.getTime());

		Timetable tt = new Timetable();
		tt.setTheater_id(theater_id);
		tt.setDate_info(date);
		
		ArrayList<String> result = (ArrayList<String>)sqlMapClient.queryForList("timetable.getPlayDatesFromTimetable", tt);
		return result;
	}
	
	//SAMARA907
	@RequestMapping("/timetable/selectAllTimetable")
	@ResponseBody
	public ArrayList<Timetable> selectAllTimetable() {
		ArrayList<Timetable> TimetableList = (ArrayList<Timetable>)sqlMapClient.queryForList("timetable.selectAllTimetable", null);
		return TimetableList;
	}
}
