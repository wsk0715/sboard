package com.example.sboard.member.service;

import com.example.sboard.member.domain.Member;
import java.util.List;

public interface MemberService {

	Member get(int memberNo);

	Integer getMemberNoById(String memberId);

	List<Member> getAll();

	List<Member> getSearch(String searchType, String searchValue);

	int getLastIndex();

	void register(Member member);

	void modify(Member member);

	void delete(int memberNo);

}
