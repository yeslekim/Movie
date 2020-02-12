package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.UserBookService;
import com.service.UserBookVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("userBookService")
public class UserBookServiceImpl extends EgovAbstractServiceImpl implements UserBookService{
	
	@Resource(name="userBookMapper")
	private UserBookMapper userBookMapper;
	
	
	//유저예약 작성
	public void insertUserBook(UserBookVO uvo) throws Exception{
		userBookMapper.insertUserBook(uvo);
	};
	
	//방금 예약한 기본키 호출
	public int selectBookNow(UserBookVO uvo) throws Exception{
		return userBookMapper.selectBookNow(uvo);
	};
	
	//시간 지난 영화 삭제
	public void delPastUBook(int bId) throws Exception{
		userBookMapper.delPastUBook(bId);
	};
	
	//유저 에약정보 갖고오기
	public List<UserBookVO> selectBook(String userId) throws Exception{
		return userBookMapper.selectBook(userId);
	};
	
	//전체 에약정보 갖고오기
	public List<UserBookVO> selectAllBook() throws Exception{
		return userBookMapper.selectAllBook();
	};
	
	//예약 취소 내역 지우기
	public void delUserBook(int ubId) throws Exception{
		userBookMapper.delUserBook(ubId);
	};
}
