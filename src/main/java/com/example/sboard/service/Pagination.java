package com.example.sboard.service;

import java.util.List;
import lombok.Getter;

@Getter
public class Pagination<T> {
	private List<T> elements;  // 제공된 컨텐츠 전체
	private int currentPage;  // 현재 사용자가 위치한 페이지
	private int maxPage;  // 최대 페이지
	private int beginPage;  // 바로가기 생성을 시작할 페이지
	private int endPage;  // '' 종료할 페이지

	public Pagination(List<T> elements, int currentPage, int totalElements) {
		this.elements = elements;
		this.currentPage = currentPage;
		this.maxPage = (totalElements - 1) / 10 + 1;
		this.beginPage = Math.max(1, currentPage - 2);
		this.endPage = Math.min(maxPage, currentPage + 2);

		if (endPage - beginPage < 4) {
			if (beginPage == 1) {
				this.endPage = Math.min(beginPage + 4, maxPage);
			} else {
				this.beginPage = Math.max(endPage - 4, 1);
			}
		}
	}

	@Override
	public String toString() {
		return "Pagination{" + "elements=" + elements + ", currentPage=" + currentPage + ", maxPage=" + maxPage + ", beginPage=" + beginPage + ", endPage=" + endPage + '}';
	}

}
