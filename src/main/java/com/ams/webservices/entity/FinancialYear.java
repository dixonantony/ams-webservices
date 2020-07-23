package com.ams.webservices.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

@Entity
@Table(name="financial_year")
@Where(clause = "active='Y'")
public class FinancialYear {
	@Id
	int year;
	Date startDate;
	Date endDate;
	char currentYear;	
	char active;
	
	@Column(insertable = false, updatable = false)
	Date created;
	@Column(insertable = false, updatable = false)
	Date lastUpdated; 
	
	public FinancialYear() {
		super();
	}	
	
	public FinancialYear(int year, Date startDate, Date endDate, char currentYear, char active, Date created,
			Date lastUpdated) {
		super();
		this.year = year;
		this.startDate = startDate;
		this.endDate = endDate;
		this.currentYear = currentYear;
		this.active = active;
		this.created = created;
		this.lastUpdated = lastUpdated;
	}



	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public char getCurrentYear() {
		return currentYear;
	}

	public void setCurrentYear(char currentYear) {
		this.currentYear = currentYear;
	}

	public char getActive() {
		return active;
	}

	public void setActive(char active) {
		this.active = active;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	
}
