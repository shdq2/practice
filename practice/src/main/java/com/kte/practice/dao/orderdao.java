package com.kte.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.orderVO;

@Service
public class orderdao {
	@Autowired
	private SqlSession sql = null;
	
	public int insertorder(orderVO vo) {
		System.out.println(vo.getCart_no());
		System.out.println(vo.getNo());
		System.out.println(vo.getItem_no());
		System.out.println(vo.getQty());
		return sql.insert("p1_order.insertorder",vo);
	}
	
	public int lastOrderNo() {
		return sql.selectOne("p1_order.lastOrderNo");
	}
	
	public List<orderVO> orderlist(String email) {
		return sql.selectList("p1_order.orderlist",email);
	}
	
}
