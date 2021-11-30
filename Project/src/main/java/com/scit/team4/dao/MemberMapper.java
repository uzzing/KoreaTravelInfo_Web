package com.scit.team4.dao;

import com.scit.team4.vo.administrator;
import com.scit.team4.vo.user_Info;

public interface MemberMapper {

	public user_Info selectMember(String userid);
	public administrator selectAdmin(String adminid);
	public int join(user_Info vo);
}
