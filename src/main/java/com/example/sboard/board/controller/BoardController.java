package com.example.sboard.board.controller;

import static com.example.sboard.utils.PermissionValidator.validateIsLogin;
import static com.example.sboard.utils.PermissionValidator.validateIsSelf;

import com.example.sboard.board.domain.Board;
import com.example.sboard.board.reply.domain.Reply;
import com.example.sboard.board.reply.service.ReplyService;
import com.example.sboard.board.service.BoardService;
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
							   @RequestParam(value = "pageValue", defaultValue = "1") int pageValue,
							   Model model) {
		List<Board> boards;
		if (searchType.isEmpty()) {
			boards = boardService.getAll(10, pageValue);
		} else {
			boards = boardService.getSearch(searchType, searchValue, 10, pageValue);
		}

		int maxPage = (boardService.getTotalElements(searchType, searchValue) - 1) / 10 + 1;
		int beginPage = Math.max(1, pageValue - 2);
		int endPage = Math.min(maxPage, pageValue + 2);

		if (endPage - beginPage < 4) {
			if (beginPage == 1) {
				endPage = Math.min(beginPage + 4, maxPage);
			} else {
				beginPage = Math.max(endPage - 4, 1);
			}
		}

		model.addAttribute("boards", boards);
		model.addAttribute("currentPage", pageValue);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);

		return "board/list";
	}

	@GetMapping("/detail")
	public String getBoardDetail(int boardNo, Model model) {
		Board board = boardService.get(boardNo);
		model.addAttribute("board", board);

		List<Reply> replies = replyService.getAllByBoardNo(boardNo);
		model.addAttribute("replies", replies);

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
