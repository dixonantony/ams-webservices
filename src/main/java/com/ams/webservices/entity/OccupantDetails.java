package com.ams.webservices.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="occupant_details")
public class OccupantDetails {

	@Id
	@Column(name="occupant_dtl_id")
	private long occupantDtlId;
	
	@Column(name="occupant_id")
	private long occupantId;
	
	@Column(name="full_name")
	private String fullName;	
	
	@Column(name="relationship")
	private String relationship;	
	
	@Column(name="dob")
	private Date DOB;

	public OccupantDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OccupantDetails(long occupantDtlId, long occupantId, String fullName, String relationship, Date dOB) {
		super();
		this.occupantDtlId = occupantDtlId;
		this.occupantId = occupantId;
		this.fullName = fullName;
		this.relationship = relationship;
		DOB = dOB;
	}

	public long getOccupantDtlId() {
		return occupantDtlId;
	}

	public void setOccupantDtlId(long occupantDtlId) {
		this.occupantDtlId = occupantDtlId;
	}

	public long getOccupantId() {
		return occupantId;
	}

	public void setOccupantId(long occupantId) {
		this.occupantId = occupantId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}	
	
	
}
