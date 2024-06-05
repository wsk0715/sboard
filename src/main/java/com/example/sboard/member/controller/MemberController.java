package com.example.sboard.member.controller;

import static com.example.sboard.utils.PermissionValidator.validateIsLogin;
import static com.example.sboard.utils.PermissionValidator.validateIsSelf;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.service.MemberService;
import java.util.List;
import javax.servlet.http.HttpSession;
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
	public String getMemberList(HttpSession session, Model model) {
		if (!validateIsLogin(session)) {
			return "redirect:/error/permission";
		}

		List<Member> members = memberService.getAll();
		model.addAttribute("members", members);

		return "member/list";
	}

	@GetMapping("/detail")
	public String getMemberDetail(HttpSession session, int memberNo, Model model) {
		Member member = memberService.get(memberNo);
		if (!validateIsSelf(session, member.getMemberId())) {
			return "redirect:/error/permission";
		}

		model.addAttribute("member", member);

		return "member/detail";
	}

	@GetMapping("/register")
	public String getMemberRegister(Model model) {
		int memberNo = memberService.getLastIndex();
		model.addAttribute("memberNo", memberNo);

		return "member/register";
	}

	@PostMapping("/register")
	public String postMemberRegister(Member member) {
		memberService.register(member);

		return "redirect:list";
	}

	@GetMapping("/modify")
	public String getMemberModify(HttpSession session, int memberNo, Model model) {
		Member member = memberService.get(memberNo);
		if (!validateIsSelf(session, member.getMemberId())) {
			return "redirect:/error/permission";
		}

		model.addAttribute("member", member);

		return "member/modify";
	}

	@PostMapping("/modify")
	public String postMemberModify(HttpSession session, Member member) {
		if (!validateIsSelf(session, member.getMemberId())) {
			return "redirect:/error/permission";
		}

		memberService.modify(member);

		return "redirect:list";
	}

	@GetMapping("/delete")
	public String getMemberDelete(HttpSession session, int memberNo) {
		Member member = memberService.get(memberNo);
		if (!validateIsSelf(session, member.getMemberId())) {
			return "redirect:/error/permission";
		}

		memberService.delete(memberNo);

		return "redirect:list";
	}

}
