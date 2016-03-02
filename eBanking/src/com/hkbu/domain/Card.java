package com.hkbu.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Card entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "card", catalog = "ebank")
public class Card implements java.io.Serializable
{

	// Fields

	private Long id;
	private String status;
	private String cardNo;
	private String type;
	private Long accId;

	// Constructors

	/** default constructor */
	public Card()
	{
	}

	/** minimal constructor */
	public Card(String cardNo)
	{
		this.cardNo = cardNo;
	}

	/** full constructor */
	public Card(String status, String cardNo, String type, Long accId)
	{
		this.status = status;
		this.cardNo = cardNo;
		this.type = type;
		this.accId = accId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	@Column(name = "Status", length = 2)
	public String getStatus()
	{
		return this.status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	@Column(name = "cardNo", nullable = false, length = 20)
	public String getCardNo()
	{
		return this.cardNo;
	}

	public void setCardNo(String cardNo)
	{
		this.cardNo = cardNo;
	}

	@Column(name = "type", length = 2)
	public String getType()
	{
		return this.type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	@Column(name = "accId")
	public Long getAccId()
	{
		return this.accId;
	}

	public void setAccId(Long accId)
	{
		this.accId = accId;
	}

}