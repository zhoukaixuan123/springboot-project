package com.recruit.springbootrecruit.projiect.util;

import java.util.UUID;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/26 16:49
 * @Description:
 *
 *     生成32位id
 */
public class UUIdUtil {


    /**
     *
     * 功能描述:   生成32uuid
     *
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/26 16:52
     */
    public static  String  getUUidString(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
