package com.service;

import java.util.List;

public interface UserBookService {
	//유저예약 작성
	public void insertUserBook(UserBookVO uvo) throws Exception;
	//방금 예약한 기본키 호출
	public int selectBookNow(UserBookVO uvo) throws Exception;
	//시간 지난 영화 삭제
	public void delPastUBook(int bId) throws Exception;
	//유저 에약정보 갖고오기
	public List<UserBookVO> selectBook(String userId) throws Exception;
	//전체 에약정보 갖고오기
	public List<UserBookVO> selectAllBook() throws Exception;
	//예약 취소 내역 지우기
	public void delUserBook(int ubId) throws Exception;
}
