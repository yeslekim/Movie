package com.service.impl;

import java.util.List;

import com.service.PagingVO;
import com.service.ReviewVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("reviewMapper")
public interface ReviewMapper {
	//리뷰 등록하기
	public void insertReview(ReviewVO rvo) throws Exception;
	//리뷰 가져오기
	public List<ReviewVO> selectReview(int id) throws Exception;
	//리뷰 삭제하기
	public void reviewDel(int rvId) throws Exception;
	//리뷰 글 개수
	public int countReview(int id) throws Exception;
	//페이징
	public List<ReviewVO> selectReview2(PagingVO vo);
}
