package com.recruit.springbootrecruit.projiect.login;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/17 12:22
 * @Description:
 */
@Mapper
public interface LoginMapper {


    /**
     * 功能描述:
     *               验证用户等录
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/17 12:23
     */
     Map<String, String>  verificationLogin(Map<String, String> map);



}
