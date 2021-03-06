package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.dao.BoardDAO;
import com.Disney.dto.BoardDTO;
import com.sun.corba.se.impl.protocol.BootstrapServerRequestDispatcher;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="board/detail_boder.jsp";
		
		String bno = request.getParameter("bno");
		System.out.println(bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(bno);
		
		request.setAttribute("boardview",bDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
		
		
	}

}
