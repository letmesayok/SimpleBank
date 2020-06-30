package com.bank.dao;

import com.bank.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    List<User> all();

    User selectByName(@Param("name") String username);
}
