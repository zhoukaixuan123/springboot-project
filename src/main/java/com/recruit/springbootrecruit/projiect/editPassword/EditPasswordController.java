package com.recruit.springbootrecruit.projiect.editPassword;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/*
 *功能描述
 * @author zhoukx
 * @date 2019/3/27$
 * @description  修改密码等个人信息
 */
@Controller
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
    @ResponseBody
    public String UpdatePassword(HttpServletRequest request,@RequestParam Map map){
        editPasswordService.UpdatePassword(map);
        return "";
    }

    @RequestMapping(value ="updatePhone" )
    @ResponseBody
    public String UpdatePhone(@RequestParam Map map){
        editPasswordService.UpdatePhone(map);
        return  "Y";
    }
}
