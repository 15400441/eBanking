package com.hkbu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hkbu.dao.AccountDao;
import com.hkbu.domain.Account;
import com.hkbu.service.AccountService;

@Service(value="accountService")
@Transactional
public class AccountServiceImpl implements AccountService
{   
	@Resource(name="accountDao")
	private AccountDao accountDao;

	
	public Account findAccountByCusID(Long cusId)
	{
		
		return accountDao.findAccountByCusID(cusId);
	}

}
