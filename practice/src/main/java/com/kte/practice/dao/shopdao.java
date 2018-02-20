package com.kte.practice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.shopVO;

@Service
public class shopdao {
	@Autowired
	private SqlSession sql = null;
	
	public List<shopVO> selectshop(int code) {
		return sql.selectList("p1_shop.shopitem",code);
	}
	
	public List<shopVO> searchshop(String data) {
		return sql.selectList("p1_shop.searchitem",data);
	}
	
	public shopVO selectItemOne(String email) {
		return sql.selectOne("p1_shop.selectItemOne",email);
	}
	
	public int cartLastNo() {
		return sql.selectOne("p1_shop.cartLastNo");
	}
	
	public int totalqty(String no) {
		return sql.selectOne("p1_shop.totalqty",no);
	}
}
