package com.ams.webservices.entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="accounts")
public class Account {

	@Id
	private String account_cd;
	private String accountName;
	private String account_no;
	private String account_bank;
	private String desc_txt;
	private String ifsc_cd;
	private double account_balance;
	private char active;
	
	@CreationTimestamp
	private Date created;

	public Account() {
		super();
	}

	public Account(String account_cd, String account_name, String account_no, String account_bank, String desc_txt,
			String ifsc_cd, double account_balance, char active, Date created) {
		super();
		this.account_cd = account_cd;
		this.accountName = account_name;
		this.account_no = account_no;
		this.account_bank = account_bank;
		this.desc_txt = desc_txt;
		this.ifsc_cd = ifsc_cd;
		this.account_balance = account_balance;
		this.active = active;
		this.created = created;
	}

	public String getAccount_cd() {
		return account_cd;
	}

	public void setAccount_cd(String account_cd) {
		this.account_cd = account_cd;
	}

	public String getAccount_name() {
		return accountName;
	}

	public void setAccount_name(String account_name) {
		this.accountName = account_name;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getAccount_bank() {
		return account_bank;
	}

	public void setAccount_bank(String account_bank) {
		this.account_bank = account_bank;
	}

	public String getDesc_txt() {
		return desc_txt;
	}

	public void setDesc_txt(String desc_txt) {
		this.desc_txt = desc_txt;
	}

	public String getIfsc_cd() {
		return ifsc_cd;
	}

	public void setIfsc_cd(String ifsc_cd) {
		this.ifsc_cd = ifsc_cd;
	}

	public double getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(double account_balance) {
		this.account_balance = account_balance;
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
	
}
