package com.example.sboard.member.login.mapper;

import com.example.sboard.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
	int getMemberFromLogin(Member member);

}