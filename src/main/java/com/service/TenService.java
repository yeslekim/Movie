package com.service;

import java.util.List;

public interface TenService {
	//천만영화 갖고오기
	public TenVO selectTen(int chart) throws Exception;
	//전체 천만영화
	public List<TenVO> selectTens() throws Exception;
}
