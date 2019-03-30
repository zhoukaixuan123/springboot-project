package com.recruit.springbootrecruit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class SpringbootRecruitApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootRecruitApplication.class, args);
    }

}
