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
public class admin_orderdao {
	@Autowired
	private SqlSession sql = null;
	
	public List<orderVO> adminorderlist(int code){
		return sql.selectList("p1_adminorder.adminoderlist",code);
	}
	
	public List<orderVO> adminstatelist(){
		return sql.selectList("p1_adminorder.adminstatelist");
	}
	
	public List<orderVO> adminsearchorder(shopVO vo){
		return sql.selectList("p1_adminorder.adminsearchorder",vo);
	}
	
	public int adminordercount() {
		return sql.selectOne("p1_adminorder.adminordercount");
	}
	
	public int update_state(orderVO vo) {
		return sql.update("p1_adminorder.update_state",vo);
	}
}
