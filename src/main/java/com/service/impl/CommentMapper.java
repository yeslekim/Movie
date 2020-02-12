package com.service.impl;

import java.util.List;

import com.service.CommentVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commentMapper")
public interface CommentMapper {
	//댓글 등록하기
	public void insertComment(CommentVO cvo) throws Exception;
	
	//댓글 보여주기
	public List<CommentVO> selectComment(CommentVO cvo) throws Exception;
	
	//댓글 삭제하기
	public void commentDel(int id) throws Exception;
}
