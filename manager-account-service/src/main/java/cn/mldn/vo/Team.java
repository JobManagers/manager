package cn.mldn.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Team implements Serializable{
	private Long id;
	private String name;
	private Long leader_id;
	private Long create_id;
	private String last_update_user_id;
	private Date create_time;
	private Date update_time;
	private Long team_id;
	private Integer last_update_no;
	private Integer state;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(Long leader_id) {
		this.leader_id = leader_id;
	}
	public Long getCreate_id() {
		return create_id;
	}
	public void setCreate_id(Long create_id) {
		this.create_id = create_id;
	}
	public String getLast_update_user_id() {
		return last_update_user_id;
	}
	public void setLast_update_user_id(String last_update_user_id) {
		this.last_update_user_id = last_update_user_id;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public Long getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Long team_id) {
		this.team_id = team_id;
	}
	public Integer getLast_update_no() {
		return last_update_no;
	}
	public void setLast_update_no(Integer last_update_no) {
		this.last_update_no = last_update_no;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Team [id=" + id + ", name=" + name + ", leader_id=" + leader_id + ", create_id=" + create_id
				+ ", last_update_user_id=" + last_update_user_id + ", create_time=" + create_time + ", update_time="
				+ update_time + ", team_id=" + team_id + ", last_update_no=" + last_update_no + ", state=" + state
				+ "]";
	}
	
	
	
}
