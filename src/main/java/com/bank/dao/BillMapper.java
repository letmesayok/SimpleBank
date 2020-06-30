package com.bank.dao;


import com.bank.model.Bill;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BillMapper {
    void save(@Param("bill") Bill bill);

    List<Bill> selectList(@Param("start") int start, @Param("size") int size);

    Integer selectListCount();
}
