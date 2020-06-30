package com.bank.service;

import com.bank.model.User;

import java.util.List;

public interface UserService {
    public List<User> all();

    User selectByName(String username);
}
