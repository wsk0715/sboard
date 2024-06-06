package com.example.sboard.member.login.controller;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.login.service.LoginService;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {
	private final LoginService loginService;

	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}


	@GetMapping("/login")
	public String getMemberLogin() {
		return "member/login";
	}

	@PostMapping("/login")
	public String postMemberLogin(Member member, HttpSession session) {
		member = loginService.getMemberFromLogin(member);

		if (member.getMemberLevel() > 0) {
			session.setAttribute("sessionNo", member.getMemberNo());
			session.setAttribute("sessionId", member.getMemberId());
			session.setAttribute("sessionLevel", member.getMemberLevel());

			return "redirect:/";
		}
		return "redirect:login";
	}

	@GetMapping("/logout")
	public String getMemberLogout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

}
