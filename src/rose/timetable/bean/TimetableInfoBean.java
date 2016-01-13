package rose.timetable.bean;

import java.text.SimpleDateFormat;
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
		sdf = new SimpleDateFormat("HHmm");
		String time = sdf.format(today.getTime());
		
		return getTimetablebyTheater(theater_id, date, time);
	}
	
	@RequestMapping(value = "/timetable/theater/{theater_id}/date/{date}/time/{time}", method = RequestMethod.GET)
	@ResponseBody
	public List<Timetable> getTimetablebyTheater(@PathVariable("theater_id") int theater_id, @PathVariable("date") String date, @PathVariable("time") String time) {
		
		Timetable timetable = new Timetable();
		timetable.setTheater_id(theater_id);
		timetable.setDate_info(date);
		timetable.setStart_time(time);
		
		List<Timetable> timetable_list = (List<Timetable>)sqlMapClient.queryForList("timetable.getTimetablebyTheater", timetable);

		return timetable_list;
	}
	
	@RequestMapping(value = "/timetable", method = RequestMethod.POST)
	@ResponseBody
	public List<Timetable> setNewTimetable(@RequestBody Timetable new_timetable) {
		sqlMapClient.queryForObject("timetable.setNewTimetable", new_timetable);
		return getTimetables();
	}
	
	/*SAMARA907*/
	@RequestMapping("/selectAllTimetable")
	@ResponseBody
	public List<Timetable> selectAllTimetable() {
		List<Timetable> timetableList = (List<Timetable>)sqlMapClient.queryForList("timetable.selectAllTimetable", null);
		return timetableList;
	}
	/*SAMRA907*/
	@RequestMapping("/selectDisMOVIEID")
	@ResponseBody
	public List<String> selectDisMOVIEID() {
		List<String> disMovieIDList = (List<String>)sqlMapClient.queryForList("timetable.selectDisMOVIEID", null);
		return disMovieIDList;
	}

}
