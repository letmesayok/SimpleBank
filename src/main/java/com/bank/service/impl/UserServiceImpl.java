package com.bank.service.impl;

import com.bank.dao.UserMapper;
import com.bank.model.User;
import com.bank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> all() {
        return userMapper.all();
    }

    @Override
    public User selectByName(String username) {
        return userMapper.selectByName(username);
    }
}
