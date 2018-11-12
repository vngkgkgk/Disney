package com.Disney.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.Disney.dto.MemberDTO;
import com.Disney.mybatis.SqlMapConfig;
import com.Disney.common.DBManager;

public class MemberDAO {

	
	/*Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = new ArrayList<>();
	int result=0;
	MemberDTO mDto;
	
	
	public int inputMember(MemberDTO mDto){
		try {
			conn=DBManager.getConnection();
			String sql = "INSERT INTO member(id, pw, name, phone, zipcode,addr1,addr2,email) "
					+ "VALUES(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getId());
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getName());
			pstmt.setString(4, mDto.getPhone());
			pstmt.setString(5, mDto.getZipcode());
			pstmt.setString(6, mDto.getAddr1());
			pstmt.setString(7, mDto.getAddr2());
			pstmt.setString(8, mDto.getEmail());
			
			result = pstmt.executeUpdate(); //DB에 넣게 실행해줘 
			//CONNECTION맺은 DB로 가서 업데이트 실행해줘 
			
		}catch(Exception e) { //try 구문 안에서 예외처리 일어나야 실행됨
			e.printStackTrace();
		}finally { //무조건 실행 
			DBManager.close(conn, pstmt); //반드시실행해야하니까 무조건 실행되는 finally에 넣어준것
		}
				return result; //메서드 종료
				//return값(=result)를 가지고 나를 호출한 곳으로 돌아간다.
	}
	
	public MemberDTO loginCheck(String uid,String upw) {
		try {
			conn=DBManager.getConnection();
			String sql ="SELECT * FROM member WHERE id =? AND pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String zipcode = rs.getString("zipcode");
				String addr1 = rs.getString("addr1");
				String addr2 = rs.getString("addr2");
				String email = rs.getString("email");
				Date regdate = rs.getDate("regdate");
				mDto = new MemberDTO(id, pw, name, phone, zipcode, addr1, addr2, email, regdate);
				System.out.println(mDto.toString()); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mDto;
	}
	
	//회원정보수정
	public int updateMember(MemberDTO mDto) {
		try {
			conn= DBManager.getConnection();
			String sql = "UPDATE member SET "
					+ "name=?, "
					+ "phone=?, "
					+ "zipcode=?, "
					+ "addr1=?, "
					+ "addr2=?, "
					+ "email=? "
					+ "WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2, mDto.getPhone());
			pstmt.setString(3, mDto.getZipcode());
			pstmt.setString(4, mDto.getAddr1());
			pstmt.setString(5, mDto.getAddr2());
			pstmt.setString(6, mDto.getEmail());
			pstmt.setString(7, mDto.getId());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	//Ajax를 활용한 id중복체크
	public int confirmID(String userid) {
		int message = 0;
		System.out.println("confirmid");
		
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT id FROM member WHERE id =?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				//중복된 아이디
				message=-1;
			}else {
				message=1;
			}
				
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return message;
	}
	
	
	//Ajax를 활용한 현재 비밀번호
		public int confirmPW(String userid,String userpw) {
			int message = 0;
			System.out.println("confirmid");
			System.out.println("confirmpw");
			try {
				conn=DBManager.getConnection();
				String sql = "SELECT id,pw FROM member WHERE id =? AND pw=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, userpw);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					//중복된 
					message=-1;
				}else {
					message=1;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			return message;
		}
		public int updatePw(String userId, String userPw) {
			int result =0;
			try {
				conn=DBManager.getConnection();
				String sql="UPDATE MEMBER SET "
						+ "pw = ? "
						+ "WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userPw);
				pstmt.setString(2, userId);
				result = pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
			return result;
			
		}*/
		
	//Mybatis셋팅값호출
	
		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		
		//mapper에 접근하기위한  sqlSession
		SqlSession sqlSession;
		
		//싱글톤으로 NEW 없이 사용하기 때문에 
		//다른곳에 NEW객체 생성 못하게 private으로 막음
		private MemberDAO() {}
		
		//싱글톤 패턴 - 객체 생성 1회 실시 후  공유해서 사용
		//객체 생성1차
		private static MemberDAO instance= new MemberDAO();	
		
		//외부에서 getInstance를 활용하여 1회실시간 객체를 공유 
		public static MemberDAO getInstance() {
			return instance;
		}
		
		//회원가입 = 회원 등록
		public int inputMember(MemberDTO mDto) {
			int result=0;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result=sqlSession.insert("inputMember",mDto);
				sqlSession.commit();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return result;
		}
		//회원가입 페이지 id중폭체크(Ajax)
		public String confirmID(String userid) {
			String result=null;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result=sqlSession.selectOne("confirmID",userid);
				
				if(result!=null) {
					result ="-1";
				}else {
					result="1";
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return result;
		}
		
		//비밀번호 수정 페이지 현재비밀번호와 일치하는 지 비밀번호 중복체크
		public String confirmPW(String userid,String userpw) {
			String result=null;
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setId(userid);
			mDto.setPw(userpw);
			try {
				result=sqlSession.selectOne("confirmPW",mDto);
				
				if(result!=null) {
					result ="-1";
				}else {
					result="1";
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return result;
		}
		public int updatePw(String userid, String userpw) {
			int result=0;
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setId(userid);
			mDto.setPw(userpw);
			try {
				result=sqlSession.update("updatePw", mDto);
				sqlSession.commit();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return result;
		}
		
		
		//로그인 가능 
		public MemberDTO loginCheck(String userid,String userpw) {
			sqlSession = sqlSessionFactory.openSession();
			MemberDTO mDto = new MemberDTO();
			mDto.setId(userid);
			mDto.setPw(userpw);
			try {
				mDto=sqlSession.selectOne("loginCheck",mDto);
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return mDto;
		}
		public int updateMember(MemberDTO mDto) {
			int result = 0;
			sqlSession = sqlSessionFactory.openSession();
			try {
				result=sqlSession.update("updateMember",mDto);
				sqlSession.commit();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return result;
		}
		public int deleteMember(String userid) {
			int flag=0;
			sqlSession = sqlSessionFactory.openSession();
			try {
				flag = sqlSession.delete("deleteMember",userid);
				sqlSession.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return flag;
		}
}
