package com.example.sboard.member.mapper;

import com.example.sboard.member.domain.Member;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	Member get(int memberNo);

	List<Member> getAll();

	int getLastIndex();

	void register(Member member);

	void modify(Member member);

	void delete(int memberNo);

}

