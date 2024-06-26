package com.example.sboard.member.service;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.mapper.MemberMapper;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	private final MemberMapper memberMapper;

	public MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}


	@Override
	public Member get(int memberNo) {
		return memberMapper.get(memberNo);
	}

	@Override
	public Integer getMemberNoById(String memberId) {
		return memberMapper.getMemberNoById(memberId);
	}

	@Override
	public List<Member> getAll(int pageSize, int pageValue) {
		pageValue = (pageValue - 1) * pageSize;

		return memberMapper.getAll(pageSize, pageValue);
	}

	@Override
	public List<Member> getSearch(String searchType, String searchValue, int pageSize, int pageValue) {
		pageValue = (pageValue - 1) * pageSize;

		return memberMapper.getSearch(searchType, searchValue, pageSize, pageValue);
	}

	@Override
	public int getTotalElements(String searchType, String searchValue) {
		return memberMapper.getTotalElements(searchType, searchValue);
	}

	@Override
	public int getLastIndex() {
		return memberMapper.getLastIndex();
	}

	@Override
	public void register(Member member) {
		memberMapper.register(member);
	}

	@Override
	public void modify(Member member) {
		memberMapper.modify(member);
	}

	@Override
	public void delete(int memberNo) {
		memberMapper.delete(memberNo);
	}

}
