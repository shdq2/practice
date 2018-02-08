package com.kte.practice.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
