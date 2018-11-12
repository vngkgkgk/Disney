package com.Disney.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Disney.common.Constants;
import com.Disney.dao.BoardDAO;
import com.Disney.dto.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.net.aso.e;

public class BoardInsertPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("오냐");
		String url ="boardList.bizpoll";
		
		//multipart를 사용하기 위해서는 
		//cos.jar라는 라이브러리가 필요함 
		
		//file업로드 처리
		File uploadDir = new File(Constants.UPLOAD_PATH);
		if(!uploadDir.exists()) {//저장할 경로가 없다면
			uploadDir.mkdir(); //디렉토리를 생성하세요
		}
		//request를 확장 시킨 multpartRequest생성
		//request는 전부 String 타입
		//file <- request로는 정송 불가
		//file <- request를 향상시킨 MultipartRequest를 사용 
		//파일 뿐만아니라 기존에 String 타입도 전부 multi타입으로 받아야함 
		MultipartRequest multi = new MultipartRequest(request, //request
													  Constants.UPLOAD_PATH, //파일업로드 디렉토리
													  Constants.MAX_UPLOAD, //업로드 최대 용량
													  "UTF-8", //인코딩
													  new DefaultFileRenamePolicy()); // 파일 이름 
				
		
		String title = multi.getParameter("bc_title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("bc_writer_name");
		String filename = " ";//공백 
		int filesize=0;
		
		System.out.println(title +","+content+","+writer);
		
		try {
			Enumeration files = multi.getFileNames(); 
			
			while(files.hasMoreElements()) {
				String file1 =(String)files.nextElement();
				filename=multi.getFilesystemName(file1); // 첨부파일의 파일이름
				File fl = multi.getFile(file1); // 첨부파일의 파일
				
				if(fl!=null) {
					filesize=(int)fl.length(); // 첨부파일의 파일 사이즈 저장 
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(filename ==null || filename.trim().equals("")) {
			filename="-";
		}
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		int result = bDao.boardInsert(bDto);
		
		if(result>0) {
			System.out.println("게시글 등록성공");
		}else {
			System.out.println("게시글 등록 실패");
		}
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
