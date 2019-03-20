package com.recruit.springbootrecruit.projiect.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/17 12:21
 * @Description:
 */
@Service
public class LoginServiceImpl  implements LoginService {

    @Autowired
    private LoginMapper   loginMapper;

    @Override
    public String verificationLogin(Map<String, String> map) {
        Map<String, String> resultMap = loginMapper.verificationLogin(map);
        if(map.get("USERNAME").equals(resultMap.get("USER_NAME"))){
            if(map.get("PASSWORD").equals(resultMap.get("USER_PASSWORD"))){
                return "Y";
            }else {
                return  "PASSWORD";
            }

        }else{
            return  "USERNAME";
        }

    }
}
