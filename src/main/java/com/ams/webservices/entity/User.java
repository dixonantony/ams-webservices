package com.ams.webservices.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@Table(name="user")
public class User {
	
	@Id
	@Column(name="name")
	String Username;
	
	String Role;
	String Password;
	
	public User() {
	}
	
	public User(String username, String role, String password) {
		super();
		Username = username;
		Role = role;
		Password = password;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		Password = pwdEncoder.encode(password);
	}	

}
