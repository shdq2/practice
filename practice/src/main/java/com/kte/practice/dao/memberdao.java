package com.kte.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kte.practice.VO.cartVO;
import com.kte.practice.VO.itemcartVO;
import com.kte.practice.VO.memberVO;

@Service
public class memberdao {
	@Autowired
	private SqlSession sql = null;
	
	public int memberinsert(memberVO vo) {
		return sql.insert("p1_member.memberinsert",vo);
	}
	
	public int memberidcheck(String id) {
		return sql.selectOne("p1_member.idcheck",id);
	}
	
	public memberVO memberLogin(memberVO vo) {
		return sql.selectOne("p1_member.selectLogin",vo);
	}
	
	public int memberUpdate(memberVO vo) {
		return sql.update("p1_member.memberUpdate",vo);
	}
	
	public int memberdelete(memberVO vo) {
		return sql.delete("p1_member.memberdelete",vo);
	}
}
