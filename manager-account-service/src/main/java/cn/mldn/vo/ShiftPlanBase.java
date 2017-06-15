package cn.mldn.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ShiftPlanBase implements Serializable {
	private Long shift_plan_base_id ;
	private String plan_name ;
	private String plan_description ;
	private Long create_id ;
	private Date create_time ;
	private Long last_update_user_id ;
	private Date update_time ;
	private Integer last_update_no ;
	private String server_station_code ;
	private String biz_zhy_code ;
	private Integer state ;
	public Long getShift_plan_base_id() {
		return shift_plan_base_id;
	}
	public void setShift_plan_base_id(Long shift_plan_base_id) {
		this.shift_plan_base_id = shift_plan_base_id;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getPlan_description() {
		return plan_description;
	}
	public void setPlan_description(String plan_description) {
		this.plan_description = plan_description;
	}
	public Long getCreate_id() {
		return create_id;
	}
	public void setCreate_id(Long create_id) {
		this.create_id = create_id;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Long getLast_update_user_id() {
		return last_update_user_id;
	}
	public void setLast_update_user_id(Long last_update_user_id) {
		this.last_update_user_id = last_update_user_id;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public Integer getLast_update_no() {
		return last_update_no;
	}
	public void setLast_update_no(Integer last_update_no) {
		this.last_update_no = last_update_no;
	}
	public String getServer_station_code() {
		return server_station_code;
	}
	public void setServer_station_code(String server_station_code) {
		this.server_station_code = server_station_code;
	}
	public String getBiz_zhy_code() {
		return biz_zhy_code;
	}
	public void setBiz_zhy_code(String biz_zhy_code) {
		this.biz_zhy_code = biz_zhy_code;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Shift_Plan_Base [shift_plan_base_id=" + shift_plan_base_id + ", plan_name=" + plan_name
				+ ", plan_description=" + plan_description + ", create_id=" + create_id + ", create_time=" + create_time
				+ ", last_update_user_id=" + last_update_user_id + ", update_time=" + update_time + ", last_update_no="
				+ last_update_no + ", server_station_code=" + server_station_code + ", biz_zhy_code=" + biz_zhy_code
				+ ", state=" + state + "]";
	}
}
