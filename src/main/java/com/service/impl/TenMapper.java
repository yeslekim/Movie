package com.service.impl;

import java.util.List;

import com.service.TenVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("tenMapper")
public interface TenMapper {
	//천만영화 갖고오기
	public TenVO selectTen(int chart) throws Exception;
	//전체 천만영화
	public List<TenVO> selectTens() throws Exception;
}
