package com.recruit.springbootrecruit.projiect.login;

import com.recruit.springbootrecruit.projiect.util.SessionUtil;
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
        User user = loginMapper.verificationLogin(map);
        if(map.get("studyid").equals(user.getStudy_id())){
            if(map.get("password").equals(user.getUser_password())){
                String yzm =(String) SessionUtil.getSession().getAttribute("yzm");
                if(map.get("yzm").equals(yzm)){
                    SessionUtil.getSession().setAttribute(user.getStudy_id(),user);
                    return "Y";
                }else{
                    return "YZM";
                }
            }else {
                return  "PASSWORD";
            }
        }else{
            return   "USERNAME";
        }

    }
}
