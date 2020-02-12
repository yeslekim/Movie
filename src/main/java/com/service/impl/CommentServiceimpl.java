package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.CommentService;
import com.service.CommentVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
@Service("commentService")
public class CommentServiceimpl extends EgovAbstractServiceImpl implements CommentService {
	@Resource(name="commentMapper")
	private CommentMapper commentMapper;
	
	//댓글 등록하기
	public void insertComment(CommentVO cvo) throws Exception{
		commentMapper.insertComment(cvo);
	};

	//댓글 보여주기
	public List<CommentVO> selectComment(CommentVO cvo) throws Exception{
		return commentMapper.selectComment(cvo);
	};
	
	//댓글 삭제하기
	public void commentDel(int id) throws Exception{
		commentMapper.commentDel(id);
	};
}
