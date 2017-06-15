package cn.mldn.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MemberRole implements Serializable{
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
	@Override
	public String toString() {
		return "Member_Role [mid=" + mid + ", rid=" + rid + "]";
	}
	
}
