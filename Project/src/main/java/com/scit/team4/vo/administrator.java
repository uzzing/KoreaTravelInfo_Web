package com.scit.team4.vo;

public class administrator {
	private String adminid; 
	private String adminpwd; 
	
	public administrator() {
		// TODO Auto-generated constructor stub
	}

	public administrator(String adminid, String adminpwd) {
		super();
		this.adminid = adminid;
		this.adminpwd = adminpwd;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpwd() {
		return adminpwd;
	}

	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}

	@Override
	public String toString() {
		return "administrator [adminid=" + adminid + ", adminpwd=" + adminpwd + "]";
	}
	
	
}
