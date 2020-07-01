package com.bank.controller;

import com.bank.model.Account;
import com.bank.model.Bill;
import com.bank.model.Result;
import com.bank.service.AccountService;
import com.bank.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService service;

    /**
     * 存款
     */
    @PostMapping("/in")
    @ResponseBody
    public String accountIn(String account, BigDecimal money) {
        return service.accountIn(account, money);
    }

    /**
     * 取款
     */
    @PostMapping("/out")
    @ResponseBody
    public String accountOut(String account, BigDecimal money) {
        return service.accountOut(account, money);
    }

    /**
     * 转账
     */
    @PostMapping("/trans")
    @ResponseBody
    public String trans(String from, String to, BigDecimal money) {
        return service.trans(from, to, money);
    }

    /**
     * 获取某个账户信息
     */
    @GetMapping("/get")
    @ResponseBody
    public Result get(String account) {
        Account entity = service.getAccount(account);
        if(entity == null) {
            return new Result("fail", null);
        }
        return new Result("success", entity);
    }

    /**
     * 获取所有账户
     */
    @GetMapping("/getAll")
    @ResponseBody
    public Result getAll(int page, int limit){
        List<Account> list = service.selectList(page, limit);
        Integer count = service.selectListCount();
        Result result = new Result();
        result.setCode(0);
        result.setData(list);
        result.setCount(count);
        return result;
    }

    @PostMapping("/add")
    @ResponseBody
    public String add(Account account) {
        return service.add(account);
    }

    @PostMapping("/edit")
    @ResponseBody
    public String edit(Account account) {
        return service.edit(account);
    }

    @GetMapping("/all")
    public String all(){
        return "account";
    }

    @GetMapping("/addPage")
    public String addPage(ModelAndView model){
        model.addObject("flag", 0);
        return "accountAdd";
    }

    @GetMapping("/editPage")
    public String editPage(String accountId, ModelAndView model){
        Account account = service.getAccount(accountId);
        model.addObject("flag", 1);
        model.addObject("account", account);
        return "accountAdd";
    }
}
