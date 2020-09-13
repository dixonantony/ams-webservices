package com.ams.webservices.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="roles")
//@Where(clause = "role_cd not in('ADMN','GEST')")
public class Role {

	@Id
	@Column(name="role_cd")
	private String roleCode;
	
	@Column(name="role_name")
	private String roleName;
	
	@Column(name="role_desc")
	private String roleDescription;
	
	@OneToMany(mappedBy = "role")
	@JsonIgnore
	private Set<User> users = new HashSet<User>();
	
	@OneToMany(fetch = FetchType.EAGER,
//	        mappedBy = "roleCode",
	        cascade = CascadeType.ALL,
	        orphanRemoval = true
	    )
	@JoinColumn(name = "role_cd")
	private List<RoleMenu> subMenus = new ArrayList<>();

	public Role() {
		super();
	}


	public Role(String roleCode, String roleName, String roleDescription, Set<User> users, List<RoleMenu> subMenus) {
		super();
		this.roleCode = roleCode;
		this.roleName = roleName;
		this.roleDescription = roleDescription;
		this.users = users;
		this.subMenus = subMenus;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}	

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public List<RoleMenu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<RoleMenu> subMenus) {
		this.subMenus = subMenus;
	}
	
}


