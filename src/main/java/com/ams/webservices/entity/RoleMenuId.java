package com.ams.webservices.entity;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RoleMenuId  implements java.io.Serializable {
	
	@Column(name="role_cd")
	private String roleCode;
 
	@Column(name="sub_menu_cd")
	private String subMenuCode;

	public RoleMenuId() {}

	public RoleMenuId(String roleCode, String subMenuCode) {
		super();
		this.roleCode = roleCode;
		this.subMenuCode = subMenuCode;
	}	
	 
    public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getSubMenuCode() {
		return subMenuCode;
	}

	public void setSubMenuCode(String subMenuCode) {
		this.subMenuCode = subMenuCode;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
 
        if (o == null || getClass() != o.getClass())
            return false;
 
        RoleMenuId that = (RoleMenuId) o;
        return Objects.equals(roleCode, that.roleCode) &&
               Objects.equals(subMenuCode, that.subMenuCode);
    }
 
    @Override
    public int hashCode() {
        return Objects.hash(roleCode, subMenuCode);
    }
}
