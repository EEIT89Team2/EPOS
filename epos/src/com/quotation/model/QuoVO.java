package com.quotation.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.quotation_detail.model.QuoDetailVO;

public class QuoVO implements java.io.Serializable{
	private String quo_id;
	private String req_id;
	private String remark;
	private String status;
	
	//hibernate
	private Set<QuoDetailVO> quoDetails =new HashSet<QuoDetailVO>();

	public String getQuo_id() {
		return quo_id;
	}
	
	public void setQuo_id(String quo_id) {
		this.quo_id = quo_id;
	}
	
	public String getReq_id() {
		return req_id;
	}
	
	public void setReq_id(String req_id) {
		this.req_id = req_id;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Set<QuoDetailVO> getQuoDetails() {
		return quoDetails;
	}
	
	public void setQuoDetails(Set<QuoDetailVO> quoDetails) {
		this.quoDetails = quoDetails;
	}
}
