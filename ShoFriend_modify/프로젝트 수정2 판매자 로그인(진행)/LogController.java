package com.lgy.ShoFriend.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.ShoFriend.dto.CustomerDTO;
import com.lgy.ShoFriend.dto.SellerDTO;
import com.lgy.ShoFriend.service.LogService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LogController {
/*
* 25/04/08 성유리 
* login_yn : 로그인화면->로그인 여부 판단
* login : 판매자 구매자 선택
* customerlogin : 구매자 로그인
* sellerlogin : 판매자 로그인
*/
	@Autowired
	private LogService service;
	
	@RequestMapping("/login") //로그인 페이지
	public String login() {
		log.info("@# login()");
		return ("login");
	}
	
	@RequestMapping("/customer_login") //구매자 로그인 페이지
	public String customerLogin() {
		log.info("@# customer_login()");
		return ("customer_login");
	}
	
	@RequestMapping("/seller_login") //판매자 로그인 페이지
	public String sellerlogin() {
		log.info("@# sellerLogin()");
		return ("seller_login");
	}
	

	@RequestMapping("/login_yn") //구매자 로그인 체크 메소드
		public String loginYn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# login_Yn()");

		ArrayList<CustomerDTO> dtos = service.loginYn(param);
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
				if (param.get("password").equals(dtos.get(0).getPassword())) {
					HttpSession session = request.getSession();
					session.setAttribute("loginCustomer", dtos.get(0));
					session.setAttribute("userType", "customer"); // 로그인 타입 저장
				return "redirect:main";
			}
			return "redirect:login";
		}
	}
	
	@RequestMapping("/login_yns") //판매자 로그인 체크 메소드
	public String loginYns(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# loginYns()");

	ArrayList<SellerDTO> dtos = service.loginYns(param);
	
	if (dtos.isEmpty()) {
		return "redirect:login";
	} else {
			if (param.get("password").equals(dtos.get(0).getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginSeller", dtos.get(0));
				session.setAttribute("userType", "seller"); // 로그인 타입 저장
			return "redirect:main";
		}
		return "redirect:login";
	}
}

	
//	로그인 성공시 이동
	@RequestMapping("/main") //메인 페이지
	public String main() {
		log.info("@# main()");
		return ("main");
	}
	
	//아이디 찾기 입력란
	@RequestMapping("/find_id") 
	public String find_id() {
		log.info("@# find_id()");
		return ("find_id");
	}
	
	//아이디 확인창 
	@RequestMapping("/do_find_id") 
	public String do_find_id() {
		log.info("@# do_find_id()");
		return ("do_find_id");
	}
	
	//아이디 확인창 
		@RequestMapping("/searchId") 
		public String searchId(@RequestParam HashMap<String, String> param) {
			log.info("@# searchId()");
			
			service.searchId(param);
			
			return "redirect:do_find_id";
			
		}
	

}
