package rose.bean;

import java.util.Calendar;
import java.util.HashMap;

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
	@RequestMapping("/inputForm.do")
	public String inputform(){
		System.out.println("ȸ������form");
		
		return "/member/inputForm.jsp";
	}
	
	@RequestMapping("/inputPro.do")
	public String inputpro(MemberInfoDTO dto, HttpServletRequest request){ //�α��� ���� �������� dto
		//sqlMapClient.queryForObject("member.join", dto);
	
		sqlMapClient.insert("member.join", dto);
		request.setAttribute("name", dto.getName()); 

		return "/member/inputPro.jsp";
	}
	
	//*****�α���
	@RequestMapping("/loginForm.do")
	public String loginform(){
		System.out.println("form");
		
		return "/member/loginForm.jsp";
	}
	
	@RequestMapping("/loginPro.do")
	public String loginpro(MemberInfoDTO dto, HttpSession session, HttpServletRequest request){ //�α��� ���� �������� dto, ����Ȯ���ϴ� session �Ű����� ������
		check = (Integer)sqlMapClient.queryForObject("member.userCheck", dto);
		
		request.setAttribute("logincheck", check);
		 
		
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
	
	
	
	//******ȸ����������
	@RequestMapping("/modifyForm.do")
	public String modifyform(HttpSession session){
		
		//���ǰ��̶� �´� id�� �ҷ��ͼ� �� ���� �־��ֱ�. request.setAttribute("name", dto.getName()); �̿�
		
		return "/member/modifyForm.jsp";
		
	}
	
	
	
	//*******ȸ��Ż��
	@RequestMapping("/deleteForm.do")
	public String deleteform(){
		
		return "/member/deleteForm.jsp";		
	}	

	@RequestMapping("/deletePro.do")
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
	
	
	@RequestMapping("/mypageForm.do")
	public String mypageform(MemberInfoDTO dto, HttpServletRequest request){
		
		//ȸ�����̵�, ȸ���̸��ҷ�����
		request.setAttribute("nowYear", nowYear);
		
		//maintestForm.jsp���� hidden���� ���� ����!!
		//String memI=request.getParameter("memId");
		String memN =request.getParameter("memNum");
		String nowY=request.getParameter("nowYear"); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memNum", memN);
		map.put("nowYear", nowY);
		
		String grade = (String) sqlMapClient.queryForObject("mypage.mgradename", map);
		System.out.println(grade+"��޵��");
		request.setAttribute("grade", grade);
		
		
		return "/mypage/mypageForm.jsp";
	}
	
	
	@RequestMapping("/gradehistoryForm.do")
	public String gradehistoryform(MemberInfoDTO dto, HttpServletRequest request){	
		
		String memN =request.getParameter("memNum");
		String nowY=request.getParameter("nowYear"); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memNum", memN);
		map.put("nowYear", nowY);
		
		/*
		 for(int i= nowYear; i< nowYear-5;  i++){
			 
			 map.put("nowYear", nowY);
			 
			 if(10�� ���Ϸ� ȸ���̸�, mgradehistory���̺� ){
				 System.out.println("���� ����");
			 }
		 
		 		String grade = (String) sqlMapClient.queryForObject("mypage.mgradename", map);
		 }*/ 
		
		//for������ queryforobject������. 
		
		return "/mypage/gradehistoryForm.jsp";
	}
	
	
	
	
	
	
	
	/*
	@RequestMapping("sdkjlfhsdkf.do")
	public String vodsfosdf() {
		f
		sdfsdl
		sqlfweiufewfwo��������������Ʈ

	
		return "sdfsdfsdf.jsp"
	}*/
	
}
