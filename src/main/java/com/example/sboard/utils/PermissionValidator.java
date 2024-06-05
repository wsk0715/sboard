package com.example.sboard.utils;

import javax.servlet.http.HttpSession;

public class PermissionValidator {
	private static final int LEVEL_MEMBER = 1;
	private static final int LEVEL_ADMIN = 2;

	public static boolean validateIsLogin(HttpSession session) {
		int sessionLevel = 0;
		if (session.getAttribute("sessionLevel") != null) {
			sessionLevel = Integer.parseInt(session.getAttribute("sessionLevel")
												   .toString());
		}
		return sessionLevel >= LEVEL_MEMBER;
	}

	public static boolean validateIsAdmin(HttpSession session) {
		int sessionLevel = 0;
		if (session.getAttribute("sessionLevel") != null) {
			sessionLevel = Integer.parseInt(session.getAttribute("sessionLevel")
												   .toString());
		}
		return sessionLevel >= LEVEL_ADMIN;
	}

	public static boolean validateIsSelf(HttpSession session, String requestId) {
		if (validateIsAdmin(session)) {
			return true;
		}
		return requestId.equals(session.getAttribute("sessionId"));
	}

}
