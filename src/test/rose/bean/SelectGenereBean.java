package test.rose.bean;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

@Controller
public class SelectGenereBean {

	private List list = null;
	
	@RequestMapping()
	public String execute() throws IOException {
		Reader reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		SqlMapClient sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		try {
			list = sqlMapper.queryForList("getAllGenre");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
}
