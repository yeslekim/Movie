package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.TenService;
import com.service.TenVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("tenService")
public class TenServiceImpl extends EgovAbstractServiceImpl implements TenService {
	
	@Resource(name="tenMapper")
	private TenMapper tenMapper;
	
	//천만영화 갖고오기
	public TenVO selectTen(int chart) throws Exception{
		return tenMapper.selectTen(chart);
	};
	//전체 천만영화
	public List<TenVO> selectTens() throws Exception{
		return tenMapper.selectTens();
	};
}
