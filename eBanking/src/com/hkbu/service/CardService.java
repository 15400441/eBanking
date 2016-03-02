package com.hkbu.service;

import java.util.List;

import com.hkbu.domain.Card;

public interface CardService
{

	List<Card> findCardsByAccId(Long accId);

}
