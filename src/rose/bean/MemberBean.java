package rose.bean;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import rose.DTO.MemberInfoDTO;

@Controller
public class MemberBean {
	
	Calendar cal = Calendar.getInstance();
	//오늘 날짜 구하기
	int nowYear=cal.get(Calendar.YEAR);
	
	
	int check;
	
	MemberInfoDTO mem11;
	MemberInfoDTO mem22;
	
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	
	//********회원가입
	@RequestMapping("/inputForm")
	public String inputform(){
		System.out.println("회원가입form");
		
		return "/member/inputForm.jsp";
	}
	
	@RequestMapping("/inputPro")
	public String inputpro(MemberInfoDTO dto, HttpServletRequest request){ //로그인 정보 가져오는 dto
		//sqlMapClient.queryForObject("member.join", dto);
	
		sqlMapClient.insert("member.join", dto);
		
		String hitoryId = dto.getId()+"_hitory";
		sqlMapClient.insert("member.hitory", hitoryId);
		
		String mpointId = dto.getId() +"_mpoint";
		sqlMapClient.insert("member.mpoint", mpointId);		
		
		request.setAttribute("name", dto.getName()); 
		
		String nowY = Integer.toString(nowYear);
				
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("hitoryId", hitoryId);
		//map.put("memNum", memN);
		map.put("nowYear", nowY);
		
		sqlMapClient.insert("member.mgradeDefault", map);		

		return "/member/inputPro.jsp";
	}
	
	//*****로그인
	@RequestMapping("/loginForm")
	public String loginform(){
		System.out.println("form");
		
		return "/member/loginForm.jsp";
	}
	
	@RequestMapping("/loginPro")
	public String loginpro(MemberInfoDTO dto, HttpSession session, HttpServletRequest request){ //로그인 정보 가져오는 dto, 세션확인하는 session 매개변수 가져욤
		check = (Integer)sqlMapClient.queryForObject("member.userCheck", dto);
		
		session.setAttribute("logincheck", check);
		 
		
		mem11=(MemberInfoDTO)sqlMapClient.queryForObject("member.meminfo", dto);		
		System.out.println(mem11.getName());
		
		session.setAttribute("memName", mem11.getName());
		session.setAttribute("memNum", mem11.getMember_id());
		//request.setAttribute("memName", mem11.getName());
		//일단 세션으로 지정!!!!
		
		
		if(check==1){
			session.setAttribute("memId", dto.getId());
		}
		
		else session.setAttribute("memId", "loginfail") ;
		
		return "/member/loginPro.jsp";
	}
	
	
	@RequestMapping("/logout")
	public String logout(){
		System.out.println("로그아웃");
		
		return "/member/logout.jsp";
	}
	
	
	
	//******회원정보수정
	@RequestMapping("/modifyForm")
	public String modifyform(HttpSession session){
		
		//세션값이랑 맞는 id값 불러와서 그 값들 넣어주기. request.setAttribute("name", dto.getName()); 이용
		
		return "/member/modifyForm.jsp";
		
	}
	
	
	
	//*******회원탈퇴
	@RequestMapping("/deleteForm")
	public String deleteform(){
		
		return "/member/deleteForm.jsp";		
	}	

	@RequestMapping("/deletePro")
	public String deletepro(MemberInfoDTO dto, HttpSession session){ 
		
		session.setAttribute("memId", dto.getId()); //이거 나중에 빼고 함 해보기!!
		
		int pwcheck = (Integer)sqlMapClient.queryForObject("member.userCheck", dto);
		//deleteform에서 받아온 pw값과 dto의 값이 일치하는지 확인하는 쿼리문하나 select count로 짜서 변수에 0 or 1값 넣어준것
		
		System.out.println(pwcheck+"pw확인@@@@@");
		
			if(pwcheck==1){
				sqlMapClient.delete("member.delete", dto);
				//그 후 pwcheck값 deletePro.jsp에 넘겨주기
				
			}
			
			else 
				//pwcheck 0값 deletePro.jsp에 넘겨주기
				;
		
		return "/member/deletePro.jsp";
		}
	
	
	//*************로그인, 마이페이지 있는 메인페이지
	@RequestMapping("/maintestForm")
	public String maintestform(MemberInfoDTO dto, HttpServletRequest request){ //loginPro.jsp에서 받아온 값을 이 jsp페이지에 노출시켜야 한다. 
		
		request.setAttribute("logincheck", check);
		request.setAttribute("nowYear", nowYear);
		
		if(check==1){
			request.setAttribute("memName", mem11.getName());
		}
		
		//여기선 form객체 당장 못받는다!!!
		
		
		
		return "/maintest/maintestForm.jsp";
		
	}
	
	
	@RequestMapping("/mypageForm")
	public String mypageform(MemberInfoDTO dto, HttpServletRequest request, HttpSession session){
		
		String id = (String)session.getAttribute("memId");
		id += "_hitory";
		
		
		//회원아이디, 회원이름불러오기
		request.setAttribute("nowYear", nowYear);
		
		//maintestForm.jsp에서 hidden으로 받은 값들!!
		//String memI=request.getParameter("memId");
		String memN =request.getParameter("memNum");
		String nowY=request.getParameter("nowYear"); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("hitoryId", id);
		//map.put("memNum", memN);
		map.put("nowYear", nowY);
		
		String grade = (String)sqlMapClient.queryForObject("mypage.mgradename", map);
		System.out.println(grade+"등급등급");
		request.setAttribute("grade", grade);
		
		
		return "/mypage/mypageForm.jsp";
	}
	
	
	@RequestMapping("/gradehistoryForm")
	public String gradehistoryform(HttpSession session , HttpServletRequest request){	
		String id = (String)session.getAttribute("memId");
		id += "_hitory";
		List list = sqlMapClient.queryForList("mypage.mgradehistory", id);
		
		//System.out.println(list.mgrade_id);
		
		request.setAttribute("history", list);
		return "/mypage/gradehistoryForm.jsp";
		
	}
	
	
	
	
	
	
	
	/*
	@RequestMapping("sdkjlfhsdkf")
	public String vodsfosdf() {
		f
		sdfsdl
		sqlfweiufewfwo쿼리포오리븢븣트

	
		return "sdfsdfsdf.jsp"
	}*/
	
}
