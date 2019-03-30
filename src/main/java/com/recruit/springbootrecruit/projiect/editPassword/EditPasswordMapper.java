package com.recruit.springbootrecruit.projiect.editPassword;


import com.recruit.springbootrecruit.projiect.login.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface EditPasswordMapper {

   public void UpdatePassword(Map map);

   void UpdatePhone(Map map);


}
