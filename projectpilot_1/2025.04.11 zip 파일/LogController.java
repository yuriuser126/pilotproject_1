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
	 * login : 판매자 구매자 선택 
	 * customer_login : 구매자 로그인 
	 * seller_login : 판매자
	 * 로그인 loginYn : 구매자 로그인화면->로그인 여부 판단 체크 메소드 
	 * loginYns : 판매자 로그인화면->로그인 여부 판단 체크
	 * 메소드 main : 메인화면으로 이동 
	 * 25/04/09 성유리 추가및 수정 
	 * find_id (customer) 아이디 찾기 입력란
	 * searchId (customer) 이름과 이메일 체크 > 아이디 확인창 
	 * do_find_id (customer) 아이디 찾기 > 보이는란
	 * find_ids (seller) 아이디 찾기 입력란 
	 * searchIds (seller) 이름과 이메일 체크 > 아이디 확인창
	 * do_find_ids (seller) 아이디 찾기 > 보이는란
	 * 
	 * 25/04/11 성유리 추가 및 수정 
	 * 25/04/08 김채윤 추가 
	 * seller_register : 일반회원가입 
	 * registerOk : 일반회원가입 완료 
	 * seller_register : 판매자 회원가입 
	 * seller_registerOk : 판매자 회원가입 완료
	 * 
	 */
	@Autowired
	private LogService service;

	// 구매자 판매자 선택 페이지
	@RequestMapping("/log/login")
	public String login() {
		log.info("@# /log/login()");
		return ("/log/login");
	}

	// (customer) 로그인 페이지
	@RequestMapping("/log/customer_login")
	public String customerLogin() {
		log.info("@# /log/customer_login()");
		return ("/log/customer_login");
	}

	// (seller) 로그인 페이지
	@RequestMapping("/log/seller_login")
	public String sellerlogin() {
		log.info("@# /log/sellerLogin()");
		return ("/log/seller_login");
	}

	// (customer) 로그인 체크 메소드
	@RequestMapping("/login_yn")
	public String loginYn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@#/login_Yn()");

		ArrayList<CustomerDTO> dtos = service.loginYn(param);

		if (dtos.isEmpty()) {
			return "redirect:log/login";
		} else {
			if (param.get("password").equals(dtos.get(0).getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginCustomer", dtos.get(0));
				session.setAttribute("userType", "customer"); // 로그인 타입 저장
				return "redirect:main";
			}
			return "redirect:log/login";
		}
	}

	// (seller) 로그인 체크 메소드
	@RequestMapping("/login_yns")
	public String loginYns(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@#/loginYns()");

		ArrayList<SellerDTO> dtos = service.loginYns(param);

		if (dtos.isEmpty()) {
			return "redirect:log/login";
		} else {
			if (param.get("password").equals(dtos.get(0).getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginSeller", dtos.get(0));
				session.setAttribute("userType", "seller"); // 로그인 타입 저장
				return "redirect:main";
			}
			return "redirect:log/login";
		}
	}

	// 메인 페이지
	@RequestMapping("/main")
	public String main() {
		log.info("@# main()");
		return ("main");
	}

	// (customer) 아이디 찾기 입력란
	@RequestMapping("/log/find_id")
	public String find_id() {
		log.info("@#/log/find_id()");
		return ("/log/find_id");
	}

	// (customer) 아이디 확인창
	@RequestMapping("/searchId")
	public String searchId(@RequestParam HashMap<String, String> param) {
		log.info("@# searchId");
		service.searchId(param);
		return "redirect:main";
	}

	// (customer) 아이디 찾기 보이는란
	@RequestMapping("/log/do_find_id")
	public String do_find_id(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_id()");
		CustomerDTO list = service.doFindId(param);
		model.addAttribute("list", list);
		return "/log/do_find_id";
	}

	// (seller) 아이디 찾기 입력란
	@RequestMapping("/log/find_ids")
	public String find_ids() {
		log.info("@#/log/find_ids()");
		return ("/log/find_ids");
	}

	// (seller) 아이디 확인창
	@RequestMapping("/searchIds")
	public String searchIds(@RequestParam HashMap<String, String> param) {
		log.info("@# searchIds");
		service.searchIds(param);
		return "redirect:main";
	}

	// (seller) 아이디 찾기 보이는란
	@RequestMapping("/log/do_find_ids")
	public String do_find_ids(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_ids()");

		SellerDTO list = service.doFindIds(param);
		model.addAttribute("list", list);
		return "/log/do_find_ids";
	}

	// (customer) 비밀번호 찾기 입력란
	@RequestMapping("/log/find_pw")
	public String find_pw() {
		log.info("@# /log/find_pw()");
		return ("/log/find_pw");
	}

	// (customer) 비밀번호 확인창
	@RequestMapping("/searchPw")
	public String searchPw(@RequestParam HashMap<String, String> param) {
		log.info("@# searchPw");
		service.searchPw(param);
		return "redirect:main";
	}

//(customer) 비밀번호 찾기 보이는란 
	@RequestMapping("/log/do_find_pw")
	public String do_find_pw(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_pw()");

		CustomerDTO list = service.doFindPw(param);
		model.addAttribute("list", list);
		return "/log/do_find_pw";
	}

	// (seller) 비밀번호 찾기 입력란
	@RequestMapping("/log/find_pws")
	public String find_pws() {
		log.info("@# /log/find_pws()");
		return ("/log/find_pws");
	}

	// (seller) 비밀번호 확인창
	@RequestMapping("/searchPws")
	public String searchPws(@RequestParam HashMap<String, String> param) {
		log.info("@# searchPws");
		service.searchPws(param);
		return "redirect:main";
	}

	// (seller) 비밀번호 찾기 보이는란
	@RequestMapping("/log/do_find_pws")
	public String do_find_pws(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# /log/do_find_pws()");

		SellerDTO list = service.doFindPws(param);
		model.addAttribute("list", list);

		return "/log/do_find_pws";
	}

	// (일반회원가입) 25.04.08 김채윤
	@RequestMapping("/log/customer_register")
	public String customer_register() {
		log.info("@# /log/customer_register()");
		return "/log/customer_register";
	}

	// (일반회원가입 완료) 25.04.08 김채윤
	@RequestMapping("/registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk()");

		service.write(param);
		return "redirect:log/login";
	}

	// (판매자 회원가입) 25.04.08 김채윤
	@RequestMapping("/log/seller_register")
	public String seller_register() {
		log.info("@# /log/seller_register()");
		return "/log/seller_register";
	}

	// (판매자 회원가입 완료) 25.04.08 김채윤
	@RequestMapping("/seller_registerOk")
	public String seller_registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# seller_registerOk()");

		service.sell_write(param);
		return "redirect:log/login";
	}

}
