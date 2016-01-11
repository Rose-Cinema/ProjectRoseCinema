package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.dto.MovieDTO;

public class MovieInfoBean {
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/getAllMovieList")
	@ResponseBody
	public List<MovieDTO> getAllMovieList() {
		List<MovieDTO> movie_list = (List<MovieDTO>)sqlMapClient.queryForList("movie.getMovieList", null);
		return movie_list;
	}
	
	@RequestMapping("/getAllIdList")
	@ResponseBody
	public List<Integer> getAllIdList() {
		List<Integer> id_list = (List<Integer>)sqlMapClient.queryForList("movie.getAllIdList", null);
		return id_list;
	}
	
	@RequestMapping("/getAllNameList")
	@ResponseBody
	public List<String> getAllNameList() {
		List<String> name_list = (List<String>)sqlMapClient.queryForList("movie.getAllNameList", null);
		return name_list;
	}
	
	@RequestMapping("/getMovieById")
	@ResponseBody
	public MovieDTO getMovieById(int movie_id) {
		MovieDTO movie = (MovieDTO)sqlMapClient.queryForObject("movie.getMovieById", movie_id);
		return movie;
	}
	
	@RequestMapping("/getMovieByName")
	@ResponseBody
	public MovieDTO getMovieByName(String movie_name) {
		MovieDTO movie = (MovieDTO)sqlMapClient.queryForObject("movie.getMovieByName", movie_name);
		return movie;
	}
	
	@RequestMapping("/getIdByName")
	@ResponseBody
	public int getIdByName(String movie_name) {
		int movie_id = (int)sqlMapClient.queryForObject("movie.getIdByName", movie_name);
		return movie_id;
	}
	
	@RequestMapping("/getNameById")
	@ResponseBody
	public String getNameById(int movie_id) {
		String movie_name = (String)sqlMapClient.queryForObject("movie.getNameById", movie_id);
		return movie_name;
	}
	
	@RequestMapping("/insertMovie")
	@ResponseBody
	public void insertMovie(MovieDTO movie) {
		sqlMapClient.queryForObject("movie.insertMovie", movie);
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public int deleteById(int movie_id) {
		int success = (int)sqlMapClient.queryForObject("movie.deleteById", movie_id);
		return success;
	}
	
	@RequestMapping("/deleteByName")
	@ResponseBody
	public int deleteByName(String movie_name) {
		int success = (int)sqlMapClient.queryForObject("movie.deleteByName", movie_name);
		return success;
	}
}
