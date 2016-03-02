package com.hkbu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hkbu.domain.Bank;
import com.hkbu.service.BankService;


@Controller
public class UIController
{
	@Resource(name="bankService")
	private BankService bankService;
	
	
	@RequestMapping("/frame")
	public String frame(String tag)
	{
		if(tag!=null && tag.equals("left"))
		{
			return "/left";
		}
		
	   if (tag!=null && tag.equals("top"))
		{
			return "/top";
		}
		 if (tag!=null && tag.equals("index")) 
		{
			return "/index";
		}
		 if (tag!=null && tag.equals("footer")) 
		{
			return "/footer";
		}
		return null;
	}
	
	@RequestMapping("/transferUI")
	public String transferUI(Model model)
	{
		//加载combox中的银行
		
		List<Bank> list=bankService.findAll();
		
		model.addAttribute("bankList",list);
		return "/transfer";
	}
	
	@RequestMapping("/stockUI")
	public String stockUI()
	{
		return "/stockList";
	}
	
	@RequestMapping("/transferSearchUI")
	public String transferSearchUI()
	{
		return "/transferSearch";
	}
	
	@RequestMapping("/code404")
	public String code404()
	{
		return "/404";
	}
	
	

}
