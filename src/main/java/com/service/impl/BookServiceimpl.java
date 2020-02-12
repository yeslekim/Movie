package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.BookService;
import com.service.BookVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bookService")
public class BookServiceimpl extends EgovAbstractServiceImpl implements BookService {
	
	@Resource(name="bookMapper")
	private BookMapper bookMapper;
	
	
	//상영표 등록
	public void insertBook(BookVO kvo) throws Exception{
		bookMapper.insertBook(kvo);
	};
	
	//상영표 가지고오기
	public List<BookVO> selectBook() throws Exception{
		return bookMapper.selectBook();
	};
	
	//상영 날짜 가지고오기
	public List<String> selectDateBook() throws Exception{
		return bookMapper.selectDateBook();
	};
	
	//시간 지난 영화 삭제
	public void delPastBook(int bId) throws Exception{
		bookMapper.delPastBook(bId);
	};
	
	//선택한 영화 정보 가지고오기
	public BookVO selectOneBook(int bId) throws Exception{
		return bookMapper.selectOneBook(bId);
	};
	
	
}
