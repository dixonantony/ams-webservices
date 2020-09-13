package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="appartments")
public class Appartment {
	
	@Id
	@Column(name="appartment_cd")
	private String appartmentCode;
	
	@OneToOne
	@JoinColumn(name = "appartment_type_cd")
	private AppartmentType appartmentType;

	@Column(name="floor")
	private int floor;

	public Appartment() {
		super();
	}

	public Appartment(String appartmentCode, AppartmentType appartmentType, int floor) {
		super();
		this.appartmentCode = appartmentCode;
		this.appartmentType = appartmentType;
		this.floor = floor;
	}

	public String getAppartmentCode() {
		return appartmentCode;
	}

	public void setAppartmentCode(String appartmentCode) {
		this.appartmentCode = appartmentCode;
	}

	public AppartmentType getAppartmentType() {
		return appartmentType;
	}

	public void setAppartmentType(AppartmentType appartmentType) {
		this.appartmentType = appartmentType;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}	
	
}
