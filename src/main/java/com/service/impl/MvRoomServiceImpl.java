package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.MvRoomService;
import com.service.MvRoomVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mvRoomService")
public class MvRoomServiceImpl extends EgovAbstractServiceImpl implements MvRoomService{
	
	@Resource(name="mvRoomMapper")
	private MvRoomMapper mvRoomMapper;
	
	//상영관 예약정보 등록
	public void insertMvRoom(MvRoomVO mvo) throws Exception{
		mvRoomMapper.insertMvRoom(mvo);
	};
	
	//예약된 좌석 갖고오기
	public List<String> selectSeat(int bId) throws Exception{
		return mvRoomMapper.selectSeat(bId);
	};
	
	//시간 지난 영화 삭제
	public void delPastMvRoom(int bId) throws Exception{
		mvRoomMapper.delPastMvRoom(bId);
	};
	
	//예약 취소 내역 지우기
	public void delMvUserRoom(int ubId) throws Exception{
		mvRoomMapper.delMvUserRoom(ubId);
	};
}
