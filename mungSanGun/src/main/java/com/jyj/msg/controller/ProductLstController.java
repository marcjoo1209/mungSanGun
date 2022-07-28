/**
 * @file ProductLstController.java
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
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;
import com.jyj.msg.service.ProductLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
//@Slf4j
@RestController
//@RequestMapping(value = "/api/v1/app/")
public class ProductLstController {
  @Autowired
  ProductLstService productLstService;

  @RequestMapping(value="/getlist-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 조회 로컬 호출", notes="상품 대상 리스트 조회 로컬 호출")
  public List<ProductLstOutDto> getListProductLst() throws IOException {
    //log.debug("/getlist-product-lst 호출 시작");
    List<ProductLstOutDto> outDto = productLstService.getListProductLst();

    return outDto;
  }
  
  @RequestMapping(value="/get-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 조회 호출", notes="상품 대상 리스트 조회 호출")
  public ProductLstOutDto getProductLst(@RequestBody ProductLstInDto inDto) throws IOException {
   // log.debug("/get-product-lst 호출 시작");
    ProductLstOutDto outDto = productLstService.getProductLst(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/create-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public Integer createProductLst(@RequestBody ProductLstInDto inDto) throws IOException {
   // log.debug("/create-product-lst 호출 시작");
    Integer outDto = productLstService.createProductLst(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/modify-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 수정 호출", notes="상품 대상 리스트 수정 호출")
  public Integer modifyProductLst(@RequestBody ProductLstInDto inDto) throws IOException {
   // log.debug("/modify-product-lst 호출 시작");
    Integer outDto = productLstService.modifyProductLst(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/remove-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 수정 호출", notes="상품 대상 리스트 수정 호출")
  public Integer removeProductLst(@RequestBody ProductLstInDto inDto) throws IOException {
   // log.debug("/remove-product-lst 호출 시작");
    Integer outDto = productLstService.removeProductLst(inDto);
    
    return outDto;
  }
}
