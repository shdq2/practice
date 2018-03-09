package com.kte.practice.VO;

public class replyVO {
	private int rep_no = 0;
	private String rep_content = null;
	private int rep_item_no = 0;
	private String rep_writer = null;
	private String rep_date = null;
	private String writer_name = null;
	private int rep_count = 0;
	
	public int getRep_count() {
		return rep_count;
	}
	public void setRep_count(int rep_count) {
		this.rep_count = rep_count;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public int getRep_no() {
		return rep_no;
	}
	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public int getRep_item_no() {
		return rep_item_no;
	}
	public void setRep_item_no(int rep_item_no) {
		this.rep_item_no = rep_item_no;
	}
	public String getRep_writer() {
		return rep_writer;
	}
	public void setRep_writer(String rep_writer) {
		this.rep_writer = rep_writer;
	}
	public String getRep_date() {
		return rep_date;
	}
	public void setRep_date(String rep_date) {
		this.rep_date = rep_date;
	}
}
