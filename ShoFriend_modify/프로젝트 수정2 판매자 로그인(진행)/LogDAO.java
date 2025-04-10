package com.lgy.ShoFriend.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.ShoFriend.dto.CustomerDTO;
import com.lgy.ShoFriend.dto.SellerDTO;

//* 추상클래스 로그인 서비스 sql
//* 25/04/08 성유리 로그인 dao

//*25.04.10 성유리 추상클래스 이름login -> logYn 수정
public interface LogDAO {
	public ArrayList<CustomerDTO> loginYn(HashMap<String, String> param);
	public ArrayList<SellerDTO> loginYns(HashMap<String, String> param);
	public void searchId(@RequestParam HashMap<String, String> param) ;
	

}
