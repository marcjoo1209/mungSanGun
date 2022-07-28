/**
 * @file MsgApplication.java
 * @author 주영주
 * @description
**/
package com.jyj.msg;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @create 2022. 7. 26.
 * @author 주영주
**/
@SpringBootApplication
public class MsgApplication extends SpringBootServletInitializer {
  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
      return application.sources(MsgApplication.class);
  }

  public static void main(String[] args) {
      SpringApplication.run(MsgApplication.class, args);
  }
}
