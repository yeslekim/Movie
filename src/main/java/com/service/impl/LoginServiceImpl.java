package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.LoginService;
import com.service.UserVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {
	
	@Resource(name = "loginMapper")
	private LoginMapper loginMapper;
	
	//회원가입
	public void insertUser(UserVO vo) throws Exception {
		loginMapper.insertUser(vo);
	}
	
	//로그인
	public String loginUser(String id) throws Exception {
		return loginMapper.loginUser(id);
	}
	
	//아이디, pw 갖고오기 (지금 사용안함)
	public UserVO selectUser(String id) throws Exception{
		return loginMapper.selectUser(id);
	}
	
	//비밀번호수정
	public void updateUser(UserVO vo) throws Exception{
		loginMapper.updateUser(vo);
	}
	
	//회원삭제
	public void deleteUser(UserVO vo) throws Exception{
		loginMapper.deleteUser(vo);
	}
}
