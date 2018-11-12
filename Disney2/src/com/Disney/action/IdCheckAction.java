package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.Disney.dao.MemberDAO;

public class IdCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IdCheckAction ActionForward");
		
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("id");
		System.out.println("id : "+ userid);
		
		if(userid != null) {
			if(userid.trim().equals("")==false) {
				MemberDAO mDao = MemberDAO.getInstance();
				String msg = mDao.confirmID(userid);
				
				/*Ajax => Json 방식 => 값을 다시 전달 json방식
				 * request.setAttribute("idCount",msg);=>이거쓰면안됨
				 * */
				System.out.println("msg");
				System.out.println(msg);
				//json-simple라이브러리 필요
				JSONObject jobj = new JSONObject();
				
				jobj.put("message",msg);
				jobj.put("id",userid);
				
				//JSON객체에 담은 데이터를 호출한 페이지로 전송하는 기능
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jobj);
			}
		}
		return null;
	}

}
