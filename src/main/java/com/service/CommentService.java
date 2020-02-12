package com.service;

import java.util.List;

public interface CommentService {
	//댓글 등록하기
	public void insertComment(CommentVO cvo) throws Exception;
	
	//댓글 보여주기
	public List<CommentVO> selectComment(CommentVO cvo) throws Exception;
	
	//댓글 삭제하기
	public void commentDel(int id) throws Exception;
}
