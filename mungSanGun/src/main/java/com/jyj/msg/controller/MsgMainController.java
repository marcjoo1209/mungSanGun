/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Controller("MsgMainController")
public class MsgMainController {
  @RequestMapping(value = "/")
  public String mainView() throws Exception {
    System.out.println("Test Page");
    
    return "index";
  }

}
