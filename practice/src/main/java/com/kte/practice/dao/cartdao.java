package com.kte.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;

@Service
public class cartdao {
	@Autowired
	private SqlSession sql = null;
	
	public int insertcart(cartVO vo) {
		return sql.insert("p1_cart.insertcart",vo);
	}
	
	public List<itemcartVO> itemcart(String email){
		return sql.selectList("p1_cart.selectcart",email);
	}
	
	public int cartalldelete(String email) {
		return sql.delete("p1_cart.cartalldelete",email);
	}
	
	public int selectdeletecart(List<Integer> list) {
		return sql.delete("p1_cart.selectdeletecart",list);
	}
	
	public int qtyupdate(cartVO vo) {
		return sql.update("p1_cart.qtyupdate",vo);
	}
	
}
