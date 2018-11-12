package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.Disney.dao.MemberDAO;

public class PwCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		
		MemberDAO mDao = MemberDAO.getInstance();
		String message = mDao.confirmPW(id, pw);

		System.out.println("msg: " + message);
		JSONObject jobj = new JSONObject();
		jobj.put("message", message);
		
		//JSON객체에 담은 데이터를 호출한 페이지로 전송하는 기능
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jobj);
		
		//id값을 구하는 방법 2가지 (session)
		//1. controller단에서 session객체 호출해서 id값 빼오는 방법
		//2. view단에서 session에 담겨있는 id값 빼오는것 
		//2번이 훨씬쉬움
		
		return null; //페이지 이동 안할꺼니까 null들어가는 것임 
	
	}

}
