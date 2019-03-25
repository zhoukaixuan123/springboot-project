package com.recruit.springbootrecruit.projiect.login;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/25 10:33
 * @Description:
 *
 *
 *   session  实体类
 *
 */
public class User {
    private String study_id;
    private String teacher_id;
    private String user_id;
    private String user_name;
    private String user_password;

    public String getStudy_id() {
        return study_id;
    }

    public void setStudy_id(String study_id) {
        this.study_id = study_id;
    }

    public String getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(String teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }
}
