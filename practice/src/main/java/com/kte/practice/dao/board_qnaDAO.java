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
import com.kte.practice.VO.qnaVO;
import com.kte.practice.VO.shopVO;

@Service
public class board_qnaDAO {
	@Autowired
	private SqlSession sql = null;
	
	public List<qnaVO> qna_list(){
		return sql.selectList("p1_qna.qna_list");
	}
	
	public qnaVO selectqna(int no) {
		return sql.selectOne("p1_qna.selectqna",no);
	}
	
	public int maxqna(int no) {
		return sql.selectOne("p1_qna.maxqna",no);
	}
	
	public int minqna(int no) {
		return sql.selectOne("p1_qna.minqna",no);
	}
}
