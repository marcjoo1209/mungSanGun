/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.ProductAmtSearchLogService;
import com.jyj.msg.service.ShopLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@RestController
@RequestMapping(value = "/api/v1/app/")
public class ProductAmtSearchLogController {
  @Autowired
  ProductAmtSearchLogService productAmtSearchLogService;

  @RequestMapping(value = "/getListProductAmtSearchLog", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 로그 조회", notes = "상품 대상 리스트 로그 조회")
  public void getListProductAmtSearchLog() {
    List<ProductAmtSearchLogOutDto> outDto =
        productAmtSearchLogService.getListProductAmtSearchLog();
    System.out.println(outDto);

  }

  @RequestMapping(value = "/createProductAmtSearchLog", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 로그 생성", notes = "상품 대상 리스트 로그 생성")
  public void createProductAmtSearchLog() {
    ProductAmtSearchLogInDto inDto = new ProductAmtSearchLogInDto();
    Integer outDto = productAmtSearchLogService.createProductAmtSearchLog(inDto);
    System.out.println(outDto);

  }

  @RequestMapping(value = "/modifyProductAmtSearchLog", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 로그 수정", notes = "상품 대상 리스트 로그 수정")
  public void modifyProductAmtSearchLog() {
    ProductAmtSearchLogInDto inDto = new ProductAmtSearchLogInDto();
    Integer outDto = productAmtSearchLogService.modifyProductAmtSearchLog(inDto);
    System.out.println(outDto);

  }
}
