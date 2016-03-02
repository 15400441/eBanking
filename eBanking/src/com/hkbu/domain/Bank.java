package com.hkbu.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Bank entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bank", catalog = "ebank")
public class Bank implements java.io.Serializable
{

	// Fields

	private Long id;
	private String bankNo;
	private String bankName;

	// Constructors

	/** default constructor */
	public Bank()
	{
	}

	/** full constructor */
	public Bank(Long id, String bankNo, String bankName)
	{
		this.id = id;
		this.bankNo = bankNo;
		this.bankName = bankName;
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

	@Column(name = "bankNo", nullable = false, length = 30)
	public String getBankNo()
	{
		return this.bankNo;
	}

	public void setBankNo(String bankNo)
	{
		this.bankNo = bankNo;
	}

	@Column(name = "bankName", nullable = false, length = 40)
	public String getBankName()
	{
		return this.bankName;
	}

	public void setBankName(String bankName)
	{
		this.bankName = bankName;
	}

}