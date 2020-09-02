package com.ams.webservices.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="transaction")
public class Transaction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="transaction_id",insertable = false, updatable = false)
	private long transactionId;
	
	@Column(name="transaction_desc")
	private String transactionDesc;
	
	@Column(name="trans_sub_cat_cd")
	private String transSubCategoryCd;	
	
	@Column(name = "credit_debit")
	private String creditDebit;

	@Column(name = "transaction_ref_no")
	private String transactionRefNo;
	
	@Column(name = "account_cd")
	private String accountCd;
	
	@Column(name = "payment_type")
	private String paymentType;
	
	@Column(name="transaction_amount")
	private double amount;
	
	@Column(name="transaction_date")
	private Date transactionDate;
	
	@CreationTimestamp
	@Column(name="created")
	private Date created;
	
	@UpdateTimestamp
	@Column(name="last_updated")
	private Date lastUpdated;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "voucher_no")
	private String voucherNo;
	
	
	public Transaction() {
		super();
	}


	public Transaction(long transactionId, String transactionDesc, String transSubCategoryCd, String creditDebit,
			String transactionRefNo, String accountCd, String paymentType, double amount, Date transactionDate,
			Date created, Date lastUpdated, String username, String voucherNo) {
		super();
		this.transactionId = transactionId;
		this.transactionDesc = transactionDesc;
		this.transSubCategoryCd = transSubCategoryCd;
		this.creditDebit = creditDebit;
		this.transactionRefNo = transactionRefNo;
		this.accountCd = accountCd;
		this.paymentType = paymentType;
		this.amount = amount;
		this.transactionDate = transactionDate;
		this.created = created;
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


	public String getTransactionDesc() {
		return transactionDesc;
	}


	public void setTransactionDesc(String transactionDesc) {
		this.transactionDesc = transactionDesc;
	}


	public String getTransSubCategoryCd() {
		return transSubCategoryCd;
	}


	public void setTransSubCategoryCd(String transSubCategoryCd) {
		this.transSubCategoryCd = transSubCategoryCd;
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


	public String getAccountCd() {
		return accountCd;
	}


	public void setAccountCd(String accountCd) {
		this.accountCd = accountCd;
	}


	public String getPaymentType() {
		return paymentType;
	}


	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}


	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
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
