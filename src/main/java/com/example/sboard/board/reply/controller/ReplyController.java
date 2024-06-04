package com.example.sboard.board.reply.controller;

import com.example.sboard.board.reply.domain.Reply;
import com.example.sboard.board.reply.service.ReplyServiceImpl;
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
	public String postReplyInsert(Reply reply) {
		reply.setReplyNo(replyService.getLastIndex());
		replyService.insert(reply);

		return "redirect:/board/detail?boardNo=" + reply.getBoardNo();
	}

	@GetMapping("/delete")
	public String getReplyDelete(int replyNo) {
		Reply reply = replyService.get(replyNo);
		replyService.delete(replyNo);

		return "redirect:/board/detail?boardNo=" + reply.getBoardNo();
	}

}
