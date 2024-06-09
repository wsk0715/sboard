package com.example.sboard.member.controller;

import static com.example.sboard.utils.PermissionValidator.validateIsAdmin;
import static com.example.sboard.utils.PermissionValidator.validateIsSelf;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.service.MemberService;
import com.example.sboard.service.Pagination;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
public class MemberController {
	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}


	@GetMapping("/list")
	public String getMemberList(HttpSession session,
								@RequestParam(value = "searchType", defaultValue = "") String searchType,
								@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
								@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
								@RequestParam(value = "pageValue", defaultValue = "1") int pageValue,
								Model model) {
		if (!validateIsAdmin(session)) {
			return "redirect:/error/permission";
		}
		List<Member> members;
		if (searchType.isEmpty()) {
			members = memberService.getAll(pageSize, pageValue);
		} else {
			members = memberService.getSearch(searchType, searchValue, pageSize, pageValue);
		}
		int totalElements = memberService.getTotalElements(searchType, searchValue);
		Pagination<Member> page = new Pagination<>(members, pageValue, totalElements);
		model.addAttribute("page", page);

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

		if (validateIsAdmin(session)) {
			return "redirect:/member/list";
		}

		session.invalidate();
		return "redirect:/";
	}

}
