package com.lew.jlight.web.entity;

import java.io.Serializable;

/**
 * 菜单选择树
 * @author Liew
 * Jun 2, 2016
 */
public class SelectTree implements Serializable {
	private static final long serialVersionUID = -8316335361713515430L;

	private String id;

	private String text;

	private String name;

	public String getId( ) {
		return id;
	}

	public void setId( String id ) {
		this.id = id;
	}

	public String getText( ) {
		return text;
	}

	public void setText( String text ) {
		this.text = text;
	}

	public String getName( ) {
		return name;
	}

	public void setName( String name ) {
		this.name = name;
	}

}
