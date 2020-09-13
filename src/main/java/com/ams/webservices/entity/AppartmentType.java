package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="appartment_types")
public class AppartmentType {
	
	@Id
	@Column(name="appartment_type_cd")
	private String appartmentTypeCode;
	
	@Column(name="square_ft")
	private int squareFeet;
	
	@Column(name="no_of_bedroom")
	private int noOfBedroom;

	public AppartmentType() {
		super();
	}

	public AppartmentType(String appartmentTypeCode, int squareFeet, int noOfBedroom) {
		super();
		this.appartmentTypeCode = appartmentTypeCode;
		this.squareFeet = squareFeet;
		this.noOfBedroom = noOfBedroom;
	}

	public String getAppartmentTypeCode() {
		return appartmentTypeCode;
	}

	public void setAppartmentTypeCode(String appartmentTypeCode) {
		this.appartmentTypeCode = appartmentTypeCode;
	}

	public int getSquareFeet() {
		return squareFeet;
	}

	public void setSquareFeet(int squareFeet) {
		this.squareFeet = squareFeet;
	}

	public int getNoOfBedroom() {
		return noOfBedroom;
	}

	public void setNoOfBedroom(int noOfBedroom) {
		this.noOfBedroom = noOfBedroom;
	}	
	
}
