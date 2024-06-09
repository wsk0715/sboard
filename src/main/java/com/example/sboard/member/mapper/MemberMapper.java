package com.example.sboard.member.mapper;

import com.example.sboard.member.domain.Member;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
	Member get(int memberNo);

	Integer getMemberNoById(String memberId);

	List<Member> getAll(@Param("pageSize") int pageSize,
						@Param("pageValue") int pageValue);

	List<Member> getSearch(@Param("searchType") String searchType,
						   @Param("searchValue") String searchValue,
						   @Param("pageSize") int pageSize,
						   @Param("pageValue") int pageValue);

	int getTotalElements(@Param("searchType") String searchType,
						 @Param("searchValue") String searchValue);

	int getLastIndex();

	void register(Member member);

	void modify(Member member);

	void delete(int memberNo);

}

