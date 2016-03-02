package com.hkbu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hkbu.domain.Customer;
import com.hkbu.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController
{
  @Resource(name="customerService")
  private CustomerService customerService;
  
  @RequestMapping("/findCustomerById")
  public Customer findCustomerById(Long id)
  {
	  System.out.println("success");
	  System.out.println(customerService.getCustomerById(1L));
	  return null;
  }
  
  

}
