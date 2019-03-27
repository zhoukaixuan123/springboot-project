package com.recruit.springbootrecruit.projiect.editPassword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/*
 *功能描述
 * @author zhoukx
 * @date 2019/3/27$
 * @description 修改个人信息$
 */
@Service
public class EditPasswordServiceImpl  implements EditPasswordService{

    @Autowired
    private EditPasswordMapper editPasswordMapper;
    
    /*** 
    * @Description: 修改密码
    * @Param: [map] 
    * @return: void 
    * @Author: zhoukx
    * @Date: 2019/3/27 
    */ 
    public void UpdatePassword(Map map){
        editPasswordMapper.UpdatePassword(map);
    }
}
