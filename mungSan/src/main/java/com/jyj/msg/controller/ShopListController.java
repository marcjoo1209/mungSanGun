/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.common.CommonUtil;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.ShopLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@RestController
@SessionAttributes("shoplist")
public class ShopListController {
  @Autowired
  ShopLstService shopLstService;

  @RequestMapping(value="/create-shop-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public int createProductLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/get-list-product-dtl-lst 호출 시작");
    ShopLstInDto inDto = new ShopLstInDto();

    inDto.setIDX(CommonUtil.checkDataIsNull(data.get("IDX")));
    inDto.setSHOPNM(CommonUtil.checkDataIsNull(data.get("SHOPNM")));
    inDto.setID(CommonUtil.checkDataIsNull(data.get("ID")));
    inDto.setPWD(CommonUtil.checkDataIsNull(data.get("PWD")));
    inDto.setTOKENID(CommonUtil.checkDataIsNull(data.get("TOKENID")));
    inDto.setURL(CommonUtil.checkDataIsNull(data.get("URL")));
    
    System.out.println(inDto.getSHOPNM());
    
    int outDto = shopLstService.createShopLst(inDto);

    return outDto;
  }
  
  @RequestMapping(value="/modify-shop-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public int modifyProductLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/get-list-product-dtl-lst 호출 시작");
    ShopLstInDto inDto = new ShopLstInDto();
    
    inDto.setIDX(CommonUtil.checkDataIsNull(data.get("IDX")));
    inDto.setSHOPNM(CommonUtil.checkDataIsNull(data.get("SHOPNM")));
    inDto.setID(CommonUtil.checkDataIsNull(data.get("ID")));
    inDto.setPWD(CommonUtil.checkDataIsNull(data.get("PWD")));
    inDto.setTOKENID(CommonUtil.checkDataIsNull(data.get("TOKENID")));
    inDto.setURL(CommonUtil.checkDataIsNull(data.get("URL")));
    
    System.out.println(inDto.getSHOPNM());
    
    int outDto = shopLstService.modifyShopLst(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/remove-shop-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public int removeProductLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/get-list-product-dtl-lst 호출 시작");
    ShopLstInDto inDto = new ShopLstInDto();
    
    inDto.setIDX(CommonUtil.checkDataIsNull(data.get("IDX")));
    inDto.setSHOPNM(CommonUtil.checkDataIsNull(data.get("SHOPNM")));
    inDto.setID(CommonUtil.checkDataIsNull(data.get("ID")));
    inDto.setPWD(CommonUtil.checkDataIsNull(data.get("PWD")));
    inDto.setTOKENID(CommonUtil.checkDataIsNull(data.get("TOKENID")));
    inDto.setURL(CommonUtil.checkDataIsNull(data.get("URL")));
    
    System.out.println(inDto.getSHOPNM());
    
    int outDto = shopLstService.removeShopLst(inDto);
    
    return outDto;
  }
/*
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
  */
}
