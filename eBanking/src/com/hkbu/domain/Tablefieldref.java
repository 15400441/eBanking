package com.hkbu.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Tablefieldref entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tablefieldref", catalog = "ebank")
public class Tablefieldref implements java.io.Serializable
{

	// Fields

	private Long id;
	private String tableField;
	private String code;
	private String name;

	// Constructors

	/** default constructor */
	public Tablefieldref()
	{
	}

	/** minimal constructor */
	public Tablefieldref(Long id, String tableField, String code)
	{
		this.id = id;
		this.tableField = tableField;
		this.code = code;
	}

	/** full constructor */
	public Tablefieldref(Long id, String tableField, String code, String name)
	{
		this.id = id;
		this.tableField = tableField;
		this.code = code;
		this.name = name;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	@Column(name = "tableField", nullable = false, length = 50)
	public String getTableField()
	{
		return this.tableField;
	}

	public void setTableField(String tableField)
	{
		this.tableField = tableField;
	}

	@Column(name = "code", nullable = false, length = 4)
	public String getCode()
	{
		return this.code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	@Column(name = "name", length = 40)
	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

}