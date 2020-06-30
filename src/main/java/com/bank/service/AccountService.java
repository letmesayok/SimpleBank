package com.bank.service;

import com.bank.model.Account;

import java.math.BigDecimal;
import java.util.List;

public interface AccountService {
    String accountIn(String account, BigDecimal money);

    String accountOut(String account, BigDecimal money);

    Account getAccount(String account);

    String trans(String from, String to, BigDecimal money);

    List<Account> selectList(int page, int limit);

    Integer selectListCount();
}
