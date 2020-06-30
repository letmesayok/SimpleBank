package com.bank.controller;

import com.bank.model.Account;
import com.bank.model.Bill;
import com.bank.model.Result;
import com.bank.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private BillService service;



    /**
     * 查询操作记录
     */
    @GetMapping("/getAll")
    @ResponseBody
    public Result getAll(int page, int limit) {
        List<Bill> list = service.selectList(page, limit);
        Integer count = service.selectListCount();
        Result result = new Result();
        result.setCode(0);
        result.setData(list);
        result.setCount(count);
        return result;
    }


    @GetMapping("/all")
    public String toBill() {
        return "bill";
    }

    @GetMapping("/in")
    public String in() {
        return "billIn";
    }

    @GetMapping("/out")
    public String out() {
        return "billOut";
    }

    @GetMapping("/transport")
    public String transport() {
        return "billTrans";
    }
}
