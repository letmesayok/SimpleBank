package com.bank.service.impl;

import com.bank.dao.BillMapper;
import com.bank.model.Bill;
import com.bank.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class BillServiceImpl implements BillService {
    @Autowired
    private BillMapper billMapper;


    @Override
    public void addBill(String type, String from, String to, BigDecimal money) {
        Bill bill = new Bill();
        bill.setTime(new Date());
        bill.setAccount(from);
        bill.setToAccount(to);
        bill.setMoney(money);
        bill.setType(type);
        billMapper.save(bill);
    }

    @Override
    public List<Bill> selectList(int page, int size) {
        int start = (page - 1) * size;
        return billMapper.selectList(start, size);
    }

    @Override
    public Integer selectListCount() {
        return billMapper.selectListCount();
    }
}
