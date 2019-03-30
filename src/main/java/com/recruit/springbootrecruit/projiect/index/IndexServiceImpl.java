package com.recruit.springbootrecruit.projiect.index;

import com.recruit.springbootrecruit.projiect.login.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 *功能描述
 * @author zhoukx
 * @date 2019/3/30$
 * @description 页面初始化$
 */
@Service
public class IndexServiceImpl implements  IndexService {

    @Autowired
      private  IndexMapper indexMapper;

    @Override
    public User selectUser(String studyid) {
        return indexMapper.selectUser(studyid);
    }
}
