package com.service.impl;

import java.util.List;

import com.service.UserVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {
	
	//회원가입
	public void insertUser(UserVO vo) throws Exception;	// mappers에있는 xml실행(실질적 쿼리문은 xml에서 실행)
	
	//로그인
	public String loginUser(String id) throws Exception;
	//아이디, pw 갖고오기
	public UserVO selectUser(String id) throws Exception;
	
	//비밀번호수정
	public void updateUser(UserVO vo) throws Exception;
	
	//회원삭제
	public void deleteUser(UserVO vo) throws Exception;
	
}
