package com.scit.team4.vo;

public class comment_ask {
	private int comment_seq ; 
	private String adminid; 
	private String comment_text; 
	private String comment_date; 
	private int ask_seq; 
	
	public comment_ask() {
		// TODO Auto-generated constructor stub
	}

	public comment_ask(int comment_seq, String adminid, String comment_text, String comment_date, int ask_seq) {
		super();
		this.comment_seq = comment_seq;
		this.adminid = adminid;
		this.comment_text = comment_text;
		this.comment_date = comment_date;
		this.ask_seq = ask_seq;
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public int getAsk_seq() {
		return ask_seq;
	}

	public void setAsk_seq(int ask_seq) {
		this.ask_seq = ask_seq;
	}

	@Override
	public String toString() {
		return "comment_ask [comment_seq=" + comment_seq + ", adminid=" + adminid + ", comment_text=" + comment_text
				+ ", comment_date=" + comment_date + ", ask_seq=" + ask_seq + "]";
	}
	
	
	
}
