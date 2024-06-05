package com.example.sboard.board.reply.controller;

import static com.example.sboard.utils.PermissionValidator.validateIsLogin;
import static com.example.sboard.utils.PermissionValidator.validateIsSelf;

import com.example.sboard.board.reply.domain.Reply;
import com.example.sboard.board.reply.service.ReplyServiceImpl;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/reply")

public class ReplyController {
	private final ReplyServiceImpl replyService;

	public ReplyController(ReplyServiceImpl replyService) {
		this.replyService = replyService;
	}


	@PostMapping("/insert")
	public String postReplyInsert(HttpSession session, Reply reply) {
		if (!validateIsLogin(session)) {
			return "redirect:/error/permission";
		}

		reply.setReplyNo(replyService.getLastIndex());
		replyService.insert(reply);

		return "redirect:/board/detail?boardNo=" + reply.getBoardNo();
	}

	@GetMapping("/delete")
	public String getReplyDelete(HttpSession session, int replyNo) {
		Reply reply = replyService.get(replyNo);
		if (!validateIsSelf(session, reply.getMemberId())) {
			return "redirect:/error/permission";
		}

		replyService.delete(replyNo);

		return "redirect:/board/detail?boardNo=" + reply.getBoardNo();
	}

}
