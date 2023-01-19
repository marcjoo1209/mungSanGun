/**
 * @file ProductLstController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.ProductDtlLstService;
import com.jyj.msg.service.ProductLstService;
import com.jyj.msg.service.ShopLstService;

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
  @Autowired
  ShopLstService shopLstService;

  private static final Logger LOGGER = LoggerFactory.getLogger(ExcelController.class);
	
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
    String maxNum = productLstService.getMaxNum();
    
    ProductDtlLstInDto inDtlDto = new ProductDtlLstInDto();
      for(int i = 1; i<=12; i++) {
        inDtlDto = new ProductDtlLstInDto();
        inDtlDto.setPRODUCTIDX(maxNum);
        inDtlDto.setSHOPIDX(String.valueOf(i));
        if(i == 1) {
          inDtlDto.setDTLPAYAMT("-1");
        }
        
        productDtlLstService.createProductDtlLst(inDtlDto);
      }
      // 정렬 프로시저 호출
      int IDX = 0;
      try {
    	  IDX = Integer.parseInt(maxNum);
      } catch (NumberFormatException e) {
			// TODO: handle exception
	  }

      int dOutDto = productLstService.callRankProductDtl(IDX);

      System.out.println("dOutDto = [" + dOutDto + "]");
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

  @RequestMapping(value="/create-product-lst-bigdata", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public String createProductLstBigData(@RequestBody Map<String, Object> data, HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException {
    response.setContentType("text/html; charset=utf-8");
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");

    System.out.println("/create-product-lst-bigdata 호출 시작");
    ProductLstInDto inDto = new ProductLstInDto();
    
    inDto.setPRODUCTNM(checkDataIsNull(data.get("PRODUCTNM")));
    LOGGER.info(inDto.getPRODUCTNM());
    productLstService.createProductLst(inDto);
    
    String maxNum = productLstService.getMaxNum();
    LOGGER.info(maxNum);
    return maxNum;
  }

  @RequestMapping(value="/create-product-dtl-lst-bigdata", method=RequestMethod.POST)
  @ApiOperation(value = "상품 상세 대상 생성 호출", notes="상품 상세 대상 생성 호출")
  public String createProductDtlLstBigData(@RequestBody Map<String, Object> data) throws IOException, SQLException {
	  System.out.println("/create-product-dtl-lst-bigdata 호출 시작");
	  String resultMsg = "SUCCESS";
	  ProductDtlLstInDto inDtlDto = new ProductDtlLstInDto();
	  ShopLstInDto inDto = new ShopLstInDto();
	  ShopLstOutDto outDto = new ShopLstOutDto();
	  
	  inDtlDto.setPRODUCTIDX(checkDataIsNull(data.get("PRODUCTIDX")));
	  inDtlDto.setDTLPAYAMT(checkDataIsNull(data.get("DTLPAYAMT")));
	  inDtlDto.setDTLPRODUCTLINK(checkDataIsNull(data.get("DTLPRODUCTLINK")));
	  inDtlDto.setSHOPIDX(checkDataIsNull(data.get("SHOPIDX")));
	  LOGGER.info(inDtlDto.getPRODUCTIDX());
	  LOGGER.info(inDtlDto.getDTLPAYAMT());
	  LOGGER.info(inDtlDto.getDTLPRODUCTLINK());
	  LOGGER.info(inDtlDto.getSHOPIDX());
	  
	  inDto.setIDX(checkDataIsNull(data.get("SHOPIDX")));
	  
	  outDto = shopLstService.getShopIdx(inDto);
	  if(outDto == null) {
		  inDtlDto.setSHOPIDX("1");
	  } else {
		  inDtlDto.setSHOPIDX(outDto.getIDX());
		  
	  }
	  
	  productDtlLstService.createProductDtlLst(inDtlDto);

      // 정렬 프로시저 호출
      int IDX = 0;
      try {
    	  IDX = Integer.parseInt(checkDataIsNull(data.get("PRODUCTIDX")));
      } catch (NumberFormatException e) {
    	  resultMsg = "FAIL";
    	  LOGGER.error("PRODUCTIDX = [" + data.get("PRODUCTIDX") + "] SHOP IDX = [" + data.get("SHOPIDX") + "] 입력 중 오류 발생 되었습니다.");
			// TODO: handle exception
	  }
      
      productLstService.callRankProductDtl(IDX);

      return resultMsg;
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
