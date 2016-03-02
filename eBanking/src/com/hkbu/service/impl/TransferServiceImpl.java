package com.hkbu.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hkbu.base.BaseDaoImpl;
import com.hkbu.base.BaseQueryModel;
import com.hkbu.base.Page;
import com.hkbu.base.Result;
import com.hkbu.dao.AccountDao;
import com.hkbu.dao.CustomerDao;
import com.hkbu.dao.TransferDao;
import com.hkbu.domain.Account;
import com.hkbu.domain.Customer;
import com.hkbu.domain.Transfer;
import com.hkbu.mapper.TransferMapper;
import com.hkbu.service.AccountService;
import com.hkbu.service.TransferService;
import com.hkbu.util.MailUitls;
import com.hkbu.util.MyUtils;
@Service(value="transferService")
@Transactional
public class TransferServiceImpl extends BaseDaoImpl<Transfer> implements TransferService
{
	@Resource(name="transferDao")
    private TransferDao transferDao; 
	
	@Resource(name="customerDao")
	private CustomerDao customerDao;
	
	@Resource(name="transferMapper")
	private TransferMapper transferMapper;
	
	@Resource(name="accountDao")
	private AccountDao accountDao;
    
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm)
	{
		// TODO Auto-generated method stub
		
	}


	
	public Result<Transfer> transfer(String name, 
			                         Transfer transfer, 
			                         String certifyWay, 
			                         String message, 
			                         String validCode, 
			                         String noticeEmail,
			                         String code)
	{
		
		
		
		Result< Transfer> result=new Result<Transfer>();
		
		//验证验证信息
		
		if(!code.equalsIgnoreCase(validCode))
		{
			result.setStatus(false);
			result.setMsg("验证信息不正确，转账失败");
			return result;
		}		
		
		
		//查询账户余额是否足够
		Account existOutAccount=accountDao.findByAccNo(transfer.getAccOutNo());
		if(existOutAccount==null)
		{
			result.setStatus(false);
			result.setMsg("指定账号不存在，转账失败");
			return result;
		}
		
		if(existOutAccount.getBalance()<transfer.getTranAmount())
		{
			result.setStatus(false);
			result.setMsg("账户余额不足，转账失败");
			return result;
		}
		
		
		//查询接收账号是否存在
		Account existInAccount=accountDao.findByAccNo(transfer.getAccInNo());
		if(existInAccount==null)
		{
			result.setStatus(false);
			result.setMsg("接收账号不存在，转账失败");
			return result;
		}
		
		//验证接收账号是否为正常状态
		if(existInAccount.getAccStatus()!=null && !existInAccount.getAccStatus().equalsIgnoreCase("0"))
		{
			result.setStatus(false);
			result.setMsg("接收账号已被锁定或注销，转账失败");
			return result;
		}
		
		
		
		//查询接收账号所对应顾客名字是否对应
		Customer customer=customerDao.get(existInAccount.getCusId());
		if(name!=null && !name.equalsIgnoreCase(customer.getName()))
		{
			result.setStatus(false);
			result.setMsg("接收账号与接收人不匹配，转账失败");
			return result;
		}
		
					
	
		
		//转账
		
		existOutAccount.setBalance(existOutAccount.getBalance()-transfer.getTranAmount());
		existInAccount.setBalance(existInAccount.getBalance()+transfer.getTranAmount());
		
		//记录转账信息
		transfer.setCurrType(existOutAccount.getCurrType());
		transfer.setCustomerId(customer.getId());
		transfer.setTranDate(new Date());
		transfer.setTranLevel("");
		transfer.setTranNo(MyUtils.getTanNo());
		transfer.setTranType("0");
		transfer.setTranStatus("0");
		transferDao.save(transfer);
		
		result.setStatus(true);
		result.setMsg("转账成功");
		result.setT(transfer);
		result.getMap().put("name", name);
		
		return result;
				
	}



	
	public Result<String> sendValidMsg(String certifyWay, String accOutNo, HttpSession session)
	{
		//判断是否通过邮箱验证
		Result<String> result=new Result<String>();
		
		if(certifyWay == null || certifyWay.trim().equalsIgnoreCase(""))
		{			
			result.setStatus(false);
			result.setMsg("请选择验证方式");
			return result;
		}	
		
		if(!"email".equalsIgnoreCase(certifyWay))
		{			
			result.setStatus(false);
			result.setMsg("系统暂不支持短信验证，请更换验证方式");
			return result;
		}	
		
		
		
		
		//查找转账用户email
		String email=transferMapper.getEmail(accOutNo);
		if(email==null)
		{
			result.setStatus(false);
			result.setMsg("用户邮箱信息未填写，转账失败");
			return result;
		}
		
		
		//发送验证码
		String code=MyUtils.getValidCode();
		session.setAttribute("code", code);
		MailUitls.sendMail(email,accOutNo, code);
		result.setStatus(true);
		result.setMsg("验证信息已发送");
		return result;
			
	}



	
	public int findCount(String accNo, String startDate, String endDate)
	{
		
		int count=transferMapper.getCount(accNo,startDate,endDate);
		return count;
	}



	
	public Page findByPageNum(String accNo, String startDate, String endDate, int pageNum, int totalCount)
	{
		Page page=new Page<List<Map<String, Object>>>(5, pageNum, totalCount);
		List<Map<String, Object>> results=transferMapper.findPageRecords(
				                                                accNo,
				                                                page.getStartIndex(),
				                                                page.getPageSize(),
				                                                startDate,
		
				                                                endDate);
	    page.setRecords(resultsHandle(results, accNo));
		return page;
	}
	
	
	
	public List<Map<String, Object>> resultsHandle(List<Map<String, Object>> list, String accNo)
	{
		for (Map<String, Object> map : list)
		{
		
			map.put("tranOutAmount", "");
			map.put("tranInAmount", "");
			if(accNo.equalsIgnoreCase((String) map.get("accOutNo")))
			{
				map.put("oppoAcc", map.get("accInNo"));
				map.put("tranOutAmount", map.get("tranAmount"));
				
			}
			else 
			{
				map.put("oppoAcc", map.get("accOutNo"));
				map.put("tranInAmount", map.get("tranAmount"));
			}
			
			if("0".equalsIgnoreCase((String) map.get("currType")))
			{
				map.put("currType", "人民币");
			}
			if("1".equalsIgnoreCase((String) map.get("currType")))
			{
				map.put("currType", "港币");
			}
			if("2".equalsIgnoreCase((String) map.get("currType")))
			{
				map.put("currType", "美元");
			}
		}
		return list;
	}



	
	public Map<String, Object> getTransfer(String accNo)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate=sdf.format(new Date());
		String year=currentDate.substring(0,4);
		String month=currentDate.substring(5, 7);
		String startDate=year+"-"+month+"-"+1;
		String endDate=year+"-"+month+"-"+30;
		List<Map<String, Object>> results=transferMapper.getTransfer(accNo,startDate,endDate);
		return (Map<String, Object>) transferResultsHandle(results,accNo);
	}
	
	
	public Map<String, Object> transferResultsHandle(List<Map<String, Object>> list, String accNo)
	{
		int in=0;
		int out=0;
		List inList=new ArrayList();
		List outList=new ArrayList();
		List timesList=new ArrayList();
		for (Map<String, Object> map : list)
		{
		   
			if(accNo.equalsIgnoreCase((String) map.get("accOutNo")))
			{
				out++;
				inList.add(map.get("tranAmount"));
				
			}
			else 
			{
			   in++;
			   outList.add(map.get("tranAmount"));
			}
			
			
		}
		if(in>=out)
		{
			for(int i=1;i<=in;i++)
			{
				String times="第"+i+"次";
				timesList.add(times);
			}
		}
		else {
			for(int i=1;i<=out;i++)
			{
				String times="第"+i+"次";
				timesList.add(times);
			}
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("inList", inList);
		map.put("outList", outList);
		map.put("timesList", timesList);
		
		return map;
	}
}
