package com.lew.jlight.web.entity;

import com.lew.jlight.core.BaseEntity;

public class RoleRes extends BaseEntity {
	private static final long serialVersionUID = 3055368754757987269L;

	private String roleId;
	
	private String resId;
	
	public String getRoleId( ) {
		return roleId;
	}

	public void setRoleId( String roleId ) {
		this.roleId = roleId;
	}

	public String getResId( ) {
		return resId;
	}

	public void setResId( String resId ) {
		this.resId = resId;
	}
}
