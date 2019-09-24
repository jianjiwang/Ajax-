package com.baizhi.Action;

import com.alibaba.fastjson.JSON;
import com.baizhi.entity.USERS;
import com.baizhi.service.UserService;
import com.baizhi.service.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class UserAction extends ActionSupport {
    //action作用：传参，调用service方法，跳转
    public String selectAll(){
        UserService us=new UserServiceImpl();
        List<USERS> users = us.servletAll();
        //把java中的集合转为json协议串
        String jsonString = JSON.toJSONString(users);
        System.out.println(jsonString);
        //获取流把json串响应给前台
        HttpServletResponse response = ServletActionContext.getResponse();
        //设置响应的编码格式
        response.setCharacterEncoding("UTF-8");
        try {
            PrintWriter out = response.getWriter();
            out.print(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
