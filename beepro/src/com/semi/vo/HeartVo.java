// 관심관련 정보vo

package com.semi.vo;

public class HeartVo {
	private int h_send;
	private int h_get;
	
	public HeartVo() {
		super();
	}
	
	public int getH_send() {
		return h_send;
	}
	public void setH_send(int h_send) {
		this.h_send = h_send;
	}
	public int getH_get() {
		return h_get;
	}
	public void setH_get(int h_get) {
		this.h_get = h_get;
	}

	@Override
	public String toString() {
		return "HeartVo [h_send=" + h_send + ", h_get=" + h_get + "]";
	}
	
	
}
