package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TransactionSubCategoryReport {
	
	@Id
	@Column(name="trans_sub_cat_cd")
	private String transactionSubCategoryCode;
	
	@Column(name="trans_sub_cat_name")
	private String transactionSubCategoryName;
	
	@Column(name="trans_sub_cat_desc")
	private String transactionSubCategoryDesc;
	
	@Column(name="total")
	private double total;
	
	public TransactionSubCategoryReport() {
		super();
	}

	public TransactionSubCategoryReport(String transactionSubCategoryCode, String transactionSubCategoryName,
			String transactionSubCategoryDesc, double total) {
		super();
		this.transactionSubCategoryCode = transactionSubCategoryCode;
		this.transactionSubCategoryName = transactionSubCategoryName;
		this.transactionSubCategoryDesc = transactionSubCategoryDesc;
		this.total = total;
	}

	public String getTransactionSubCategoryCode() {
		return transactionSubCategoryCode;
	}

	public void setTransactionSubCategoryCode(String transactionSubCategoryCode) {
		this.transactionSubCategoryCode = transactionSubCategoryCode;
	}

	public String getTransactionSubCategoryName() {
		return transactionSubCategoryName;
	}

	public void setTransactionSubCategoryName(String transactionSubCategoryName) {
		this.transactionSubCategoryName = transactionSubCategoryName;
	}

	public String getTransactionSubCategoryDesc() {
		return transactionSubCategoryDesc;
	}

	public void setTransactionSubCategoryDesc(String transactionSubCategoryDesc) {
		this.transactionSubCategoryDesc = transactionSubCategoryDesc;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	
	
}
