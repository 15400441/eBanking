package com.hkbu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hkbu.domain.Account;
import com.hkbu.domain.AccountView;
import com.hkbu.domain.Card;
import com.hkbu.service.AccountService;
import com.hkbu.service.CardService;

@Controller
@RequestMapping(value="/account")
public class AccountController
{
	@Resource(name="accountService")
	private AccountService accountService;
	
	@Resource(name="cardService")
	private CardService cardService;
	
	@RequestMapping(value="/getAccountInfo")
	public String getAccountInfo(Long cusId, Model model)
	{
		Account account=accountService.findAccountByCusID(cusId);
		if(account!=null)
		{
		    List<Card> cards=cardService.findCardsByAccId(account.getId());
			AccountView a=new AccountView(account);
		    model.addAttribute("a", a);	
		    model.addAttribute("cards", cards);
		   
		}
		return "account";
	}
}
