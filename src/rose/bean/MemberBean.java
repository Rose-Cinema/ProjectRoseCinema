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
	//���� ��¥ ���ϱ�
	int nowYear=cal.get(Calendar.YEAR);
	
	
	int check;
	
	MemberInfoDTO mem11;
	MemberInfoDTO mem22;
	
	
	@Autowired
	private SqlMapClientTemplate sqlMapClient;
	
	
	//********ȸ������
	@RequestMapping("/inputForm")
	public String inputform(){
		System.out.println("ȸ������form");
		
		return "/member/inputForm.jsp";
	}
	
	@RequestMapping("/inputPro")
	public String inputpro(MemberInfoDTO dto, HttpServletRequest request){ //�α��� ���� �������� dto
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
	
	//*****�α���
	@RequestMapping("/loginForm")
	public String loginform(){
		System.out.println("form");
		
		return "/member/loginForm.jsp";
	}
	
	@RequestMapping("/loginPro")
	public String loginpro(MemberInfoDTO dto, HttpSession session, HttpServletRequest request){ //�α��� ���� �������� dto, ����Ȯ���ϴ� session �Ű����� ������
		check = (Integer)sqlMapClient.queryForObject("member.userCheck", dto);
		
		session.setAttribute("logincheck", check);
		 
		
		mem11=(MemberInfoDTO)sqlMapClient.queryForObject("member.meminfo", dto);		
		System.out.println(mem11.getName());
		
		session.setAttribute("memName", mem11.getName());
		session.setAttribute("memNum", mem11.getMember_id());
		//request.setAttribute("memName", mem11.getName());
		//�ϴ� �������� ����!!!!
		
		
		if(check==1){
			session.setAttribute("memId", dto.getId());
		}
		
		else session.setAttribute("memId", "loginfail") ;
		
		return "/member/loginPro.jsp";
	}
	
	
	@RequestMapping("/logout")
	public String logout(){
		System.out.println("�α׾ƿ�");
		
		return "/member/logout.jsp";
	}
	
	
	
	//******ȸ����������
	@RequestMapping("/modifyForm")
	public String modifyform(HttpSession session){
		
		//���ǰ��̶� �´� id�� �ҷ��ͼ� �� ���� �־��ֱ�. request.setAttribute("name", dto.getName()); �̿�
		
		return "/member/modifyForm.jsp";
		
	}
	
	
	
	//*******ȸ��Ż��
	@RequestMapping("/deleteForm")
	public String deleteform(){
		
		return "/member/deleteForm.jsp";		
	}	

	@RequestMapping("/deletePro")
	public String deletepro(MemberInfoDTO dto, HttpSession session){ 
		
		session.setAttribute("memId", dto.getId()); //�̰� ���߿� ���� �� �غ���!!
		
		int pwcheck = (Integer)sqlMapClient.queryForObject("member.userCheck", dto);
		//deleteform���� �޾ƿ� pw���� dto�� ���� ��ġ�ϴ��� Ȯ���ϴ� �������ϳ� select count�� ¥�� ������ 0 or 1�� �־��ذ�
		
		System.out.println(pwcheck+"pwȮ��@@@@@");
		
			if(pwcheck==1){
				sqlMapClient.delete("member.delete", dto);
				//�� �� pwcheck�� deletePro.jsp�� �Ѱ��ֱ�
				
			}
			
			else 
				//pwcheck 0�� deletePro.jsp�� �Ѱ��ֱ�
				;
		
		return "/member/deletePro.jsp";
		}
	
	
	//*************�α���, ���������� �ִ� ����������
	@RequestMapping("/maintestForm")
	public String maintestform(MemberInfoDTO dto, HttpServletRequest request){ //loginPro.jsp���� �޾ƿ� ���� �� jsp�������� ������Ѿ� �Ѵ�. 
		
		request.setAttribute("logincheck", check);
		request.setAttribute("nowYear", nowYear);
		
		if(check==1){
			request.setAttribute("memName", mem11.getName());
		}
		
		//���⼱ form��ü ���� ���޴´�!!!
		
		
		
		return "/maintest/maintestForm.jsp";
		
	}
	
	
	@RequestMapping("/mypageForm")
	public String mypageform(MemberInfoDTO dto, HttpServletRequest request, HttpSession session){
		
		String id = (String)session.getAttribute("memId");
		id += "_hitory";
		
		
		//ȸ�����̵�, ȸ���̸��ҷ�����
		request.setAttribute("nowYear", nowYear);
		
		//maintestForm.jsp���� hidden���� ���� ����!!
		//String memI=request.getParameter("memId");
		String memN =request.getParameter("memNum");
		String nowY=request.getParameter("nowYear"); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("hitoryId", id);
		//map.put("memNum", memN);
		map.put("nowYear", nowY);
		
		String grade = (String)sqlMapClient.queryForObject("mypage.mgradename", map);
		System.out.println(grade+"��޵��");
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
		sqlfweiufewfwo��������������Ʈ

	
		return "sdfsdfsdf.jsp"
	}*/
	
}
