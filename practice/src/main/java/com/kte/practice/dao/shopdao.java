package com.kte.practice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
