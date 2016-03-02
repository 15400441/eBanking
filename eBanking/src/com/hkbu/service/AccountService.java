package com.hkbu.service;

import com.hkbu.base.BaseDao;
import com.hkbu.domain.Account;

public interface AccountService
{

	Account findAccountByCusID(Long cusId);

}
