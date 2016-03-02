package com.hkbu.dao;

import java.util.List;

import com.hkbu.base.BaseDao;
import com.hkbu.domain.Card;

public interface CardDao extends BaseDao<Card>
{

	List<Card> findCardsByAccId(Long accId);

}
