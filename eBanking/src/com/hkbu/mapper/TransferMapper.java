package com.hkbu.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hkbu.domain.Transfer;

@Repository(value="transferMapper")
public interface TransferMapper
{
    String getEmail(String accNo);

	int getCount(String accNo, String startDate, String endDate);

	List<Map<String, Object>> findPageRecords(String accNo, int startIndex, int pageSize, String startDate, String endDate);

	List<Map<String, Object>> getTransfer(String accNo, String startDate, String endDate);
}
