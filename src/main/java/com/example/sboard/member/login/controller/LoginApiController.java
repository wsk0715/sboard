package com.example.sboard.member.login.controller;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.login.service.LoginService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class LoginApiController {
	private final LoginService loginService;

	public LoginApiController(LoginService loginService) {
		this.loginService = loginService;
	}

	@PostMapping("/login")
	@ResponseBody
	public Map<String, String> postMemberApiLogin(@RequestBody Map<String, String> request, HttpSession session) {
		Map<String, String> response = new HashMap<>();
		Member member = loginService.getMemberFromId(request.get("memberId"));

		if (member == null) {
			response.put("answer", "id");
			return response;
		}

		if (!request.get("memberPw")
					.equals(member.getMemberPw())) {
			response.put("answer", "pw");
			return response;
		}

		response.put("answer", "success");
		session.setAttribute("sessionNo", member.getMemberNo());
		session.setAttribute("sessionId", member.getMemberId());
		session.setAttribute("sessionLevel", member.getMemberLevel());

		return response;
	}

}
