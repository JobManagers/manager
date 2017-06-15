package cn.mldn.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MemberDto implements Serializable {
	private String mid ;
	private String password ;
	private Long eid ;
	private Integer locked ;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getEid() {
		return eid;
	}
	public void setEid(Long eid) {
		this.eid = eid;
	}
	public Integer getLocked() {
		return locked;
	}
	public void setLocked(Integer locked) {
		this.locked = locked;
	}
	
}
