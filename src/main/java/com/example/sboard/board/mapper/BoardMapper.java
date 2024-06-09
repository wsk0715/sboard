package com.example.sboard.board.mapper;

import com.example.sboard.board.domain.Board;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {
	Board get(int boardNo);

	List<Board> getAll(@Param("pageSize") int pageSize, @Param("pageValue") int pageValue);

	List<Board> getSearch(@Param("searchType") String searchType,
						  @Param("searchValue") String searchValue,
						  @Param("pageSize") int pageSize,
						  @Param("pageValue") int pageValue);

	List<Board> getSearchMulti(@Param("searchValue") String searchValue,
							   @Param("pageSize") int pageSize,
							   @Param("pageValue") int pageValue);

	int getTotalElements(@Param("searchType") String searchType, @Param("searchValue") String searchValue);

	int getTotalElementsMulti(String searchValue);

	int getLastIndex();

	void insert(Board board);

	void modify(Board board);

	void delete(int boardNo);

}

