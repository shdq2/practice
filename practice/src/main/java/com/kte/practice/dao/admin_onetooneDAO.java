package com.kte.practice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.onetooneVO;
import com.kte.practice.VO.orderVO;
import com.kte.practice.VO.shopVO;

@Service
public class admin_onetooneDAO {
	@Autowired
	private SqlSession sql = null;
	
	public List<onetooneVO> adminonetooneList(int code){
		return sql.selectList("p1_adminonetoone.adminonetooneList",code);
	}
	
	public List<onetooneVO> adminonetooneSearch(shopVO vo){
		return sql.selectList("p1_adminonetoone.adminonetooneSearch",vo);
	}
	
	public onetooneVO selectOnetoone(int no) {
		return sql.selectOne("p1_adminonetoone.selectOnetoone",no);
	}
	
	public int admin_answer_insert(onetooneVO vo) {
		return sql.update("p1_adminonetoone.admin_answer_insert",vo);
	}
	
	public onetooneVO selectBlob(String no) {
		return sql.selectOne("p1_adminonetoone.selectBlob",no);
	}
	
	
	
}
