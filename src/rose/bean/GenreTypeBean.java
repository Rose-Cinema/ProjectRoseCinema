package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rose.dto.GenreDTO;

public class GenreTypeBean {

	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("/getAllGenreList")
	@ResponseBody
	public List<GenreDTO> getAllGenreList() {
		List<GenreDTO> genre_list = (List<GenreDTO>)sqlMapClient.queryForList("genre.getAllGenreList",null);
		return genre_list;
	}
	
	@RequestMapping("/getAllIdList")
	@ResponseBody
	public List<Integer> getAllIdList() {
		List<Integer> id_list = (List<Integer>)sqlMapClient.queryForObject("genre.getAllIdList", null);
		return id_list;
	}
	
	@RequestMapping("/getAllNameList")
	@ResponseBody
	public List<String> getAllNameList() {
		List<String> name_list = (List<String>)sqlMapClient.queryForList("genre.getAllNameList", null);
		return name_list;
	}
	
	@RequestMapping("/getGenreById")
	@ResponseBody
	public GenreDTO getGenreById(int genre_id) {
		GenreDTO genre = (GenreDTO)sqlMapClient.queryForObject("genre.getGenreById", genre_id);
		return genre;
	}
	
	@RequestMapping("/getGenreByName")
	@ResponseBody
	public GenreDTO getGenreByName(String genre_name) {
		GenreDTO genre = (GenreDTO)sqlMapClient.queryForObject("genre.getGenreByName", genre_name);
		return genre;
	}
	
	@RequestMapping("/getIdByName")
	@ResponseBody
	public int getIdByName(String genre_name) {
		int genre_id = (int)sqlMapClient.queryForObject("genre.getIdByName", genre_name);
		return genre_id;
	}
	
	@RequestMapping("/getNameById")
	@ResponseBody
	public String getNameById(int genre_id) {
		String genre_name = (String)sqlMapClient.queryForObject("genre.getNameById", genre_id);
		return genre_name;
	}
	
	@RequestMapping("/insertGenre")
	@ResponseBody
	public void insertGenre(GenreDTO genre) {
		sqlMapClient.queryForObject("genre.insertGenre", genre);
	}
	
	@RequestMapping("/updateName")
	@ResponseBody
	public int updateName(GenreDTO genre) {
		int success  = (int)sqlMapClient.queryForObject("genre.success", genre);
		return success;
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public int deleteById(int genre_id) {
		int success = (int)sqlMapClient.queryForObject("genre.deleteById", genre_id);
		return success;
	}
	
	@RequestMapping("/deleteByName")
	@ResponseBody
	public int deleteByName(String genre_name) {
		int success = (int)sqlMapClient.queryForObject("genre.deleteByName", genre_name);
		return success;
	}
}
