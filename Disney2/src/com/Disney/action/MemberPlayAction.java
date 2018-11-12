package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.dao.MemberDAO;
import com.Disney.dto.MemberDTO;

public class MemberPlayAction implements Action {

	@Override // excute 함수 
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "welcome.jsp"; // 페이지이동기능 x url문자열타입에 담아놓것
		//view단에서 전송한 데이터를 받아오자
		//무조건 name값으로 받아야해 ! id,class값으로는 못받아와!!!
		String id =request.getParameter("member_id");
		String pw = request.getParameter("member_pw");
		String name = request.getParameter("usr_name");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("sample6_postcode");
		String addr1 = request.getParameter("sample6_address");
		String addr2 = request.getParameter("sample6_address2");
		String emailid = request.getParameter("email1");
		String emailurl = request.getParameter("email2");
		String email = emailid +"@"+emailurl;
		
		System.out.println(id+","+pw+","+name+","+phone+","+zipcode+","+addr1+","+addr2+","+email);
		
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, zipcode, addr1, addr2, email);
		
		//싱글톤 패턴
		//객체 생성은 한번만 이루어지고
		//나머지는 생성된 객체를 빌려쓰는 형태로 작성됨 
		
		//메모리효율
		MemberDAO mDao= MemberDAO.getInstance();
		//MemberDAO클래스의 inputMember()메서드를 호출하고
		//View단에서 전달한 데이터를 mDto에 담아 보낸다.
		int result =mDao.inputMember(mDto);
		if(result > 0) { //회원가입 성공
			
		}else {//회원가입 실패
			url="memberaction.bizpoll";
		}
		//actionForward 객체 생성
		//forward 인스턴스생성
		ActionForward forward = new ActionForward();
		//ActionForward클래스의 setPath()함수를
		//호출하고 url값을 매개변수로 전달
		forward.setPath(url);
		//ActionForward클래스의 setRedirect()함수를 
		//호출하고 true라고 하는 boolean값을 매개변수로 전달 
		forward.setRedirect(true);
		
		
		return forward;
	}
	
}
