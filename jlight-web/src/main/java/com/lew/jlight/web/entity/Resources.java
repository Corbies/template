package com.lew.jlight.web.entity;

import com.lew.jlight.core.BaseEntity;

public class Resources extends BaseEntity {

	private static final long serialVersionUID = 2765044695390695993L;

	private String resId;

	private String name;

	private String url;

	private Integer type;

	private String icon;

	private Integer isShow;

	private Integer seq;

	private String parentId;
	
	private String parentName;

	public String getResId( ) {
		return resId;
	}

	public void setResId( String resId ) {
		this.resId = resId;
	}

	public String getName( ) {
		return name;
	}

	public void setName( String name ) {
		this.name = name;
	}

	public String getUrl( ) {
		return url;
	}

	public void setUrl( String url ) {
		this.url = url;
	}

	public String getIcon( ) {
		return icon;
	}

	public void setIcon( String icon ) {
		this.icon = icon;
	}

	public Integer getSeq( ) {
		return seq;
	}

	public void setSeq( Integer seq ) {
		this.seq = seq;
	}

	public String getParentId( ) {
		return parentId;
	}

	public void setParentId( String parentId ) {
		this.parentId = parentId;
	}

	public Integer getIsShow( ) {
		return isShow;
	}

	public void setIsShow( Integer isShow ) {
		this.isShow = isShow;
	}

	public Integer getType( ) {
		return type;
	}

	public void setType( Integer type ) {
		this.type = type;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
}
