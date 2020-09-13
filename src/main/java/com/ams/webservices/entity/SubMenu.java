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
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="sub_menus", catalog = "ams", uniqueConstraints = {
		@UniqueConstraint(columnNames = "sub_menu_name"),
		@UniqueConstraint(columnNames = "menu_url") })
public class SubMenu {
	
	@Id
	@Column(name="sub_menu_cd")
	private String subMenuCode;
	
	@Column(name="sub_menu_name")
	private String subMenuName;
	
	@Column(name="menu_url")
	private String menuURL;
	
	@ManyToOne
	@JoinColumn(name = "menu_cd")
	@JsonIgnore
	@Transient
	private Menu menu;
	
//	@OneToMany(
//	        mappedBy = "subMenu",
//	        cascade = CascadeType.ALL,
//	        orphanRemoval = true
//	    )
//	@JsonIgnore
//	@Transient
//	private List<RoleMenu> roles = new ArrayList<>();

	public SubMenu() {}	

	public SubMenu(String subMenuCode, String subMenuName, String menuURL, Menu menu) {
		super();
		this.subMenuCode = subMenuCode;
		this.subMenuName = subMenuName;
		this.menuURL = menuURL;
		this.menu = menu;
	}

//	public SubMenu(String subMenuCode, String subMenuName, String menuURL, Menu menu, List<RoleMenu> roles) {
//		super();
//		this.subMenuCode = subMenuCode;
//		this.subMenuName = subMenuName;
//		this.menuURL = menuURL;
//		this.menu = menu;
//		this.roles = roles;
//	}


	public String getSubMenuCode() {
		return subMenuCode;
	}

	public void setSubMenuCode(String subMenuCode) {
		this.subMenuCode = subMenuCode;
	}

	public String getSubMenuName() {
		return subMenuName;
	}

	public void setSubMenuName(String subMenuName) {
		this.subMenuName = subMenuName;
	}

	public String getMenuURL() {
		return menuURL;
	}

	public void setMenuURL(String menuURL) {
		this.menuURL = menuURL;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	
	
}
