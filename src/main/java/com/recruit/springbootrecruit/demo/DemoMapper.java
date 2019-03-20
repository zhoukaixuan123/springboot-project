package com.recruit.springbootrecruit.demo;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/1 22:43
 * @Description:
 */
@Mapper
public interface DemoMapper {

    List<User> getUser(String id);
}
