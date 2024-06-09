package com.example.sboard.board.controller;

import static com.example.sboard.utils.PermissionValidator.validateIsLogin;
import static com.example.sboard.utils.PermissionValidator.validateIsSelf;

import com.example.sboard.board.domain.Board;
import com.example.sboard.board.reply.domain.Reply;
import com.example.sboard.board.reply.service.ReplyService;
import com.example.sboard.board.service.BoardService;
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
@RequestMapping("/board")
public class BoardController {
	private final BoardService boardService;
	private final ReplyService replyService;

	public BoardController(BoardService boardService, ReplyService replyService) {
		this.boardService = boardService;
		this.replyService = replyService;
	}

	@GetMapping("/list")
	public String getBoardList(@RequestParam(value = "searchType", defaultValue = "b_title") String searchType,
							   @RequestParam(value = "searchValue", defaultValue = "") String searchValue,
							   @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
							   @RequestParam(value = "pageValue", defaultValue = "1") int pageValue,
							   Model model) {
		List<Board> boards;
		if (searchType.isEmpty()) {
			boards = boardService.getAll(pageSize, pageValue);
		} else {
			boards = boardService.getSearch(searchType, searchValue, pageSize, pageValue);
		}
		int totalElements = boardService.getTotalElements(searchType, searchValue);
		Pagination<Board> page = new Pagination<>(boards, pageValue, totalElements);
		model.addAttribute("page", page);

		return "board/list";
	}

	@GetMapping("/detail")
	public String getBoardDetail(int boardNo,
								 @RequestParam(value = "pageValue", defaultValue = "1") int pageValue,
								 Model model) {
		Board board = boardService.get(boardNo);
		model.addAttribute("board", board);

		List<Reply> replies = replyService.getAllByBoardNo(boardNo, 10, pageValue);
		int totalElements = replyService.getTotalElements(boardNo);
		Pagination<Reply> page = new Pagination<>(replies, pageValue, totalElements);

		model.addAttribute("page", page);

		return "board/detail";
	}

	@GetMapping("/insert")
	public String getBoardInsert(HttpSession session, Model model) {
		if (!validateIsLogin(session)) {
			return "redirect:/error/permission";
		}

		int boardNo = boardService.getLastIndex();
		model.addAttribute("boardNo", boardNo);

		return "board/insert";
	}

	@PostMapping("/insert")
	public String postBoardInsert(HttpSession session, Board board) {
		if (!validateIsLogin(session)) {
			return "redirect:/error/permission";
		}

		boardService.insert(board);

		return "redirect:/board/detail?boardNo=" + board.getBoardNo();
	}

	@GetMapping("/modify")
	public String getBoardModify(HttpSession session, int boardNo, Model model) {
		Board board = boardService.get(boardNo);
		if (!validateIsSelf(session, board.getMemberId())) {
			return "redirect:/error/permission";
		}

		model.addAttribute("board", board);

		return "board/modify";
	}

	@PostMapping("/modify")
	public String postBoardModify(HttpSession session, Board board) {
		if (!validateIsSelf(session, board.getMemberId())) {
			return "redirect:/error/permission";
		}

		boardService.modify(board);

		return "redirect:/board/detail?boardNo=" + board.getBoardNo();
	}

	@GetMapping("/delete")
	public String getBoardDelete(HttpSession session, int boardNo) {
		Board board = boardService.get(boardNo);
		if (!validateIsSelf(session, board.getMemberId())) {
			return "redirect:/error/permission";
		}

		replyService.deleteAllByBoardNo(boardNo);
		boardService.delete(boardNo);

		return "redirect:/board/list";
	}

}
