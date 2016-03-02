package com.hkbu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/stock")
public class StockController
{
   
    
    @RequestMapping(value="/getStockDeatil")
	public String getStockDeatil(String stockCode,
			                     Model model)
	{
    	//查看日K线图：
    	//http://image.sinajs.cn/newchart/daily/n/sh
    	String dayKLine="http://image.sinajs.cn/newchart/daily/n/sh"+stockCode+".gif";
    	
    	//分时线的查询：
    	//http://image.sinajs.cn/newchart/min/n/sh
    	String hourLine="http://image.sinajs.cn/newchart/min/n/sh"+stockCode+".gif";
    	
    	//周K线查询：
    	//http://image.sinajs.cn/newchart/weekly/n/sh
    	String weekKLine="http://image.sinajs.cn/newchart/weekly/n/sh"+stockCode+".gif";
    	
    	//月K线查询：
    	//http://image.sinajs.cn/newchart/monthly/n/sh
    	String monthKLine="http://image.sinajs.cn/newchart/monthly/n/sh"+stockCode+".gif";
    	
    	model.addAttribute("dayKLine",dayKLine);
    	model.addAttribute("hourLine",hourLine);
    	model.addAttribute("weekKLine",weekKLine);
    	model.addAttribute("monthKLine",monthKLine);
    	return "stockDetail";
	}
}
