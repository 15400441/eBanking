package com.hkbu.domain;

public class AccountView
{

	private Account account;
	private Long id;
	private String accNo;
	private String currType;
	private String accType;
	private String accAlias;
	private String accStatus;
	private Long balance;
	private Long cusId;
	

	private String accTypeView;
	private String accStatusView;
	private String currTypeView;

	public AccountView(Account account)
	{
		this.id = account.getId();
		this.accNo = account.getAccNo();
		if(account.getCurrType()!=null && account.getCurrType().equalsIgnoreCase("0"))
		{
			this.currType="人民币";
		}
		if(account.getCurrType()!=null && account.getCurrType().equalsIgnoreCase("1"))
		{
			this.currType="港币";
		}
		if(account.getCurrType()!=null && account.getCurrType().equalsIgnoreCase("2"))
		{
			this.currType="美元";
		}
		this.accType = account.getAccType();
		if (account.getAccType() != null && account.getAccType().equalsIgnoreCase("1"))
		{
			this.accTypeView = "活期";
		}
		if (account.getAccType() != null && account.getAccType().equalsIgnoreCase("0"))
		{
			this.accTypeView = "定期";
		}
		this.accAlias = account.getAccAlias();
		this.accStatus = account.getAccStatus();
		if (account.getAccStatus() != null && account.getAccStatus().equalsIgnoreCase("0"))
		{
			this.accStatusView = "正常";
		}
		if (account.getAccStatus() != null && account.getAccStatus().equalsIgnoreCase("1"))
		{
			this.accStatusView = "锁定";
		}
		if (account.getAccStatus() != null && account.getAccStatus().equalsIgnoreCase("2"))
		{
			this.accStatusView = "注销";
		}
		this.balance = account.getBalance();
		this.cusId = account.getCusId();
		

	}

	public Account getAccount()
	{
		return account;
	}

	public void setAccount(Account account)
	{
		this.account = account;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getAccNo()
	{
		return accNo;
	}

	public void setAccNo(String accNo)
	{
		this.accNo = accNo;
	}

	public String getCurrType()
	{
		return currType;
	}

	public void setCurrType(String currType)
	{
		this.currType = currType;
	}

	public String getAccType()
	{
		return accType;
	}

	public void setAccType(String accType)
	{
		this.accType = accType;
	}

	public String getAccAlias()
	{
		return accAlias;
	}

	public void setAccAlias(String accAlias)
	{
		this.accAlias = accAlias;
	}

	public String getAccStatus()
	{
		return accStatus;
	}

	public void setAccStatus(String accStatus)
	{
		this.accStatus = accStatus;
	}


	public Long getBalance()
	{
		return balance;
	}

	public void setBalance(Long balance)
	{
		this.balance = balance;
	}

	public Long getCusId()
	{
		return cusId;
	}

	public void setCusId(Long cusId)
	{
		this.cusId = cusId;
	}

	

	public String getAccTypeView()
	{
		return accTypeView;
	}

	public void setAccTypeView(String accTypeView)
	{
		this.accTypeView = accTypeView;
	}

	public String getAccStatusView()
	{
		return accStatusView;
	}

	public void setAccStatusView(String accStatusView)
	{
		this.accStatusView = accStatusView;
	}

}
