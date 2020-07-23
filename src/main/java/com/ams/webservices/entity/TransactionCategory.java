package com.ams.webservices.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="transaction_category")
public class TransactionCategory {

	@Id
	private String category_cd;
	
	@Column(name="category_name")
	private String categoryName;
	
	@Column(name="category_desc")
	private String category_desc;
	
	@ManyToOne
	@JoinColumn(name = "transaction_type_cd")
	private TransactionType transactionType;
	
	@Column(name="balance")
	private double balance;
	
	@OneToMany(cascade = CascadeType.ALL)//(mappedBy="transactionCategory")
	@JoinColumn(name = "category_cd")
	private List<TransactionSubCategory> transactionSubCategory = new ArrayList<>();
	
	public TransactionCategory() {
		super();
	}

	public TransactionCategory(String category_cd, String category_name, String category_desc,
			TransactionType transactionType, double balance, List<TransactionSubCategory> transactionSubCategory) {
		super();
		this.category_cd = category_cd;
		this.categoryName = category_name;
		this.category_desc = category_desc;
		this.transactionType = transactionType;
		this.balance = balance;
		this.transactionSubCategory = transactionSubCategory;
	}

	public String getCategory_cd() {
		return category_cd;
	}

	public void setCategory_cd(String category_cd) {
		this.category_cd = category_cd;
	}

	public String getCategory_name() {
		return categoryName;
	}

	public void setCategory_name(String category_name) {
		this.categoryName = category_name;
	}

	public String getCategory_desc() {
		return category_desc;
	}

	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}

	public TransactionType getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(TransactionType transactionType) {
		this.transactionType = transactionType;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public List<TransactionSubCategory> getTransactionSubCategory() {
		return transactionSubCategory;
	}

	public void setTransactionSubCategory(List<TransactionSubCategory> transactionSubCategory) {
		this.transactionSubCategory = transactionSubCategory;
	}	
	
	public void addSubCategory(TransactionSubCategory subCategory) {
		this.transactionSubCategory.add(subCategory);
	}	
	
	public void removeSubCategory(TransactionSubCategory subCategory) {
		this.transactionSubCategory.remove(subCategory);
	}
	
}
