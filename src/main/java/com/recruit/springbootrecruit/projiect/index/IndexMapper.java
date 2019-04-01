package com.recruit.springbootrecruit.projiect.index;

import com.recruit.springbootrecruit.projiect.login.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface IndexMapper {

    User selectUser(String studyid);
}
