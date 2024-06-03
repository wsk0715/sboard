package com.example.sboard.board.service;

import com.example.sboard.board.domain.Board;
import com.example.sboard.board.mapper.BoardMapper;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardService {
	private final BoardMapper boardMapper;

	public BoardService(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}


	public Board get(int boardNo) {
		return boardMapper.get(boardNo);
	}

	public List<Board> getAll() {
		return boardMapper.getAll();
	}

	public int getLastIndex() {
		return boardMapper.getLastIndex();
	}

	public void insert(Board board) {
		boardMapper.insert(board);
		System.out.println("insert: " + board);
	}

	public void modify(Board board) {
		boardMapper.modify(board);
		System.out.println("modify: " + board);
	}

	public void delete(int boardNo) {
		boardMapper.delete(boardNo);
		System.out.println("delete: boardNo=" + boardNo);
	}

}
