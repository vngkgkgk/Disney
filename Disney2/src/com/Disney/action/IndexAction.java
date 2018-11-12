package com.Disney.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.dao.ProductDAO;
import com.Disney.dto.ProductDTO;

public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.jsp";
		//동작하는 부분
		//: BEST상품을 출력 => BEST상품을 DB에서 조회
		//MODEL단으로 이동 (DAO)
		/*ProductDAO pDao = new ProductDAO();
		ArrayList<ProductDTO> bestlist = new ArrayList<>();
		bestlist = pDao.bestView();*/
		//싱글톤패턴 
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bestList = pDao.bestView();
		
		request.setAttribute("bestlist", bestList);
		
		ActionForward forward = new ActionForward();
		
		//매개변수로 url값 ("index.jsp")을 전송
		forward.setPath(url); //index.jsp로 이동
		//ActionForward 클래스에 setRedirect()메서드를 호출
		//매개변수로 boolean타입의 false값을 전송
		forward.setRedirect(false); //forward방식을 사용 
		
		return forward; 
	}
	
}
