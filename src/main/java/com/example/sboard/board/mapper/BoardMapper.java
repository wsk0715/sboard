package com.example.sboard.board.mapper;

import com.example.sboard.board.domain.Board;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {
	Board get(int boardNo);

	List<Board> getAll();

	List<Board> getSearch(@Param("searchType") String searchType, @Param("searchValue") String searchValue);

	List<Board> getMultiSearch(String searchValue);

	int getLastIndex();

	void insert(Board board);

	void modify(Board board);

	void delete(int boardNo);

}

