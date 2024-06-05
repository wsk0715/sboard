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
	public List<Member> getAll() {
		return memberMapper.getAll();
	}

	@Override
	public int getLastIndex() {
		return memberMapper.getLastIndex();
	}

	@Override
	public void register(Member member) {
		memberMapper.register(member);
		System.out.println("register: " + member);
	}

	@Override
	public void modify(Member member) {
		memberMapper.modify(member);
		System.out.println("modify: " + member);
	}

	@Override
	public void delete(int memberNo) {
		memberMapper.delete(memberNo);
		System.out.println("delete: memberNo=" + memberNo);
	}

}
