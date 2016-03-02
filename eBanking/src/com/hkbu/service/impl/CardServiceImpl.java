package com.hkbu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hkbu.dao.CardDao;
import com.hkbu.domain.Card;
import com.hkbu.service.CardService;

@Service(value="cardService")
public class CardServiceImpl implements CardService
{
	@Resource(name="cardDao")
	private CardDao cardDao;

	@Override
	public List<Card> findCardsByAccId(Long accId)
	{
		
		return cardDao.findCardsByAccId(accId);
	}

}
