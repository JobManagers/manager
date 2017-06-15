package cn.mldn.dto;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ShiftPlanDetailDto implements Serializable {
	private Long shift_plan_detail_id;
	private Long shift_plan_base_id;
	private String detail_name;
	private String start_time;
	private String end_time;
	private Integer days;
	private Integer exc_order;
	public Long getShift_plan_detail_id() {
		return shift_plan_detail_id;
	}
	public void setShift_plan_detail_id(Long shift_plan_detail_id) {
		this.shift_plan_detail_id = shift_plan_detail_id;
	}
	public Long getShift_plan_base_id() {
		return shift_plan_base_id;
	}
	public void setShift_plan_base_id(Long shift_plan_base_id) {
		this.shift_plan_base_id = shift_plan_base_id;
	}
	public String getDetail_name() {
		return detail_name;
	}
	public void setDetail_name(String detail_name) {
		this.detail_name = detail_name;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public Integer getExc_order() {
		return exc_order;
	}
	public void setExc_order(Integer exc_order) {
		this.exc_order = exc_order;
	}
	@Override
	public String toString() {
		return "Shift_Plan_Detail [shift_plan_detail_id=" + shift_plan_detail_id + ", shift_plan_base_id="
				+ shift_plan_base_id + ", detail_name=" + detail_name + ", start_time=" + start_time + ", end_time="
				+ end_time + ", days=" + days + ", exc_order=" + exc_order + "]";
	}
}
