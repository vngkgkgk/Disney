package com.Disney.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.Disney.dto.BoardDTO;
import com.Disney.dto.CriteriaDTO;
import com.Disney.mybatis.SqlMapConfig;

public class BoardDAO {

	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	//mapper에 접근하기위한  sqlSession
	SqlSession sqlSession;
	
	//싱글톤으로 NEW 없이 사용하기 때문에 
	//다른곳에 NEW객체 생성 못하게 private으로 막음
	private BoardDAO() {}
	
	//싱글톤 패턴 - 객체 생성 1회 실시 후  공유해서 사용
	//객체 생성1차
	private static BoardDAO instance= new BoardDAO();	
	
	//외부에서 getInstance를 활용하여 1회실시간 객체를 공유 
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public List<BoardDTO> boardListAll(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList("boardList",criDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.selectOne("countPaging",criDto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	public List<BoardDTO> boardSearch(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = null;
		
		try {
			list = sqlSession.selectList("searchList",criDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	public BoardDTO boardDetailView(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		BoardDTO bDto = null;
		try {
			bDto = sqlSession.selectOne("boardDetailView", bno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return bDto;
	}
	public void viewcnt(String bno,HttpSession countSession) {
		sqlSession = sqlSessionFactory.openSession();
		int result=0;
		try {
			
			long update_time=0;
			//조회수를 증가할때 생기는 read_time 게시글 번호가 없으면
			//현재 처음 조회수를 1증가하는 경우
			if(countSession.getAttribute("read_time"+bno)!=null) {
				update_time = (long)countSession.getAttribute("read_time"+bno);
			}
			//현재시간을 담는다 
			long current_time = System.currentTimeMillis(); //10시 30분 10초
			
			//현재시간과 조회수 1증가한 시간을 비교해서 24시간(1일)이 지났으면 조회수 1증가
			if(current_time-update_time>24*60*60*1000) {
				result = sqlSession.update("viewcnt",bno);
				sqlSession.commit();
			}
			//조회수 1증가한 시간을 session에 담는다
			countSession.setAttribute("read_time"+bno, current_time);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}
	public int boardInsert(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result=0;
		try {
			result=sqlSession.insert("boardInsert",bDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	
}
