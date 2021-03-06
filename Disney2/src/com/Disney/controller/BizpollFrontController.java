package com.Disney.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.action.Action;
import com.Disney.action.ActionForward;
import com.Disney.action.BoardDetailAction;
import com.Disney.action.BoardDownloadAction;
import com.Disney.action.BoardInsertAction;
import com.Disney.action.BoardInsertPlayAction;
import com.Disney.action.BoardListAction;
import com.Disney.action.BoardSearchAction;
import com.Disney.action.BoardUpdateAction;
import com.Disney.action.BoardViewCntAction;
import com.Disney.action.ConstractAction;
import com.Disney.action.IdCheckAction;
import com.Disney.action.IndexAction;
import com.Disney.action.LoginAction;
import com.Disney.action.LoginOutPlayAction;
import com.Disney.action.LoginPlayAction;
import com.Disney.action.MemberAction;
import com.Disney.action.MemberDeleteAction;
import com.Disney.action.MemberDeletePlayAction;
import com.Disney.action.MemberPlayAction;
import com.Disney.action.MemberUpdateAction;
import com.Disney.action.MemberUpdatePlayAction;
import com.Disney.action.PwChangeAction;
import com.Disney.action.PwCheckAction;
import com.Disney.action.PwUpdatePlayAction;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BizpollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//GET,POST 둘다 받음
		//한글깨짐 방지(POST)방식 : 가장 위에 적기
		request.setCharacterEncoding("UTF-8");
		
		Action action = null; // 실제 동작하는 부분
		ActionForward forward = null; //forward/sendRedirect 설정 - 페이지 이동
		
		//request =요청 / getRequesturi = 를 주세요 
		//uri= /disney2/index.bizpoll
		//ctx=/disney2
		//command = /index.bizpoll
		//uri-ctx = 내가 원하는 Action경로
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		
		System.out.println("uri: "+uri);
		System.out.println("ctx: "+ctx);
		System.out.println("페이지 이동==> "+command);
	
		//Action단 이동
		if(command.equals("/index.bizpoll")) {
			action = new IndexAction(); //객체 생성
			forward = action.excute(request, response);
			//Web에서는 무조건 request, response를 매개변수로 
		}else if(command.equals("/constract.bizpoll")) {
			action = new ConstractAction();
			forward = action.excute(request, response);
		}else if(command.equals("/member.bizpoll")) {
			action = new MemberAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberplay.bizpoll")) {
			action = new MemberPlayAction(); //객체생성 
			forward = action.excute(request, response);//action함수실행.action안에있는 excute함수실행
			//web에서는 request, response를 매개변수로 무조건 따라간다.
		}else if(command.equals("/login.bizpoll")) {
			action = new LoginAction();
			forward = action.excute(request, response);
		}else if(command.equals("/loginplay.bizpoll")) {
			action = new LoginPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/loginOut.bizpoll")) {
			action = new LoginOutPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberUpdate.bizpoll")) {
			action = new MemberUpdateAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberupdateplay.bizpoll")) {
			action = new MemberUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/idCheck.bizpoll")) {
			action = new IdCheckAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwChange.bizpoll")) {
			action = new PwChangeAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwCheck.bizpoll")) {
			action = new PwCheckAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberpwplay.bizpoll")) {
			action = new PwUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberDelete.bizpoll")) {
			action = new MemberDeleteAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberdeletplay.bizpoll")) {
			action = new MemberDeletePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardList.bizpoll")) {
			action = new BoardListAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardSearch.bizpoll")) {
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardDetail.bizpoll")) {
			action = new BoardDetailAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardViewCnt.bizpoll")) {
			action = new BoardViewCntAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardInsert.bizpoll")) {
			action = new BoardInsertAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardInsertPlay.bizpoll")) {
			action = new BoardInsertPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/download.bizpoll")) {
			action = new BoardDownloadAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardUpdate.bizpoll")) {
			action = new BoardUpdateAction();
			forward = action.excute(request, response);
		}
		
		//공통 분기작업(페이지이동)
		if(forward != null) {
			if(forward.isRedirect()) {// true: sendRedirect방식
				response.sendRedirect(forward.getPath());
			}else {//false : forward방식
				//목적지 : index.jsp
				//짐 : bestlist
				//이동수단 : forward
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}
