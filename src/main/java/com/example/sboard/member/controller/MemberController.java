package com.example.sboard.member.controller;

import static com.example.sboard.utils.PermissionValidator.validateIsAdmin;
import static com.example.sboard.utils.PermissionValidator.validateIsSelf;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.service.MemberService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {
	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}


	@GetMapping("/list")
	public String getMemberList(HttpSession session, Model model) {
		if (!validateIsAdmin(session)) {
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

	@PostMapping("/checkId")
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestBody Map<String, String> request) {
		String memberId = request.get("memberId");
		Integer memberNo = memberService.getMemberNoById(memberId);
		Map<String, Boolean> response = new HashMap<>();
		response.put("exists", memberNo != null);
		return response;
	}

	@PostMapping("/register")
	public String postMemberRegister(Member member) {
		memberService.register(member);

		return "redirect:/member/login";
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

		return "redirect:/member/detail?memberNo=" + member.getMemberNo();
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
