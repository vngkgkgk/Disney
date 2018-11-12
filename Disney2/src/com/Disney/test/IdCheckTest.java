package com.Disney.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.Disney.dao.MemberDAO;

public class IdCheckTest {
	String userid="aa11";
	@Test
	public void testConfirmID() {
		
		
		MemberDAO mDao = MemberDAO.getInstance();		
		mDao.confirmID(userid);

	}

}
