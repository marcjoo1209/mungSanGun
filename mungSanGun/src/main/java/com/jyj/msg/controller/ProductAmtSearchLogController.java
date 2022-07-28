/**
 * @file ProductAmtSearchLogController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
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
//@Slf4j
@RestController
//@RequestMapping(value = "/api/v1/app/")
public class ProductAmtSearchLogController {
  @Autowired
  ProductAmtSearchLogService productAmtSearchLogService;

  @RequestMapping(value = "/getlist-product-amt-search-log", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 로그 조회", notes = "상품 대상 리스트 로그 조회")
  public List<ProductAmtSearchLogOutDto> getListProductAmtSearchLog() throws IOException {
   // log.debug("/getlist-product-amt-search-log 호출 시작");
    List<ProductAmtSearchLogOutDto> outDto = productAmtSearchLogService.getListProductAmtSearchLog();

    return outDto;
  }
  
  @RequestMapping(value = "/get-product-amt-search-log", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 로그 조회", notes = "상품 대상 리스트 로그 조회")
  public ProductAmtSearchLogOutDto getProductAmtSearchLog(@RequestBody ProductAmtSearchLogInDto inDto) {
   // log.debug("/get-product-amt-search-log 호출 시작");
    ProductAmtSearchLogOutDto outDto = productAmtSearchLogService.getProductAmtSearchLog(inDto);
    System.out.println(outDto);
    return outDto;
  }

  @RequestMapping(value = "/create-product-amt-search-log", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 로그 생성", notes = "상품 대상 리스트 로그 생성")
  public Integer createProductAmtSearchLog(@RequestBody ProductAmtSearchLogInDto inDto) {
   // log.debug("/create-product-amt-search-log 호출 시작");
    Integer outDto = productAmtSearchLogService.createProductAmtSearchLog(inDto);
    return outDto;

  }

  @RequestMapping(value = "/modify-product-amt-search-log", method = RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 로그 수정", notes = "상품 대상 리스트 로그 수정")
  public Integer modifyProductAmtSearchLog(@RequestBody ProductAmtSearchLogInDto inDto) {
   // log.debug("/modify-product-amt-search-log 호출 시작");
    Integer outDto = productAmtSearchLogService.modifyProductAmtSearchLog(inDto);
    return outDto;

  }
}
