package com.hkbu.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.hkbu.base.BaseDao;
import com.hkbu.base.Page;
import com.hkbu.base.Result;
import com.hkbu.domain.Transfer;

public interface TransferService extends BaseDao<Transfer>
{

	Result<Transfer> transfer(String name, 
			                      Transfer transfer, 
			                      String certifyWay, 
			                      String message, 
			                      String validCode, 
			                      String noticeEmail,
			                      String code);

	Result<String> sendValidMsg(String certifyWay, String accOutNo, HttpSession session);

	int findCount(String accNo, String startDate, String endDate);

	Page findByPageNum(String accNo, String startDate, String endDate, int pageNum, int totalCount);

	Map<String, Object> getTransfer(String accNo);

}
