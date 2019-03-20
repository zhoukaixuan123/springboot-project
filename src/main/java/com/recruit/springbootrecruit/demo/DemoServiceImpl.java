package com.recruit.springbootrecruit.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/1 22:43
 * @Description:
 */
@Service
public class DemoServiceImpl implements DemoService {
    @Autowired
    private  DemoMapper demoMapper;
    @Override
    public List<User> getUser() {

        return  demoMapper.getUser("1");

    }
}
