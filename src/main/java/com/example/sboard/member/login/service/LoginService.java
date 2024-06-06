package com.example.sboard.member.login.service;

import com.example.sboard.member.domain.Member;

public interface LoginService {
	Member getMemberFromId(String memberId);
	
}
