package com.bank.controller;

import com.bank.model.Account;
import com.bank.model.Bill;
import com.bank.model.Result;
import com.bank.service.AccountService;
import com.bank.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/trans")
    @ResponseBody
    public String trans(String from, String to, BigDecimal money) {
        return service.trans(from, to, money);
    }

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

    @GetMapping("/all")
    public String all(){
        return "account";
    }
}
