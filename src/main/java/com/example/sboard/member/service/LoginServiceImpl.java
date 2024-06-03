package com.example.sboard.member.service;

import com.example.sboard.member.domain.Member;
import com.example.sboard.member.mapper.LoginMapper;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	private final LoginMapper loginMapper;

	public LoginServiceImpl(LoginMapper loginMapper) {
		this.loginMapper = loginMapper;
	}


	@Override
	public int getMemberFromLogin(Member member) {
		return loginMapper.getMemberFromLogin(member);
	}

}
