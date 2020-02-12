package com.service;

import java.util.List;

public interface BoardService {
	//게시판 작성
	public void insertBoard(BoardVO bvo) throws Exception;
	//게시판 가지고오기
	public List<BoardVO> selectBoard() throws Exception;
	//선택한 게시판 읽기
	public BoardVO boardRead(int number) throws Exception;
	//게시판 지우기
	public void boarddel(int number) throws Exception;
	//게시판 수정하기
	public void updateBoard(BoardVO bvo) throws Exception;
	//게시판 조회수
	public void updateTotal(BoardVO bvo) throws Exception;
	//게시판 글 개수
	public int countBoard() throws Exception;
	//페이징
	public List<BoardVO> selectBoard2(PagingVO vo);
}
