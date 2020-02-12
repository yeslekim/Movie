package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.PagingVO;
import com.service.ReviewService;
import com.service.ReviewVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("reviewService")
public class ReviewServiceImpl extends EgovAbstractServiceImpl implements ReviewService{
	@Resource(name="reviewMapper")
	private ReviewMapper reviewMapper;
	
	//리뷰 등록하기
	public void insertReview(ReviewVO rvo) throws Exception{
		reviewMapper.insertReview(rvo);
	};
	//리뷰 가져오기
	public List<ReviewVO> selectReview(int id) throws Exception{
		return reviewMapper.selectReview(id);
	};
	//리뷰 삭제하기
	public void reviewDel(int rvId) throws Exception{
		reviewMapper.reviewDel(rvId);
	};
	//리뷰 글 개수
	public int countReview(int id) throws Exception{
		return reviewMapper.countReview(id);
	};
	//페이징
	public List<ReviewVO> selectReview2(PagingVO vo){
		return reviewMapper.selectReview2(vo);
	};
}
