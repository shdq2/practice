package com.kte.practice.VO;

public class orderVO {
	private int no = 0;
	private int item_no = 0;
	private int cart_no = 0;
	private int qty = 0;
	private String date1 = null;
	private int state = 1;
	private String state_title= null;
	
	private String price = null;
	private String name = null;
	private String content = null;
	
	private String state_name = null;
	private String member_email = null;
	private String member_name = null;
	
	private int state_count = 0;
	
	private int sales= 0;
	private String sales_price=null;
	
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getSales_price() {
		return sales_price;
	}
	public void setSales_price(String sales_price) {
		this.sales_price = sales_price;
	}
	public int getState_count() {
		return state_count;
	}
	public void setState_count(int state_count) {
		this.state_count = state_count;
	}
	public String getState_title() {
		return state_title;
	}
	public void setState_title(String state_title) {
		this.state_title = state_title;
	}
	public byte[] getImg1() {
		return img1;
	}
	public void setImg1(byte[] img1) {
		this.img1 = img1;
	}
	public byte[] getImg2() {
		return img2;
	}
	public void setImg2(byte[] img2) {
		this.img2 = img2;
	}
	public byte[] getImg3() {
		return img3;
	}
	public void setImg3(byte[] img3) {
		this.img3 = img3;
	}
	public byte[] getImg4() {
		return img4;
	}
	public void setImg4(byte[] img4) {
		this.img4 = img4;
	}
	public byte[] getImg5() {
		return img5;
	}
	public void setImg5(byte[] img5) {
		this.img5 = img5;
	}


	private byte[] img1 = null;
	private byte[] img2 = null;
	private byte[] img3 = null;
	private byte[] img4 = null;
	private byte[] img5 = null;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	private int code = 0;	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getState_name() {
		return state_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	private int totalpage = 0;
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	} 
}
