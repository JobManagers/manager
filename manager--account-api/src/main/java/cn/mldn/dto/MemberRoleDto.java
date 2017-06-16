package cn.mldn.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MemberRoleDto implements Serializable {
	private String mid ;
	private String rid ;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	
}
