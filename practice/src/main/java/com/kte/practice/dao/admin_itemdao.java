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
public class admin_itemdao {
	@Autowired
	private SqlSession sql = null;
	
	public List<shopVO> adminItemList(int code){
		return sql.selectList("p1_adminitem.adminItemList",code);
	}
	
	public int adminitemcount() {
		return sql.selectOne("p1_adminitem.adminitemcount");
	}
	
	public int adminitemcount2() {
		return sql.selectOne("p1_adminitem.adminitemcount2");
	}
	
	public List<shopVO> admincompleteItemList(){
		return sql.selectList("p1_adminitem.admincompleteItemList");
	}
	
	
	/*¡¶¿ÃΩº dao*/
	public List<shopVO> adminsearch(shopVO vo){
		return sql.selectList("p1_adminitem.adminsearch",vo);
	}
	
	public List<shopVO> adminsearchcomplete(shopVO vo){
		return sql.selectList("p1_adminitem.adminsearchcomplete",vo);
	}
}
