package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.Disney.dao.MemberDAO;
import com.Disney.dto.MemberDTO;

public class MemberDeletePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";
		System.out.println("탈퇴할꺼다.");
		
		HttpSession session = request.getSession();
		String userid = request.getParameter("id");
		String userpw = request.getParameter("pw");
		System.out.println(userid+","+userpw);
		
		
		MemberDAO mDao = MemberDAO.getInstance();
		String message = mDao.confirmPW(userid, userpw);
		//회원 탈퇴기능 
		if(message.equals("-1")) {//로그인 성공
			System.out.println("회원삭제");
			int flag = mDao.deleteMember(userid);
			if(flag>0) {
				if(session != null) {
					//session을 초기화 => 로그인 정보 삭제
					session.invalidate();
				}
			}else {
				message="-1";
			}
		}
		JSONObject jObj=new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
