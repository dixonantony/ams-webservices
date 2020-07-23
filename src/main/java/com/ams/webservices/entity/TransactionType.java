package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="transaction_types")
public class TransactionType {

	@Id
	private String transaction_type_cd;
	
	@Column(name="transaction_type")
	private String transaction_type;
	
	
	public TransactionType() {
		super();
	}
	
	public TransactionType(String transaction_type_cd, String transaction_type) {
		super();
		this.transaction_type_cd = transaction_type_cd;
		this.transaction_type = transaction_type;
	}

	public String getAccount_type_cd() {
		return transaction_type_cd;
	}

	public void setAccount_type_cd(String transaction_type_cd) {
		this.transaction_type_cd = transaction_type_cd;
	}

	public String getAccount_type() {
		return transaction_type;
	}

	public void setAccount_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	
	
}
