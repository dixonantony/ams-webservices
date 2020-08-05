package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TransactionCategoryReport {
	
	@Id
	@Column(name="category_cd")
	private String categoryCode;
	
	@Column(name="category_name")
	private String categoryName;
	
	@Column(name="category_desc")
	private String categoryDescription;
	
	@Column(name="total")
	private double total;
	
	public TransactionCategoryReport() {
		super();
	}

	public TransactionCategoryReport(String categoryCode, String categoryName, String categoryDescription,
			double total) {
		super();
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
		this.total = total;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}	
	
}
