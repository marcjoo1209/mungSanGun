/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.ShopLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Controller
@SessionAttributes("aptinfo")
public class ShopListController {
  @Autowired
  ShopLstService shopLstService;

  @RequestMapping(value="/getListShopLst", method=RequestMethod.POST)
  @ApiOperation(value = "이커머스 리스트 조회", notes="상품 대상 리스트 조회")
  public void getListShopLst() {
    List<ShopLstOutDto> outDto = shopLstService.getListShopLst();
    System.out.println(outDto);
    
  }
  
  @RequestMapping(value="/createShopLst", method=RequestMethod.POST)
  @ApiOperation(value = "이커머스 리스트 생성", notes="상품 대상 리스트 생성")
  public void createShopLst() {
    ShopLstInDto inDto = new ShopLstInDto();
    Integer outDto = shopLstService.createShopLst(inDto);
    System.out.println(outDto);
    
  }
  
  @RequestMapping(value="/modifyShopLst", method=RequestMethod.POST)
  @ApiOperation(value = "이커머스 리스트 수정", notes="상품 대상 리스트 수정")
  public void modifyShopLst() {
    ShopLstInDto inDto = new ShopLstInDto();
    Integer outDto = shopLstService.modifyShopLst(inDto);
    System.out.println(outDto);
    
  }
  
}
