package com.recruit.springbootrecruit.projiect.login;

import java.util.Map;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/17 12:21
 * @Description:
 */
public interface LoginService {

    /**
     * 功能描述:
     *               验证用户等录
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/17 12:23
     */
    public String verificationLogin(Map<String, String> map);
}
