package com.hkbu.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.hkbu.base.BaseDaoImpl;
import com.hkbu.base.BaseQueryModel;
import com.hkbu.dao.AccountDao;
import com.hkbu.domain.Account;
import com.hkbu.domain.User;

@Repository(value="accountDao")
public class AccountDaoImpl extends BaseDaoImpl<Account> implements AccountDao 
{

	
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm)
	{
		
		
	}

	
	public Account findByAccNo(String accNo)
	{
		String hql="from Account where accNo=?";
		List<Account> list= getHibernateTemplate().find(hql, accNo);
		return list.size()!=0 ? list.get(0):null;
	}


	
	public Account findAccountByCusID(Long cusId)
	{
		String hql="from Account where cusId=?";
		List<Account> list= getHibernateTemplate().find(hql, cusId);
		return list.size()!=0 ? list.get(0):null;
	}

}
