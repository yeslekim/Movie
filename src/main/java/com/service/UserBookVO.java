package com.service;

import java.util.List;

public class UserBookVO {
	private int ubId;
	private int bId;
	private int mvroom;
	private String userId;
	private String seats;
	private int totalmoney;
	private String bookTime;
	private String seat2;
	
	
	public int getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(int totalmoney) {
		this.totalmoney = totalmoney;
	}
	public String getBookTime() {
		return bookTime;
	}
	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}
	public int getUbId() {
		return ubId;
	}
	public void setUbId(int ubId) {
		this.ubId = ubId;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getMvroom() {
		return mvroom;
	}
	public void setMvroom(int mvroom) {
		this.mvroom = mvroom;
	}
	
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSeat2() {
		return seat2;
	}
	public void setSeat2(String seat2) {
		this.seat2 = seat2;
	}
	
	
	
	
}
