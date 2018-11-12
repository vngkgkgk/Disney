package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.Disney.dao.MemberDAO;
import com.Disney.dto.MemberDTO;

public class LoginPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id+","+pw);
		
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.loginCheck(id,pw);
		
		String message=null;
		if(mDto!=null) {//로그인 성공
			//세션값에 login된 회원정보를 담아야함 
			session.removeAttribute("id");
			//session은 dto객체로 값받기 list는 안됨
			session.setAttribute("loginUser", mDto);
			message="1";
		}else {
			message="-1";
		}
		JSONObject jObj=new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
