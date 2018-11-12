package com.Disney.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//Action : 인터페이스
	
	//추상메서드
	//꼭 사용하세요!! 
	
	//forward, sendRedirect 결정 => ActionForward로 함 
	public ActionForward excute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException;
	
}
