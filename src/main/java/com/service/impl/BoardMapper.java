package com.service.impl;

import java.util.List;

import com.service.BoardVO;
import com.service.PagingVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {
	//게시판 작성
	public void insertBoard(BoardVO bvo) throws Exception;
	//게시판 목록 갖고오기
	public List<BoardVO> selectBoard() throws Exception;
	//게시판 내용 갖고오기
	public BoardVO boardRead(int number) throws Exception;
	//게시판 삭제
	public void boarddel(int number) throws Exception;
	//게시판 수정
	public void updateBoard(BoardVO bvo) throws Exception;
	//조회수
	public void updateTotal(BoardVO bvo) throws Exception;
	//게시판 글 개수
	public int countBoard() throws Exception;
	//페이징
	public List<BoardVO> selectBoard2(PagingVO vo) ;
}
