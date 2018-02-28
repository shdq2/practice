package com.kte.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;

@Service
public class admindao {
	@Autowired
	private SqlSession sql = null;
	
	public List<memberVO> adminMemberList(){
		return sql.selectList("p1_admin.adminMemberList");
	}
	
	public int memberblockupdate(memberVO vo){
		return sql.update("p1_admin.memberblockupdate",vo);
	}
	
	public memberVO selectmemberOne(String email) {
		return sql.selectOne("p1_admin.selectmemberOne",email);
	}
}
