package com.recruit.springbootrecruit.projiect.editPassword;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/*
 *功能描述
 * @author zhoukx
 * @date 2019/3/27$
 * @description  修改密码等个人信息
 */
@RestController
@RequestMapping("/update")
public class EditPasswordController {

    @Autowired
    private EditPasswordService editPasswordService;

    /*** 
    * @Description:  修改密码
    * @Param: [request, map] 
    * @return: java.lang.String 
    * @Author: zhoukx
    * @Date: 2019/3/27 
    */ 
    @RequestMapping(value ="/updatePassword",method=RequestMethod.POST )
    public String UpdatePassword(HttpServletRequest request,@RequestParam Map map){
        editPasswordService.UpdatePassword(map);
        return "";
    }
}
