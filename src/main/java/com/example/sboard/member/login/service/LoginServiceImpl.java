package com.example.sboard.member.login.service;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.login.mapper.LoginMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	private final LoginMapper loginMapper;

	public LoginServiceImpl(LoginMapper loginMapper) {
		this.loginMapper = loginMapper;
	}


	@Override
	public Member getMemberFromLogin(Member member) {
		return loginMapper.getMemberFromLogin(member);
	}

}
