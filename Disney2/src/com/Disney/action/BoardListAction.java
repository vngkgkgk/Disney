package com.Disney.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.dao.BoardDAO;
import com.Disney.dto.BoardDTO;
import com.Disney.dto.CriteriaDTO;
import com.Disney.dto.PageMakerDTO;

public class BoardListAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String url ="board/boardlist.jsp";

		CriteriaDTO criDto = new CriteriaDTO();
		int page =1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호 : " + page);
		criDto.setPage(page);
		
		String flag=null;
		String keyword=null;
		
		if(request.getParameter("keyword")!=null) {
			System.out.println("검색가능");
			
			flag=request.getParameter("flag");
			keyword=request.getParameter("keyword");
			
			criDto.setFlag(flag);
			criDto.setKeyword(keyword);
			
			request.setAttribute("flag", flag);
			request.setAttribute("keyword", keyword);
		}
		BoardDAO bDao = BoardDAO.getInstance();
		
		//게시글 목록(정보들)출력
		List<BoardDTO> boardList = bDao.boardListAll(criDto);
		request.setAttribute("boardList", boardList);
		
		//현재 날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		
		
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		
		int totalcount = bDao.totalCount(criDto);
		System.out.println("총개수 " + totalcount);
		pageMaker.setTotalCount(totalcount);
		request.setAttribute("pageMaker", pageMaker);
		
		System.out.println("===========================================");
		System.out.println(pageMaker.toString());
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	

}
