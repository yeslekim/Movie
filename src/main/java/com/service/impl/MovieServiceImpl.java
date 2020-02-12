package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.MovieService;
import com.service.MovieVO;
import com.service.PagingVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("movieService")
public class MovieServiceImpl extends EgovAbstractServiceImpl implements MovieService{
	@Resource(name="movieMapper")
	private MovieMapper movieMapper;
	
	//영화 등록
	public void insertMovie(MovieVO mvo) throws Exception{
		movieMapper.insertMovie(mvo);
	};
	
	//영화 내용 가지고오기
	public List<MovieVO> selectMovie() throws Exception{
		return movieMapper.selectMovie();
	};
	
	//특정한 영화 내용 가지고오기
	public MovieVO selectOneMovie(int id) throws Exception{
		return movieMapper.selectOneMovie(id);
	};
	
	//영화 삭제
	public void moviedel(int id) throws Exception{
		movieMapper.moviedel(id);
	};
	//영화 수정
	public void updateMovie(MovieVO mvo) throws Exception{
		movieMapper.updateMovie(mvo);
	};
	//영화 검색
	public List<MovieVO> selectSearchMovie (String mvname) throws Exception{
		return movieMapper.selectSearchMovie(mvname);
	};
	
	//게시판 글 개수
	public int countMovie() throws Exception{
		return movieMapper.countMovie();
	};
	//페이징
	public List<MovieVO> selectMovie2(PagingVO vo){
		return movieMapper.selectMovie2(vo);
	};
}
