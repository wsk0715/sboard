package com.example.sboard.board.service;

import com.example.sboard.board.domain.Board;
import com.example.sboard.board.mapper.BoardMapper;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	private final BoardMapper boardMapper;

	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}


	@Override
	public Board get(int boardNo) {
		return boardMapper.get(boardNo);
	}

	@Override
	public List<Board> getAll() {
		return boardMapper.getAll();
	}

	@Override
	public int getLastIndex() {
		return boardMapper.getLastIndex();
	}

	@Override
	public void insert(Board board) {
		boardMapper.insert(board);
	}

	@Override
	public void modify(Board board) {
		boardMapper.modify(board);
	}

	@Override
	public void delete(int boardNo) {
		boardMapper.delete(boardNo);
	}

}
