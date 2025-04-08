package com.lgy.ShoFriend.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.ShoFriend.dto.CustomerDTO;
import com.lgy.ShoFriend.service.LogService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
/*
* 25/04/08 성유리 
* login_yn : 로그인화면->로그인 여부 판단
* login : 판매자 구매자 선택
* customerlogin : 구매자 로그인
* sellerlogin : 판매자 로그인
*/
	@Autowired
	private LogService service;
	
	@RequestMapping("/login")
	public String login() {
		log.info("login()");
		return ("login");
	}
	
	@RequestMapping("/customerlogin")
	public String customerlogin() {
		log.info("customerlogin()");
		return ("customerlogin");
	}
	
	@RequestMapping("/sellerlogin")
	public String sellerlogin() {
		log.info("sellerlogin()");
		return ("sellerlogin");
	}
	

	@RequestMapping("/login_yn")
		public String loginYn(@RequestParam HashMap<String, String> param) {
		log.info("@# loginYn()");
		

		ArrayList<CustomerDTO> dtos = service.loginYn(param);
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
				if (param.get("password").equals(dtos.get(0).getPassword())) {
				return "redirect:main";
			}
			return "redirect:login";
		}
	}
	
	
	@RequestMapping("/mypage")
	public String mypage() {
		log.info("mypage()");
		return ("mypage");
	}
	@RequestMapping("/register")
	public String register() {
		log.info("register()");
		return ("register");
	}
//	로그인 성공시 이동
	@RequestMapping("/main")
	public String main() {
		log.info("main()");
		return ("main");
	}
}
