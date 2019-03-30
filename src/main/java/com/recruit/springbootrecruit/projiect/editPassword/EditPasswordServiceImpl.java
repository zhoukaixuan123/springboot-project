package com.recruit.springbootrecruit.projiect.editPassword;

import com.recruit.springbootrecruit.projiect.login.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

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
    
    
    /*** 
    * @Description:  修改联系方式
    * @Param: [map] 
    * @return: java.lang.String 
    * @Author: zhoukx
    * @Date: 2019/3/29 
    */
    @Transactional
    public Map<String,String>  UpdatePhone(Map map){
        //修改手机号
        editPasswordMapper.UpdatePhone(map);
        //返回一个Map 实体  修改以后的

        return null;
    }



}
