package com.hkbu.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * Transfer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "transfer", catalog = "ebank")
public class Transfer implements java.io.Serializable
{

	// Fields

	private Long id;
	private String tranNo;
	private Long customerId;
	private String tranType;
	private String tranStatus;
	private String accOutNo;
	private String accInNo;
	private String currType;
	private String tranLevel;
	private Date tranDate;
	private Long tranAmount;
	private String tranUse;
	private String inBankNo;
	private String outBankNo;
    
	
	// Constructors

	/** default constructor */
	public Transfer()
	{
	}

	/** minimal constructor */
	public Transfer(Long id, String tranNo, Long customerId)
	{
		this.id = id;
		this.tranNo = tranNo;
		this.customerId = customerId;
	}

	/** full constructor */
	public Transfer(Long id, String tranNo, Long customerId, String tranType, String tranStatus, String accOutNo, String accInNo, String currType, String tranLevel, Date tranDate, Long tranAmount, String tranUse, String inBankNo, String outBankNo)
	{
		this.id = id;
		this.tranNo = tranNo;
		this.customerId = customerId;
		this.tranType = tranType;
		this.tranStatus = tranStatus;
		this.accOutNo = accOutNo;
		this.accInNo = accInNo;
		this.currType = currType;
		this.tranLevel = tranLevel;
		this.tranDate = tranDate;
		this.tranAmount = tranAmount;
		this.tranUse = tranUse;
		this.inBankNo = inBankNo;
		this.outBankNo = outBankNo;
	}

	// Property accessors
	@GeneratedValue(strategy = GenerationType.AUTO)
	@GenericGenerator(name = "paymentableGenerator", strategy = "increment")
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

	@Column(name = "tranNo", nullable = false, length = 36)
	public String getTranNo()
	{
		return this.tranNo;
	}

	public void setTranNo(String tranNo)
	{
		this.tranNo = tranNo;
	}

	@Column(name = "customerId", nullable = false, length = 38)
	public Long getCustomerId()
	{
		return this.customerId;
	}

	public void setCustomerId(Long customerId)
	{
		this.customerId = customerId;
	}

	@Column(name = "tranType", length = 1)
	public String getTranType()
	{
		return this.tranType;
	}

	public void setTranType(String tranType)
	{
		this.tranType = tranType;
	}

	@Column(name = "tranStatus", length = 2)
	public String getTranStatus()
	{
		return this.tranStatus;
	}

	public void setTranStatus(String tranStatus)
	{
		this.tranStatus = tranStatus;
	}

	@Column(name = "accOutNo", length = 38)
	public String getAccOutNo()
	{
		return this.accOutNo;
	}

	public void setAccOutNo(String accOutNo)
	{
		this.accOutNo = accOutNo;
	}

	@Column(name = "accInNo", length = 38)
	public String getAccInNo()
	{
		return this.accInNo;
	}

	public void setAccInNo(String accInNo)
	{
		this.accInNo = accInNo;
	}

	@Column(name = "currType", length = 3)
	public String getCurrType()
	{
		return this.currType;
	}

	public void setCurrType(String currType)
	{
		this.currType = currType;
		
	}

	@Column(name = "tranLevel", length = 3)
	public String getTranLevel()
	{
		return this.tranLevel;
	}

	public void setTranLevel(String tranLevel)
	{
		this.tranLevel = tranLevel;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "tranDate", length = 0)
	public Date getTranDate()
	{
		return this.tranDate;
	}

	public void setTranDate(Date tranDate)
	{
		this.tranDate = tranDate;
	}

	@Column(name = "tranAmount", precision = 10, scale = 0)
	public Long getTranAmount()
	{
		return this.tranAmount;
	}

	public void setTranAmount(Long tranAmount)
	{
		this.tranAmount = tranAmount;
	}

	@Column(name = "tranUse", length = 20)
	public String getTranUse()
	{
		return this.tranUse;
	}

	public void setTranUse(String tranUse)
	{
		this.tranUse = tranUse;
	}

	@Column(name = "inBankNo", length = 20)
	public String getInBankNo()
	{
		return this.inBankNo;
	}

	public void setInBankNo(String inBankNo)
	{
		this.inBankNo = inBankNo;
	}

	@Column(name = "outBankNo", length = 20)
	public String getOutBankNo()
	{
		return this.outBankNo;
	}

	public void setOutBankNo(String outBankNo)
	{
		this.outBankNo = outBankNo;
	}

	@Override
	public String toString()
	{
		return "Transfer [id=" + id + ", tranNo=" + tranNo + ", customerId=" + customerId + ", tranType=" + tranType + ", tranStatus=" + tranStatus + ", accOutNo=" + accOutNo + ", accInNo=" + accInNo + ", currType=" + currType + ", tranLevel=" + tranLevel + ", tranDate=" + tranDate + ", tranAmount=" + tranAmount + ", tranUse=" + tranUse + ", inBankNo=" + inBankNo + ", outBankNo=" + outBankNo
				+ "]";
	}

	
	

}