package com.hkbu.dao.impl;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.hkbu.base.BaseDaoImpl;
import com.hkbu.base.BaseQueryModel;
import com.hkbu.dao.BankDao;
import com.hkbu.domain.Bank;

@Repository(value="bankDao")
public class BankDaoImpl extends  BaseDaoImpl<Bank> implements BankDao
{

	
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm)
	{
		// TODO Auto-generated method stub
		
	}

}
