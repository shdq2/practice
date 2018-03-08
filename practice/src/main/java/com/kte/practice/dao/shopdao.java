package com.kte.practice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;
import com.kte.practice.VO.replyVO;
import com.kte.practice.VO.shopVO;

@Service
public class shopdao {
	@Autowired
	private SqlSession sql = null;
	
	public List<shopVO> selectcode(){
		return sql.selectList("p1_shop.itemcode");
	}
	public List<shopVO> selectshop(int code) {
		return sql.selectList("p1_shop.shopitem",code);
	}
	
	public List<shopVO> searchshop(String data) {
		return sql.selectList("p1_shop.searchitem",data);
	}
	
	public shopVO selectItemOne(int no) {
		return sql.selectOne("p1_shop.selectItemOne",no);
	}
	
	public int insertItem(shopVO vo) {
		return sql.insert("p1_shop.insert_item",vo);
	}
	
	public int cartLastNo() {
		return sql.selectOne("p1_shop.cartLastNo");
	}
	
	public shopVO selectBlobImage(String no) {
		return sql.selectOne("p1_shop.selectBlobImage",no);
	}

	
	public int InsertLastNo() {
		return sql.selectOne("p1_shop.lastno");
	}
	
	public int totalqty(String no) {
		return sql.selectOne("p1_shop.totalqty",no);
	}
	
	
	
	public int replylastNo() {
		return sql.selectOne("p1_shop.replylastNo");
	}
	
	public int insertreply(replyVO vo) {
		return sql.insert("p1_shop.insertreply",vo);
	}
	
	public int replycount(int no) {
		return sql.selectOne("p1_shop.replycount",no);
	}
	
	public List<replyVO> replyList(int no){
		return sql.selectList("p1_shop.replyList",no);
	}
	
	public int deletereply(int no) {
		return sql.delete("p1_shop.deletereply",no);
	}
}
