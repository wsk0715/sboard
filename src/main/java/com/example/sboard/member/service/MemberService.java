package com.example.sboard.member.service;

import com.example.sboard.member.domain.Member;
import java.util.List;

public interface MemberService {

	Member get(int memberNo);

	boolean isExistId(String memberId);

	List<Member> getAll();

	int getLastIndex();

	void register(Member member);

	void modify(Member member);

	void delete(int memberNo);

}
