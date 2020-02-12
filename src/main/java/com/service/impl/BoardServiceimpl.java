package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.BoardService;
import com.service.BoardVO;
import com.service.PagingVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceimpl extends EgovAbstractServiceImpl implements BoardService {
	
	@Resource(name="boardMapper")
	private BoardMapper boardMapper;
	
	//게시판 등록하기
	public void insertBoard(BoardVO bvo) throws Exception {
		boardMapper.insertBoard(bvo);
	}
	//게시판 목록 가져오기
	public List<BoardVO> selectBoard() throws Exception {
		return boardMapper.selectBoard();
	}
	// 게시판 내용 갖고오기
	public BoardVO boardRead(int number) throws Exception{
		return boardMapper.boardRead(number);
	};
	
	//게시판 삭제
	public void boarddel(int number) throws Exception{
		boardMapper.boarddel(number);
	};
	//게시판 수정
	public void updateBoard(BoardVO bvo) throws Exception{
		boardMapper.updateBoard(bvo);
	};
	//조회수
	public void updateTotal(BoardVO bvo) throws Exception{
		boardMapper.updateTotal(bvo);
	};
	
	//게시판 글 개수
	public int countBoard() throws Exception{
		return boardMapper.countBoard();
	};
	//페이징 처리
	public List<BoardVO> selectBoard2(PagingVO vo) {
		return boardMapper.selectBoard2(vo);
	}

}
