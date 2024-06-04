package com.example.sboard.member.domain;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private int memberLevel;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;

}
