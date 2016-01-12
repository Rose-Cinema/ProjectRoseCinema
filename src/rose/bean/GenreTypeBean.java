package rose.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.DTO.GenreTypeDTO;

@Controller
public class GenreTypeBean {
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	@RequestMapping("")
	public List<GenreTypeDTO> getGenreList(){
		List<GenreTypeDTO> Genre_list = (List<GenreTypeDTO>)sqlMapClient.queryForList("genre.getGenreList", null);
		return Genre_list;
	}
	@RequestMapping("")
	public GenreTypeDTO getGenre_Type(@PathVariable("genre_id")int genre_id){
		GenreTypeDTO genre_info = (GenreTypeDTO)sqlMapClient.queryForObject("genre.getGenre_Type", genre_id);
		return genre_info;
	}

}
