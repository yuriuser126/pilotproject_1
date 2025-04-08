package com.lgy.ShoFriend.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoFriend.dto.LogDTO;

//* 추상클래스 로그인 서비스 sql
//* 25/04/08 성유리 로그인 dao
public interface LogDAO {
	public ArrayList<LogDTO> login(HashMap<String, String> param);


}
