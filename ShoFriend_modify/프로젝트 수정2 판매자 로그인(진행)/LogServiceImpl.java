package com.lgy.ShoFriend.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoFriend.dao.LogDAO;
import com.lgy.ShoFriend.dto.CustomerDTO;
import com.lgy.ShoFriend.dto.SellerDTO;


/**
* email로 받아서 email이 맞는경우 비밀번호를 리턴한다. 
* 25/04/08 성유리 로그인 임플서비스 클래스
*/

@Service("LogService")
public class LogServiceImpl implements LogService {
	@Autowired
	private SqlSession sqlSession;
	

	//*25.04.10 성유리 dao.login -> dao.logYn 수정
	@Override
	public ArrayList<CustomerDTO> loginYn(HashMap<String, String> param) {
		
		LogDAO dao = sqlSession.getMapper(LogDAO.class);
		ArrayList<CustomerDTO> list = dao.loginYn(param);

		return list;
	}


	@Override
	public void searchId(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);
		dao.searchId(param);
		
	}


	@Override
	public ArrayList<SellerDTO> loginYns(HashMap<String, String> param) {
		LogDAO dao = sqlSession.getMapper(LogDAO.class);
		ArrayList<SellerDTO> lists = dao.loginYns(param);
		return lists;
	}
}
