package com.example.sboard.errorPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorPageController {

	@GetMapping("/permission")
	public String getPermissionErrorPage() {
		return "errorpage/permission";
	}

}
