package com.example.sboard.member.controller;

import com.example.sboard.member.service.MemberService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberApiController {
	private final MemberService memberService;

	public MemberApiController(MemberService memberService) {
		this.memberService = memberService;
	}


	@PostMapping("/checkId")
	@ResponseBody
	public Map<String, Boolean> getMemberApiCheckId(@RequestBody Map<String, String> request) {
		String memberId = request.get("memberId");
		Integer memberNo = memberService.getMemberNoById(memberId);
		Map<String, Boolean> response = new HashMap<>();
		response.put("exists", memberNo != null);
		return response;
	}

}
