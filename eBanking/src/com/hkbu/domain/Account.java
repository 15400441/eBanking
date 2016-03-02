package com.hkbu.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Account entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "account", catalog = "ebank")
public class Account implements java.io.Serializable
{

	// Fields

	private Long id;
	private String accNo;
	private String currType;
	private String accType;
	private String accAlias;
	private String accStatus;
	private Long balance;
	private Long cusId;

	// Constructors
	
	

	/** default constructor */
	public Account()
	{
	}

	/** minimal constructor */
	public Account(Long id, String accNo, String currType)
	{
		this.id = id;
		this.accNo = accNo;
		this.currType = currType;
	}

	/** full constructor */
	public Account(Long id, String accNo, String currType, String accType, String accAlias, String accStatus,Long balance, Long cusId)
	{
		this.id = id;
		this.accNo = accNo;
		this.currType = currType;
		this.accType = accType;
		this.accAlias = accAlias;
		this.accStatus = accStatus;
		this.balance = balance;
		this.cusId = cusId;
		
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

	@Column(name = "accNo", nullable = false, length = 25)
	public String getAccNo()
	{
		return this.accNo;
	}

	public void setAccNo(String accNo)
	{
		this.accNo = accNo;
	}

	@Column(name = "currType", nullable = false, length = 3)
	public String getCurrType()
	{
		return this.currType;
	}

	public void setCurrType(String currType)
	{
		this.currType = currType;
	}

	@Column(name = "accType", length = 3)
	public String getAccType()
	{
		return this.accType;
	}

	public void setAccType(String accType)
	{
		this.accType = accType;
		
	}

	@Column(name = "accAlias", length = 50)
	public String getAccAlias()
	{
		return this.accAlias;
	}

	public void setAccAlias(String accAlias)
	{
		this.accAlias = accAlias;
	}

	@Column(name = "accStatus", length = 10)
	public String getAccStatus()
	{
		return this.accStatus;
	}

	public void setAccStatus(String accStatus)
	{
		this.accStatus = accStatus;
		
		
	}


	@Column(name = "balance")
	public Long getBalance()
	{
		return this.balance;
	}

	public void setBalance(Long balance)
	{
		this.balance = balance;
	}

	@Column(name = "cusId")
	public Long getCusId()
	{
		return this.cusId;
	}

	public void setCusId(Long cusId)
	{
		this.cusId = cusId;
	}

	
	
	
}