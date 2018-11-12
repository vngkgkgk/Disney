package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Disney.dao.MemberDAO;
import com.Disney.dto.MemberDTO;

public class MemberUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		HttpSession session = request.getSession();
		//view단에서 전송한 데이터를 받아오자
		String id =request.getParameter("member_id");
		String name = request.getParameter("usr_name");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("sample6_postcode");
		String addr1 = request.getParameter("sample6_address");
		String addr2 = request.getParameter("sample6_address2");
		String emailid = request.getParameter("email1");
		String emailurl = request.getParameter("email2");
		String email = emailid +"@"+emailurl;
		
		MemberDTO mDto = new MemberDTO(id, name, phone, zipcode, addr1, addr2, email);
		System.out.println(mDto.toString());
		MemberDAO mDao= MemberDAO.getInstance();
		int result = mDao.updateMember(mDto);
		
		if(result > 0) {//성공	
			url="index.bizpoll";
			//세션값을 최신정보로 수정!!
			session.removeAttribute("id"); // 기존 남아있는 값
			//최신 회원 정보 
			session.setAttribute("loginUser", mDto);
			//DB로 select 최신 회원 정보 
		}else {//실패
			System.out.println("실패");
			url="memberUpdate.bizpoll";
		}
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	
		
	}

}
