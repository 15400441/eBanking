package com.hkbu.dao.impl;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.hkbu.base.BaseDaoImpl;
import com.hkbu.base.BaseQueryModel;
import com.hkbu.dao.TransferDao;
import com.hkbu.domain.Transfer;

@Repository(value="transferDao")
public class TransferDaoImpl extends BaseDaoImpl<Transfer> implements TransferDao
{

	
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm)
	{
		// TODO Auto-generated method stub
		
	}

	



}
