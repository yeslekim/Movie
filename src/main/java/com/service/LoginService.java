package com.service;

import java.util.List;

public interface LoginService {

	//회원가입
	public void insertUser(UserVO vo) throws Exception;
	//로그인
	public String loginUser(String id) throws Exception;
	//아이디, pw 갖고오기
	public UserVO selectUser(String id) throws Exception;
	//회원정보수정
	public void updateUser(UserVO vo) throws Exception;
	//회원삭제
	public void deleteUser(UserVO vo) throws Exception;
	
}
