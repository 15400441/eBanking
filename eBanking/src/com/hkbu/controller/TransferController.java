package com.hkbu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hkbu.base.Page;
import com.hkbu.base.Result;
import com.hkbu.domain.Transfer;
import com.hkbu.service.TransferService;

@Controller
@RequestMapping(value="/transfer")
public class TransferController
{
	@Resource(name="transferService")
	private TransferService transferService;
	
	@RequestMapping(value="/transfer")
	@ResponseBody
	public Result<Transfer> transfer(		                           
			                            String name, 
			                            Transfer transfer,
			                            String certifyWay, 
			                            String message,
			                            String validCode,
			                            String noticeEmail,
			                            HttpSession session)
	{
		String code=(String) session.getAttribute("code");
		Result<Transfer> result=transferService.transfer(name, transfer, certifyWay, message, validCode, noticeEmail,code);   	
		return result;
		
	}
	
	@RequestMapping(value="/sendValidMsg")
	@ResponseBody
	public Result<String> sendValidMsg(String certifyWay, String accOutNo, HttpSession session)
	{
		
		return transferService.sendValidMsg(certifyWay, accOutNo, session);
		
	}
	
	@RequestMapping(value="/transferSearch")
	public String transferSearch(String accNo, String startDate, String endDate, int pageNum, Model model )
	{
		//默认显示第一页
		if(pageNum==0)
			pageNum=1;
		
		int totalCount=transferService.findCount(accNo,startDate,endDate);
		Page page=transferService.findByPageNum(accNo,startDate,endDate,pageNum,totalCount);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("page", page);
		return "transferSearch";
	}
	
	
	@RequestMapping(value="/getTransfer")
	@ResponseBody
	public Map<String, Object> getTransfer(String accNo)
	{
		
		return transferService.getTransfer(accNo);
		
	}

}
