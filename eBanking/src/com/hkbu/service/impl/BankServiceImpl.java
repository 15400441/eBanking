package com.hkbu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hkbu.dao.BankDao;
import com.hkbu.domain.Bank;
import com.hkbu.service.BankService;

@Service(value="bankService")
@Transactional
public class BankServiceImpl implements BankService
{
	@Resource(name="bankDao")
	private BankDao bankDao;

	
	public List<Bank> findAll()
	{
		
		return bankDao.getAll();
	}

}
