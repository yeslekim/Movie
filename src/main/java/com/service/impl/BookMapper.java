package com.service.impl;

import java.util.List;

import com.service.BookVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("bookMapper")
public interface BookMapper {
	//상영표 등록
	public void insertBook(BookVO kvo) throws Exception;
	//상영표 가지고오기
	public List<BookVO> selectBook() throws Exception;
	//상영 날짜 가지고오기
	public List<String> selectDateBook() throws Exception;
	//시간 지난 영화 삭제
	public void delPastBook(int bId) throws Exception;
	//선택한 영화 정보 가지고오기
	public BookVO selectOneBook(int bId) throws Exception;
	
}
