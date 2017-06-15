package cn.mldn.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ShiftTableDetail implements Serializable {
	private Long shift_table_detail_id;
	private Long shift_table_base_id;
	private Long employee_id;
	private String employee_name;
	private Long team_id;
	private String team_name;
	private String shift_data;
	private Integer duty_days;
	private Integer shift_order;
	public Long getShift_table_detail_id() {
		return shift_table_detail_id;
	}
	public void setShift_table_detail_id(Long shift_table_detail_id) {
		this.shift_table_detail_id = shift_table_detail_id;
	}
	public Long getShift_table_base_id() {
		return shift_table_base_id;
	}
	public void setShift_table_base_id(Long shift_table_base_id) {
		this.shift_table_base_id = shift_table_base_id;
	}
	public Long getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Long employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public Long getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Long team_id) {
		this.team_id = team_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getShift_data() {
		return shift_data;
	}
	public void setShift_data(String shift_data) {
		this.shift_data = shift_data;
	}
	public Integer getDuty_days() {
		return duty_days;
	}
	public void setDuty_days(Integer duty_days) {
		this.duty_days = duty_days;
	}
	public Integer getShift_order() {
		return shift_order;
	}
	public void setShift_order(Integer shift_order) {
		this.shift_order = shift_order;
	}
	@Override
	public String toString() {
		return "ShiftTableDetail [shift_table_detail_id=" + shift_table_detail_id + ", shift_table_base_id="
				+ shift_table_base_id + ", employee_id=" + employee_id + ", employee_name=" + employee_name
				+ ", team_id=" + team_id + ", team_name=" + team_name + ", shift_data=" + shift_data + ", duty_days="
				+ duty_days + ", shift_order=" + shift_order + "]";
	}
	
}
