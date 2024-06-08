package com.example.sboard.member.login.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {

	@GetMapping("/login")
	public String getMemberLogin() {
		return "member/login";
	}

	@GetMapping("/logout")
	public String getMemberLogout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

}
