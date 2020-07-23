package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="transaction_sub_category")
public class TransactionSubCategory {

	@Id
	@Column(name="trans_sub_cat_cd")
	private String trans_sub_cat_cd;
	
	@Column(name="trans_sub_cat_name")
	private String transSubCatName;
	
	@Column(name="trans_sub_cat_desc")
	private String trans_sub_cat_desc;
	
//	@ManyToOne
//	@JoinColumn(name = "category_cd")
//	private TransactionCategory transactionCategory;
	
	@Column(name="balance")
	private double balance;
	
	public TransactionSubCategory() {
		super();
	}

	public TransactionSubCategory(String trans_sub_cat_cd, String trans_sub_cat_name, String trans_sub_cat_desc,
			 double balance) {
		super();
		this.trans_sub_cat_cd = trans_sub_cat_cd;
		this.transSubCatName = trans_sub_cat_name;
		this.trans_sub_cat_desc = trans_sub_cat_desc;
//		this.transactionCategory = transactionCategory;
		this.balance = balance;
	}

	public String getTrans_sub_cat_cd() {
		return trans_sub_cat_cd;
	}

	public void setTrans_sub_cat_cd(String trans_sub_cat_cd) {
		this.trans_sub_cat_cd = trans_sub_cat_cd;
	}

	public String getTrans_sub_cat_name() {
		return transSubCatName;
	}

	public void setTrans_sub_cat_name(String trans_sub_cat_name) {
		this.transSubCatName = trans_sub_cat_name;
	}

	public String getTrans_sub_cat_desc() {
		return trans_sub_cat_desc;
	}

	public void setTrans_sub_cat_desc(String trans_sub_cat_desc) {
		this.trans_sub_cat_desc = trans_sub_cat_desc;
	}

//	public TransactionCategory getTransactionCategory() {
//		return transactionCategory;
//	}
//
//	public void setTransactionCategory(TransactionCategory transactionCategory) {
//		this.transactionCategory = transactionCategory;
//	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}	
	
}
