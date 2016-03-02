package com.hkbu.dao;

import com.hkbu.base.BaseDao;
import com.hkbu.domain.Account;

public interface AccountDao extends BaseDao<Account>
{

	Account findByAccNo(String accOutNo);

	Account findAccountByCusID(Long cusId);
	

}
