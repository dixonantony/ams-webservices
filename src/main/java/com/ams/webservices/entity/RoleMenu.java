package com.ams.webservices.entity;


import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="role_menu")
public class RoleMenu {

	@EmbeddedId // composite-id key
	@JsonIgnore
	private RoleMenuId id;		
//	@ManyToOne(fetch = FetchType.LAZY)
//    @MapsId("roleCode")
//	@JoinColumn(name = "role_cd")
//	@JsonIgnore
//    private Role role;
	
//	@Column(name="role_cd")
//	private String roleCode;
 
    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("subMenuCode")
    @JoinColumn(name = "sub_menu_cd")
    private SubMenu subMenu; 
	
	@Column(name="enable_view")
	private char enableView;
	
	@Column(name="enable_save")
	private char enableSave;
	
	@Column(name="enable_delete")
	private char enableDelete;

	public RoleMenu() {}


	public RoleMenu(RoleMenuId id, SubMenu subMenu, char enableView, char enableSave, char enableDelete) {
		super();
		this.id = id;
		this.subMenu = subMenu;
		this.enableView = enableView;
		this.enableSave = enableSave;
		this.enableDelete = enableDelete;
	}

	public RoleMenuId getId() {
		return id;
	}

	public void setId(RoleMenuId id) {
		this.id = id;
	}

	
	public SubMenu getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(SubMenu subMenu) {
		this.subMenu = subMenu;
	}


	public char getEnableView() {
		return enableView;
	}


	public void setEnableView(char enableView) {
		this.enableView = enableView;
	}


	public char getEnableSave() {
		return enableSave;
	}


	public void setEnableSave(char enableSave) {
		this.enableSave = enableSave;
	}


	public char getEnableDelete() {
		return enableDelete;
	}


	public void setEnableDelete(char enableDelete) {
		this.enableDelete = enableDelete;
	}

//	@Override
//	    public boolean equals(Object o) {
//	        if (this == o) return true;
//	 
//	        if (o == null || getClass() != o.getClass())
//	            return false;
//	 
//	        RoleMenu that = (RoleMenu) o;
//	        return Objects.equals(role, that.role) &&
//	               Objects.equals(subMenu, that.subMenu);
//	    }
//	 
//	    @Override
//	    public int hashCode() {
//	        return Objects.hash(role, subMenu);
//	    }
 
}

