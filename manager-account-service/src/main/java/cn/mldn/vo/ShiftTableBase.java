package cn.mldn.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ShiftTableBase implements Serializable {	
	private Long shift_table_base_id;
	private String table_name;
	private Long shift_plan_base_id;
	private Date start_date;
	private Date end_date;
	private Long create_id;
	private Date create_time;
	private Long last_update_user_id;
	private Date update_time;
	private Integer last_update_no;
	private String server_station_code;
	private String biz_zhy_code;
	private Integer shift_type;
	private Integer state;
	public Long getShift_table_base_id() {
		return shift_table_base_id;
	}
	public void setShift_table_base_id(Long shift_table_base_id) {
		this.shift_table_base_id = shift_table_base_id;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public Long getShift_plan_base_id() {
		return shift_plan_base_id;
	}
	public void setShift_plan_base_id(Long shift_plan_base_id) {
		this.shift_plan_base_id = shift_plan_base_id;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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
	public Integer getShift_type() {
		return shift_type;
	}
	public void setShift_type(Integer shift_type) {
		this.shift_type = shift_type;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Shift_Plan_Base [shift_table_base_id=" + shift_table_base_id + ", table_name=" + table_name
				+ ", shift_plan_base_id=" + shift_plan_base_id + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", create_id=" + create_id + ", create_time=" + create_time + ", last_update_user_id="
				+ last_update_user_id + ", update_time=" + update_time + ", last_update_no=" + last_update_no
				+ ", server_station_code=" + server_station_code + ", biz_zhy_code=" + biz_zhy_code + ", shift_type="
				+ shift_type + ", state=" + state + "]";
	}
	
}
