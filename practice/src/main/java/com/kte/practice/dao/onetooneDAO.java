package com.kte.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.onetooneVO;

@Service
public class onetooneDAO {
	@Autowired
	private SqlSession sql = null;
	
	public int onetooneLastNo() {
		return sql.selectOne("p1_onetoone.onetooneLastNo");
	}
	
	public int InsertOnetoone(onetooneVO vo) {
		return sql.insert("p1_onetoone.InsertOnetoone",vo);
	}
	
	public List<onetooneVO> OnetooneList(String email){
		return sql.selectList("p1_onetoone.OnetooneList",email);
	}
	
	public onetooneVO selectOnetoone(onetooneVO vo) {
		return sql.selectOne("p1_onetoone.selectOnetoone",vo);
	}
}
