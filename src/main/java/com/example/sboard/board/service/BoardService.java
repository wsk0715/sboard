package com.example.sboard.board.service;

import com.example.sboard.board.domain.Board;
import java.util.List;

public interface BoardService {

	Board get(int boardNo);

	List<Board> getAll();

	List<Board> getSearch(String searchType, String searchValue);

	int getLastIndex();

	void insert(Board board);

	void modify(Board board);

	void delete(int boardNo);

}
