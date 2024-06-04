package com.example.sboard.board.controller;

import com.example.sboard.board.domain.Board;
import com.example.sboard.board.reply.domain.Reply;
import com.example.sboard.board.reply.service.ReplyService;
import com.example.sboard.board.service.BoardService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	private final BoardService boardService;

	private final ReplyService replyService;

	public BoardController(BoardService boardService, ReplyService replyService) {
		this.boardService = boardService;
		this.replyService = replyService;
	}


	@GetMapping("/list")
	public String getBoardList(Model model) {
		List<Board> boards = boardService.getAll();
		model.addAttribute("boards", boards);

		return "board/list";
	}

	@GetMapping("/detail")
	public String getBoardDetail(int boardNo, Model model) {
		Board board = boardService.get(boardNo);
		model.addAttribute("board", board);

		List<Reply> replies = replyService.getAllByBoardNo(boardNo);
		replies.forEach(System.out::println);
		model.addAttribute("replies", replies);

		return "board/detail";
	}

	@GetMapping("/insert")
	public String getBoardInsert(Model model) {
		int boardNo = boardService.getLastIndex();
		model.addAttribute("boardNo", boardNo);

		return "board/insert";
	}

	@PostMapping("/insert")
	public String postBoardInsert(Board board) {
		boardService.insert(board);

		return "redirect:list";
	}

	@GetMapping("/modify")
	public String getBoardModify(int boardNo, Model model) {
		model.addAttribute("board", boardService.get(boardNo));

		return "board/modify";
	}

	@PostMapping("/modify")
	public String postBoardModify(Board board) {
		boardService.modify(board);

		return "redirect:list";
	}

	@GetMapping("/delete")
	public String getBoardDelete(int boardNo) {
		replyService.deleteAllByBoardNo(boardNo);
		boardService.delete(boardNo);

		return "redirect:list";
	}

}
