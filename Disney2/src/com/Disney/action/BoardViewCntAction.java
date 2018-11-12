package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Disney.dao.BoardDAO;

public class BoardViewCntAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bno = request.getParameter("bno");
		
		System.out.println(bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		//조회수 1 증가
		//Session을 활용한 조회수 증가 방지
		HttpSession session = request.getSession();
		bDao.viewcnt(bno,session);
		
		String url ="boardDetail.bizpoll?bno="+bno; 
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
}
