package com.kte.practice.VO;

public class shopVO {
	private int no = 10000000;
	private String name= null;
	private String content= null;
	private String price= null;
	private int qty= 0;
	private int code= 0;
	private String member_email = null;
	private int sales = 0;
	private String sales_price = null;
	
	private byte[] img1 = null;
	private byte[] img2 = null;
	private byte[] img3 = null;
	private byte[] img4 = null;
	private byte[] img5 = null;
	
	private int tot=0; 
	
	private int item_code = 0;
	private String name_code = null;
	
	private int type = 0;
	private String txt = null;
	
	
	public String getSales_price() {
		return sales_price; 
	}
	public void setSales_price(String sales_price) {
		this.sales_price = sales_price;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public String getName_code() {
		return name_code;
	}
	public void setName_code(String name_code) {
		this.name_code = name_code;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	private String date1= null;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	
}
