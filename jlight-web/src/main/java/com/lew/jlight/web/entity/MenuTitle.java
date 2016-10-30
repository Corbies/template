package com.lew.jlight.web.entity;

import com.lew.jlight.core.BaseEntity;

import java.util.List;

public class MenuTitle extends BaseEntity {
	private static final long serialVersionUID = -96863757036309152L;

	private String name;

	private String titleId;

	private Integer seq;

	private List<Menu> resources;

	public Integer getSeq( ) {
		return seq;
	}

	public void setSeq( Integer seq ) {
		this.seq = seq;
	}

	public List<Menu> getResources( ) {
		return resources;
	}

	public void setResources( List<Menu> resources ) {
		this.resources = resources;
	}

	public String getTitleId( ) {
		return titleId;
	}

	public void setTitleId( String titleId ) {
		this.titleId = titleId;
	}

	public String getName( ) {
		return name;
	}

	public void setName( String name ) {
		this.name = name;
	}

}
