package com.service;

import java.util.List;

public interface MovieService {
	//영화 등록
	public void insertMovie(MovieVO mvo) throws Exception;
	//영화 내용 가지고오기
	public List<MovieVO> selectMovie() throws Exception;
	//특정한 영화 내용 가지고오기
	public MovieVO selectOneMovie(int id) throws Exception;
	//영화 삭제
	public void moviedel(int id) throws Exception;
	//영화 수정
	public void updateMovie(MovieVO mvo) throws Exception;
	//영화 검색
	public List<MovieVO> selectSearchMovie (String mvname) throws Exception;
	//게시판 글 개수
	public int countMovie() throws Exception;
	//페이징
	public List<MovieVO> selectMovie2(PagingVO vo);
}
