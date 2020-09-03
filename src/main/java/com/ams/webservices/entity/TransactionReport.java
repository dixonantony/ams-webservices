package com.ams.webservices.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TransactionReport {
	
	@Id
	private long transactionId;
	
	@Column(name="trans_sub_cat_name")
	private String transSubCategoryName;
	
	private Date transactionDate;
	
	@Column(name="transaction_amount")
	private double amount;
	
	private String transactionDesc;
	private String creditDebit;
	private String transactionRefNo;	
	private String accountName;
	private String paymentType;
	private Date lastUpdated;
	private String username;
	private String voucherNo;
	
	public TransactionReport() {
		super();
	}

	

	public TransactionReport(long transactionId, String transSubCategoryName, Date transactionDate, double amount,
			String transactionDesc, String creditDebit, String transactionRefNo, String accountName, String paymentType,
			Date lastUpdated, String username, String voucherNo) {
		super();
		this.transactionId = transactionId;
		this.transSubCategoryName = transSubCategoryName;
		this.transactionDate = transactionDate;
		this.amount = amount;
		this.transactionDesc = transactionDesc;
		this.creditDebit = creditDebit;
		this.transactionRefNo = transactionRefNo;
		this.accountName = accountName;
		this.paymentType = paymentType;
		this.lastUpdated = lastUpdated;
		this.username = username;
		this.voucherNo = voucherNo;
	}



	public long getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransSubCategoryName() {
		return transSubCategoryName;
	}

	public void setTransSubCategoryName(String transSubCategoryName) {
		this.transSubCategoryName = transSubCategoryName;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getTransactionDesc() {
		return transactionDesc;
	}

	public void setTransactionDesc(String transactionDesc) {
		this.transactionDesc = transactionDesc;
	}

	public String getCreditDebit() {
		return creditDebit;
	}

	public void setCreditDebit(String creditDebit) {
		this.creditDebit = creditDebit;
	}

	public String getTransactionRefNo() {
		return transactionRefNo;
	}

	public void setTransactionRefNo(String transactionRefNo) {
		this.transactionRefNo = transactionRefNo;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Date getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}



	public String getVoucherNo() {
		return voucherNo;
	}



	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}	
	
	
}
