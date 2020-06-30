package com.bank.dao;

import com.bank.model.Account;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountMapper {
    Account findByAccountId(@Param("id") String account);

    void update(@Param("account")Account entity);

    Account getAccount(@Param("id") String account);

    List<Account> selectList(@Param("start")int page, @Param("size")int limit);

    Integer selectListCount();
}
