package com.service.impl;

import java.util.List;

import com.service.MvRoomVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mvRoomMapper")
public interface MvRoomMapper {
	//상영관 예약정보 등록
	public void insertMvRoom(MvRoomVO mvo) throws Exception;
	//예약된 좌석 갖고오기
	public List<String> selectSeat(int bId) throws Exception;
	//시간 지난 영화 삭제
	public void delPastMvRoom(int bId) throws Exception;
	//예약 취소 내역 지우기
	public void delMvUserRoom(int ubId) throws Exception;
}
