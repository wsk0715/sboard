package com.example.sboard.member.controller;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.service.MemberService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}


	@GetMapping("/list")
	public String getMemberList(Model model) {
		List<Member> members = memberService.getAll();
		model.addAttribute("members", members);

		return "list";
	}

	@GetMapping("/register")
	public String getMemberRegister(Model model) {
		int memberNo = memberService.getLastIndex();
		model.addAttribute("memberNo", memberNo);

		return "register";
	}

	@PostMapping("/register")
	public String postMemberRegister(Member member) {
		memberService.register(member);

		return "redirect:list";
	}

	@GetMapping("/modify")
	public String getMemberModify(int memberNo, Model model) {
		model.addAttribute("member", memberService.get(memberNo));

		return "modify";
	}

	@PostMapping("/modify")
	public String postMemberModify(Member member) {
		memberService.modify(member);

		return "redirect:list";
	}

	@GetMapping("/delete")
	public String getMemberDelete(int memberNo) {
		memberService.delete(memberNo);

		return "redirect:list";
	}

}
