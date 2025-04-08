package com.lgy.ShoFriend.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoFriend.dao.ShoFreindDAO;
import com.lgy.ShoFriend.dto.ShoFriendDTO;
/**
* email로 받아서 email이 맞는경우 비밀번호를 리턴한다. 
* 25/04/08 성유리 로그인 임플서비스 클래스
*/

@Service("ShoFriendService")
public class ShoFriendServiceImpl implements ShoFriendService {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public ArrayList<ShoFriendDTO> loginYn(HashMap<String, String> param) {
		ShoFreindDAO dao = sqlSession.getMapper(ShoFreindDAO.class);
		ArrayList<ShoFriendDTO> list = dao.login(param);
		

		return list;
	}

}
