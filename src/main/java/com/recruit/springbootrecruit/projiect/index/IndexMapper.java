package com.recruit.springbootrecruit.projiect.index;

import com.recruit.springbootrecruit.projiect.login.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IndexMapper {

    User selectUser(String studyid);
}
