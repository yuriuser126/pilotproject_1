package com.lgy.ShoFriend.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoFriend.dao.LogDAO;
import com.lgy.ShoFriend.dto.CustomerDTO;



/**
* email로 받아서 email이 맞는경우 비밀번호를 리턴한다. 
* 25/04/08 성유리 로그인 임플서비스 클래스
*/

@Service("LogService")
public class LogServiceImpl implements LogService {
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public ArrayList<CustomerDTO> loginYn(HashMap<String, String> param) {
		
		LogDAO dao = sqlSession.getMapper(LogDAO.class);
		ArrayList<CustomerDTO> list = dao.login(param);
		

		return list;
	}
}
