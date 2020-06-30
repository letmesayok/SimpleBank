package com.bank.service;

import com.bank.model.Bill;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

public interface BillService{
    void addBill(String type, String from, String to, BigDecimal money);

    List<Bill> selectList(int page, int size);

    Integer selectListCount();
}
