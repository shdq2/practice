package com.kte.practice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;

@Service
public class admindao {
	@Autowired
	private SqlSession sql = null;
	
	public List<memberVO> adminMemberList(){
		return sql.selectList("p1_admin.adminMemberList");
	}
	
	public int memberblockupdate(memberVO vo){
		return sql.update("p1_admin.memberblockupdate",vo);
	}
	
	public memberVO selectmemberOne(String email) {
		return sql.selectOne("p1_admin.selectmemberOne",email);
	}
	
	public List<orderVO> adminmemberorder(Map<String,Object> map) {
		return sql.selectList("p1_admin.adminmemberorder",map);
	}
	
	public List<orderVO> graph(String email) {
		return sql.selectList("p1_admin.graph",email);
	}
	
	public int totalpage(String email) {
		return sql.selectOne("p1_admin.totalpage",email);
	}
	
	public int adminsellcnt(String email){
		return sql.selectOne("p1_admin.adminsellcnt",email);
	}
	
	public List<memberVO> admin_member_search(shopVO vo){
		return sql.selectList("p1_admin.admin_member_search",vo);
	}
	
	public int admincount() {
		return sql.selectOne("p1_admin.admincount");
	}
	
	public int todayinsert() {
		return sql.selectOne("p1_admin.todayinsert");
	}
	public int yesterdayinsert() {
		return sql.selectOne("p1_admin.yesterdayinsert");
	}
	public int yesterday2() {
		return sql.selectOne("p1_admin.yesterday2");
	}
	public int thismonth() {
		return sql.selectOne("p1_admin.this_month");
	}
	public int premonth() {
		return sql.selectOne("p1_admin.pre_month");
	}
	public int premonth2() {
		return sql.selectOne("p1_admin.pre_month2");
	}
	
	public List<orderVO> state_count(){
		return sql.selectList("p1_admin.state_count");
	}
	
	public int order_count() {
		return sql.selectOne("p1_admin.order_count");
	}
	public int onetoonecount() {
		return sql.selectOne("p1_adminonetoone.onetoonecount");
	}
	public int onetooneallcount() {
		return sql.selectOne("p1_adminonetoone.onetooneallcount");
	}
}
