package com.ams.webservices.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="menus")
public class Menu {
	
	@Id
	@Column(name="menu_cd")
	private String menuCode;
	
	@Column(name="menu_name")
	private String menuName;

	@OneToMany(cascade = CascadeType.ALL, mappedBy="menu")
	@Transient
	private List<SubMenu> subMenus = new ArrayList<>();

	public Menu() {
		super();
	}

	public Menu(String menuCode, String menuName, List<SubMenu> subMenus) {
		super();
		this.menuCode = menuCode;
		this.menuName = menuName;
		this.subMenus = subMenus;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public List<SubMenu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<SubMenu> subMenus) {
		this.subMenus = subMenus;
	}
	
	
}
