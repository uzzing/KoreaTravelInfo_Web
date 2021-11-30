package com.scit.team4.vo;

public class user_Info {
	private String userid; 
	private String userpwd; 
	
	public user_Info() {
		// TODO Auto-generated constructor stub
	}

	public user_Info(String userid, String userpwd) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	@Override
	public String toString() {
		return "user_Info [userid=" + userid + ", userpwd=" + userpwd + "]";
	}
	
}
