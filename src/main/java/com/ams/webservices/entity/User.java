package com.ams.webservices.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@Table(name="users")
public class User {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable = false, updatable = false)
	private int user_id;
	
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private String mobNo;
	
	@Column(insertable = false, updatable = false)
	private Date created;
	
	@Column(insertable = false, updatable = false)
	private Date lastUpdated;
	
	@OneToOne
	@JoinColumn(name = "occupant_id")
	private Occupant occupant;
	
	@ManyToOne
	@JoinColumn(name = "role_cd")
	private Role role;
	
	public User() {
	}	


	public User(int user_id, String username, String password, String firstName, String lastName, String email,
			String mobNo, Date created, Date lastUpdated, Occupant occupant, Role role) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobNo = mobNo;
		this.created = created;
		this.lastUpdated = lastUpdated;
		this.occupant = occupant;
		this.role = role;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
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

	public void setPassword(String password) {
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		this.password = pwdEncoder.encode(password);
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}


	public Occupant getOccupant() {
		return occupant;
	}


	public void setOccupant(Occupant occupant) {
		this.occupant = occupant;
	}	

	
}
