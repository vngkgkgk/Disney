package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.dao.MemberDAO;

public class PwUpdatePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";
		
		//변경할 비밀번호
		String id = request.getParameter("updateId");
		String pw = request.getParameter("member_pw");
		System.out.println("변경할 id : "+id);
		System.out.println("변경한 pw : "+pw);
		
		
		//값을 못받아온다! 
		//1. getParameter("") 매개변수가 name값으로 설정되있는지 확인
		//2. 현재 Action단으로 이동하는지 체크
		// -console창에 *.bizpoll이 출력되는지 확인 
		// 가) 안탐 -> 화면단가서 form태그에 acion속성값, submit()등을 확인
		// 나) 간다 -> 
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.updatePw(id,pw);
		
		if(result >0) {//수정성공
			System.out.println("성공");
			url ="index.bizpoll";
		}else {//수정실패
			System.out.println(result);
			System.out.println("실패");
			url = "pwChange.bizpoll";
		}
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
