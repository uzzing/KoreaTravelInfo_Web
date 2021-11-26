package com.scit.team4.vo;

public class ask {
	private int ask_seq ; 
	private String ask_title; 
	private String userid; 
	private String ask_text; 
	private String ask_date; 
	
	public ask() { }

	public ask(int ask_seq, String ask_title, String userid, String ask_text, String ask_date) {
		super();
		this.ask_seq = ask_seq;
		this.ask_title = ask_title;
		this.userid = userid;
		this.ask_text = ask_text;
		this.ask_date = ask_date;
	}

	public int getAsk_seq() {
		return ask_seq;
	}

	public void setAsk_seq(int ask_seq) {
		this.ask_seq = ask_seq;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAsk_text() {
		return ask_text;
	}

	public void setAsk_text(String ask_text) {
		this.ask_text = ask_text;
	}

	public String getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}

	@Override
	public String toString() {
		return "ask_seq=" + ask_seq + ", ask_title=" + ask_title + ", userid=" + userid + ", ask_text=" + ask_text
				+ ", ask_date=" + ask_date;
	};
	
	
	
}
