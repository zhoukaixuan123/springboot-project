package com.recruit.springbootrecruit.projiect.editPassword;


import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface EditPasswordMapper {

   public void UpdatePassword(Map map);
}
