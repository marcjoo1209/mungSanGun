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
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.ProductSearchLstService;
import com.jyj.msg.service.ShopLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@RestController
@RequestMapping(value = "/api/v1/app/")
public class ProductSearchLstController {
  @Autowired
  ProductSearchLstService productSearchLstService;

  @RequestMapping(value="/getListProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 조회", notes="상품 대상 리스트 조회")
  public void getListProductSearchLst() {
    List<ProductSearchLstOutDto> outDto = productSearchLstService.getListProductSearchLst();
    System.out.println(outDto);
    
  }
  
  @RequestMapping(value="/createProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 생성", notes="상품 대상 리스트 생성")
  public void createProductSearchLst(ProductSearchLstInDto inDto) {
    Integer outDto = productSearchLstService.createProductSearchLst(inDto);
    System.out.println(outDto);
    
  }
  
  @RequestMapping(value="/modifyProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 수정", notes="상품 대상 리스트 수정")
  public void modifyProductSearchLst(ProductSearchLstInDto inDto) {
    Integer outDto = productSearchLstService.modifyProductSearchLst(inDto);
    System.out.println(outDto);
    
  }
}
