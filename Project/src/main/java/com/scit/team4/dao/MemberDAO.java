package com.scit.team4.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.team4.vo.administrator;
import com.scit.team4.vo.user_Info;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	public user_Info selectMember(String userid) {

		user_Info member = null;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.selectMember(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
	public administrator selectAdmin(String adminid) {

		administrator admin = null;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			admin = mapper.selectAdmin(adminid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return admin;
	}
	
	public int join(user_Info vo) {
		int cnt = 0;
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.join(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
