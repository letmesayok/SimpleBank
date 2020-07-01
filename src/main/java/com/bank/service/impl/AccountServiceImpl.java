package com.bank.service.impl;

import com.bank.dao.AccountMapper;
import com.bank.model.Account;
import com.bank.service.AccountService;
import com.bank.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private BillService billService;

    @Override
    public String accountIn(String account, BigDecimal money) {
        Account entity = accountMapper.findByAccountId(account);
        if(entity == null) {
            return "账户不存在";
        }
        entity.setMoney(entity.getMoney().add(money));
        accountMapper.update(entity);
        billService.addBill("1", account, null, money);
        return "success";
    }

    @Override
    public String accountOut(String account, BigDecimal money) {
        Account entity = accountMapper.findByAccountId(account);
        if(entity == null) {
            return "账户不存在";
        }
        if(money.compareTo(entity.getMoney()) > 0){
            return "余额不足";
        }
        entity.setMoney(entity.getMoney().subtract(money));
        accountMapper.update(entity);
        billService.addBill("2", account, null, money);
        return "success";
    }

    @Override
    public Account getAccount(String account) {
        return accountMapper.getAccount(account);
    }

    @Override
    public String trans(String from, String to, BigDecimal money) {
        Account accountFrom = accountMapper.findByAccountId(from);
        if(accountFrom == null) {
            return "转出账户不存在";
        }
        Account accountTo = accountMapper.findByAccountId(to);
        if(accountTo == null) {
            return "转入账户不存在";
        }
        if(money.compareTo(accountFrom.getMoney()) > 0){
            return "转出余额不足";
        }
        accountTo.setMoney(accountTo.getMoney().add(money));
        accountFrom.setMoney(accountFrom.getMoney().subtract(money));
        accountMapper.update(accountTo);
        accountMapper.update(accountFrom);
        billService.addBill("3", from, to, money);
        return "success";
    }

    @Override
    public List<Account> selectList(int page, int limit) {
        int start = (page-1)*limit;
        return accountMapper.selectList(start, limit);
    }

    @Override
    public Integer selectListCount() {
        return accountMapper.selectListCount();
    }

    @Override
    public String add(Account account) {
        Account entity = accountMapper.getAccount(account.getAccount());
        if(entity != null) {
            return "账户已存在，添加失败";
        }
        accountMapper.insert(account);
        return "success";
    }

    @Override
    public String edit(Account account) {
        Account entity = accountMapper.getAccount(account.getAccount());
        if(entity == null) {
            return "账户不存在，修改失败";
        }
        accountMapper.update(account);
        return "success";
    }
}
