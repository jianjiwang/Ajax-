package com.baizhi.service;

import com.baizhi.DAO.UserDAO;
import com.baizhi.entity.USERS;
import com.baizhi.util.MybatisUtil;

import java.util.List;

public class UserServiceImpl implements UserService {

    @Override
    public List<USERS> servletAll() {
        UserDAO userdao = MybatisUtil.openSession().getMapper(UserDAO.class);
        List<USERS> list = userdao.servletAll();
        MybatisUtil.close();
        return list;
    }
}
