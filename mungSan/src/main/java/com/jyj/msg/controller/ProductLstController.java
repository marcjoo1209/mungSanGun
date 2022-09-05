/**
 * @file ProductLstController.java
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
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductDtlLstOutDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchDto;
import com.jyj.msg.service.ProductDtlLstService;
import com.jyj.msg.service.ProductLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
//@Slf4j
@RestController
@SessionAttributes("product")
//@RequestMapping(value = "/api/v1/app/")
public class ProductLstController {
  @Autowired
  ProductLstService productLstService;
  @Autowired
  ProductDtlLstService productDtlLstService;

  @RequestMapping(value="/create-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public int createProductLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/get-list-product-dtl-lst 호출 시작");
    ProductLstInDto inDto = new ProductLstInDto();
    
    inDto.setIMGURL(checkDataIsNull(data.get("IMGURL")));
    inDto.setPRODUCTNM(checkDataIsNull(data.get("PRODUCTNM")));
    inDto.setSHIPAMT(checkDataIsNull(data.get("SHIPAMT")));
    inDto.setNOMALAMT(checkDataIsNull(data.get("NOMALAMT")));
    inDto.setCOMMITIONAMT(checkDataIsNull(data.get("COMMITIONAMT")));
    inDto.setCALCAMT(checkDataIsNull(data.get("CALCAMT")));
    inDto.setPAYAMT(checkDataIsNull(data.get("PAYAMT")));
    inDto.setINCOMEAMT(checkDataIsNull(data.get("INCOMEAMT")));
    inDto.setLOWAMT(checkDataIsNull(data.get("LOWAMT")));
    inDto.setPRODUCTLINK(checkDataIsNull(data.get("PRODUCTLINK")));
    inDto.setLEADAMT(checkDataIsNull(data.get("LEADAMT")));
    inDto.setMEMO(checkDataIsNull(data.get("MEMO")));
    inDto.setIDX(checkDataIsNull(data.get("IDX")));
    
    System.out.println(inDto.getSHIPAMT());
    
    int outDto = productLstService.createProductLst(inDto);

    ProductDtlLstInDto inDtlDto = new ProductDtlLstInDto();
      for(int i = 1; i<=12; i++) {
        inDtlDto = new ProductDtlLstInDto();
        inDtlDto.setPRODUCTIDX(checkDataIsNull(data.get("IDX")));
        inDtlDto.setSHOPIDX(String.valueOf(i));
        
        productDtlLstService.createProductDtlLst(inDtlDto);
      }
      

    return outDto;
  }

  @RequestMapping(value="/remove-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public int removeProductLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/get-list-product-dtl-lst 호출 시작");
    ProductLstInDto inDto = new ProductLstInDto();
    
    inDto.setIMGURL(checkDataIsNull(data.get("IMGURL")));
    inDto.setPRODUCTNM(checkDataIsNull(data.get("PRODUCTNM")));
    inDto.setSHIPAMT(checkDataIsNull(data.get("SHIPAMT")));
    inDto.setNOMALAMT(checkDataIsNull(data.get("NOMALAMT")));
    inDto.setCOMMITIONAMT(checkDataIsNull(data.get("COMMITIONAMT")));
    inDto.setCALCAMT(checkDataIsNull(data.get("CALCAMT")));
    inDto.setPAYAMT(checkDataIsNull(data.get("PAYAMT")));
    inDto.setINCOMEAMT(checkDataIsNull(data.get("INCOMEAMT")));
    inDto.setLOWAMT(checkDataIsNull(data.get("LOWAMT")));
    inDto.setPRODUCTLINK(checkDataIsNull(data.get("PRODUCTLINK")));
    inDto.setLEADAMT(checkDataIsNull(data.get("LEADAMT")));
    inDto.setMEMO(checkDataIsNull(data.get("MEMO")));
    inDto.setIDX(checkDataIsNull(data.get("IDX")));
    
    System.out.println(inDto.getSHIPAMT());
    Integer outDto = productLstService.removeProductLst(inDto);
    
    ProductDtlLstInDto inDtlDto = new ProductDtlLstInDto();
    inDtlDto.setPRODUCTIDX(checkDataIsNull(data.get("IDX")));
    Integer outDto2 = productDtlLstService.removeProductDtlLst(inDtlDto);
    
    return outDto;
  }
  
  private String checkDataIsNull(Object ob) {
    String returnVal = "";
    if(ob == null) {
      returnVal = "";
      
    } else {
      returnVal = ob.toString();
    }
    return returnVal;
  }

  @RequestMapping(value="/modify-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 수정 호출", notes="상품 대상 리스트 수정 호출")
  public int modifyProductLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/get-list-product-dtl-lst 호출 시작");
    ProductLstInDto inDto = new ProductLstInDto();
    
    inDto.setIMGURL(checkDataIsNull(data.get("IMGURL")));
    inDto.setPRODUCTNM(checkDataIsNull(data.get("PRODUCTNM")));
    inDto.setSHIPAMT(checkDataIsNull(data.get("SHIPAMT")));
    inDto.setNOMALAMT(checkDataIsNull(data.get("NOMALAMT")));
    inDto.setCOMMITIONAMT(checkDataIsNull(data.get("COMMITIONAMT")));
    inDto.setCALCAMT(checkDataIsNull(data.get("CALCAMT")));
    inDto.setPAYAMT(checkDataIsNull(data.get("PAYAMT")));
    inDto.setINCOMEAMT(checkDataIsNull(data.get("INCOMEAMT")));
    inDto.setLOWAMT(checkDataIsNull(data.get("LOWAMT")));
    inDto.setPRODUCTLINK(checkDataIsNull(data.get("PRODUCTLINK")));
    inDto.setLEADAMT(checkDataIsNull(data.get("LEADAMT")));
    inDto.setMEMO(checkDataIsNull(data.get("MEMO")));
    inDto.setIDX(checkDataIsNull(data.get("IDX")));
    
    System.out.println(inDto.getSHIPAMT());
    Integer outDto = productLstService.modifyProductLst(inDto);
    
    return outDto;
  }
  
/*
  @RequestMapping(value="/getlist-product-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 조회 로컬 호출", notes="상품 대상 리스트 조회 로컬 호출")
  public List<ProductLstOutDto> getListProductLst(@RequestBody ProductLstInDto inDto) throws IOException {
    //log.debug("/getlist-product-lst 호출 시작");
    List<ProductLstOutDto> outDto = productLstService.getListProductLst(inDto);

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
  
  */
}
