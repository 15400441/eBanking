package com.hkbu.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.hkbu.base.BaseDaoImpl;
import com.hkbu.base.BaseQueryModel;
import com.hkbu.dao.CardDao;
import com.hkbu.domain.Card;

@Repository(value="cardDao")
public class CardDaoImpl extends BaseDaoImpl<Card> implements CardDao
{

	
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm)
	{
		
		
	}

	
	public List<Card> findCardsByAccId(Long accId)
	{
		String hql="from Card where accId=?";
		
		return getHibernateTemplate().find(hql, accId);
	}

}
