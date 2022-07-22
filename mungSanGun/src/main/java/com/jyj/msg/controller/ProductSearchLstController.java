/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.net.URI;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.ProductSearchLstService;
import com.jyj.msg.service.ShopLstService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Slf4j
@RestController
//@RequestMapping(value = "/api/v1/app/")
public class ProductSearchLstController {
  @Autowired
  ProductSearchLstService productSearchLstService;

  @RequestMapping(value="/getProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 조회", notes="상품 대상 리스트 조회")
  public Object getProductSearchLst(HttpServletRequest request, Model model) {
    log.debug("/getProductSearchLst 호출 시작");
    ProductSearchLstInDto inDto = new ProductSearchLstInDto();
    inDto.setIDX(request.getParameter("IDX"));
    JSONObject j_obj = new JSONObject();
    ProductSearchLstOutDto outDto = productSearchLstService.getProductSearchLst(inDto);

    j_obj.put("rst0", outDto.getIDX());             // 순서
    j_obj.put("rst1", outDto.getTARGETCOMMANT());   // 대상웹페이지별명
    j_obj.put("rst2", outDto.getSHOPIDX());         // 이커머스순서
    j_obj.put("rst3", outDto.getTARGETWEBURL());    // 대상웹페이지주소
    j_obj.put("rst4", outDto.getTARGETAMT());       // 기준 금액
    j_obj.put("rst5", outDto.getGBUPDOWN());        // 0:최소, 1:최대 초과 구분
    j_obj.put("rst6", outDto.getGBCARD());          // 0:쿠폰, 1:카드 구분
    j_obj.put("rst7", outDto.getALAMSOLDOUT());     // 품절시 알람 요청 Y:알람요청:,N:알람미요청
    j_obj.put("rst8", outDto.getID());              // 로그인id
    j_obj.put("rst9", outDto.getPWD());             // 로그인pwd
    j_obj.put("rst10", outDto.getCREATEDTM());      // 생성일자
    j_obj.put("rst11", outDto.getAUDITDTM());       // 수정일자
    j_obj.put("rst12", outDto.getALAMYN());         // 알림 여부
    j_obj.put("rst13", outDto.getAUDITID());        // 수정자
    
    return j_obj;
  }
  
  @RequestMapping(value="/getListProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 조회", notes="상품 대상 리스트 조회")
  public void getListProductSearchLst() {
    log.debug("/getListProductSearchLst 호출 시작");
    List<ProductSearchLstOutDto> outDto = productSearchLstService.getListProductSearchLst();
    System.out.println(outDto);
    
  }
  
  @RequestMapping(value="/createProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 생성", notes="상품 대상 리스트 생성")
  public ResponseEntity<?> createProductSearchLst(HttpServletRequest request, Model model) {
    log.debug("/createProductSearchLst 호출 시작");
    ProductSearchLstInDto inDto = new ProductSearchLstInDto();
    inDto.setIDX(request.getParameter("IDX1"));
    inDto.setTARGETCOMMANT(request.getParameter("TARGETCOMMANT1"));
    inDto.setSHOPIDX(request.getParameter("SHOPIDX1"));
    inDto.setTARGETWEBURL(request.getParameter("TARGETWEBURL1"));
    inDto.setTARGETAMT(request.getParameter("TARGETAMT1"));
    inDto.setGBUPDOWN(request.getParameter("GBUPDOWN1"));
    inDto.setGBCARD(request.getParameter("GBCARD1"));
    inDto.setALAMSOLDOUT(request.getParameter("ALAMSOLDOUT1"));
    inDto.setID(request.getParameter("ID1"));
    inDto.setPWD(request.getParameter("PWD1"));
    inDto.setALAMYN(request.getParameter("ALAMYN1"));
    inDto.setAUDITID(request.getParameter("AUDITID1"));
    Integer outDto = productSearchLstService.createProductSearchLst(inDto);
    
    if(outDto > 0) {
      log.debug("/modifyProductSearchLst 정상 호출");
    }
    
    HttpHeaders headers = new HttpHeaders();
    headers.setLocation(URI.create("/main"));
    return new ResponseEntity<>(headers, HttpStatus.MOVED_PERMANENTLY);
  }
  
  @RequestMapping(value="/modifyProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 수정", notes="상품 대상 리스트 수정")
  public ResponseEntity<?> modifyProductSearchLst(HttpServletRequest request, Model model) {
    log.debug("/modifyProductSearchLst 호출 시작");
    ProductSearchLstInDto inDto = new ProductSearchLstInDto();
    inDto.setIDX(request.getParameter("IDX"));
    inDto.setTARGETCOMMANT(request.getParameter("TARGETCOMMANT"));
    inDto.setSHOPIDX(request.getParameter("SHOPIDX"));
    inDto.setTARGETWEBURL(request.getParameter("TARGETWEBURL"));
    inDto.setTARGETAMT(request.getParameter("TARGETAMT"));
    inDto.setGBUPDOWN(request.getParameter("GBUPDOWN"));
    inDto.setGBCARD(request.getParameter("GBCARD"));
    inDto.setALAMSOLDOUT(request.getParameter("ALAMSOLDOUT"));
    inDto.setID(request.getParameter("ID"));
    inDto.setPWD(request.getParameter("PWD"));
    inDto.setALAMYN(request.getParameter("ALAMYN"));
    inDto.setAUDITID(request.getParameter("AUDITID"));
    Integer outDto = productSearchLstService.modifyProductSearchLst(inDto);
    
    if(outDto > 0) {
      log.debug("/modifyProductSearchLst 정상 호출");
    }

    HttpHeaders headers = new HttpHeaders();
    headers.setLocation(URI.create("/main"));
    return new ResponseEntity<>(headers, HttpStatus.MOVED_PERMANENTLY);
  }
  
  @RequestMapping(value="/removeProductSearchLst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 삭제", notes="상품 대상 리스트 삭제")
  public ResponseEntity<?> removeProductSearchLst(HttpServletRequest request, Model model) {
    log.debug("/removeProductSearchLst 호출 시작");
    ProductSearchLstInDto inDto = new ProductSearchLstInDto();
    inDto.setIDX(request.getParameter("IDX2"));
    inDto.setUSEYN(request.getParameter("USEYN2"));
    Integer outDto = productSearchLstService.removeProductSearchLst(inDto);
    
    if(outDto > 0) {
      log.debug("/removeProductSearchLst 정상 호출");
    }
    
    HttpHeaders headers = new HttpHeaders();
    headers.setLocation(URI.create("/main"));
    return new ResponseEntity<>(headers, HttpStatus.MOVED_PERMANENTLY);
  }

  @RequestMapping(value="/getlist-product-search-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 리스트 조회 로컬 호출", notes="상품 대상 리스트 조회 로컬 호출")
  public List<ProductSearchLstOutDto> getListProductSearchLstLocal(@RequestBody ProductSearchLstInDto inDto) throws IOException {
    log.debug("/getlist-product-search-lst 호출 시작");
    //ProductSearchLstInDto inDto = new ProductSearchLstInDto();
    //inDto.setSHOPIDX(shopidx);
    List<ProductSearchLstOutDto> outDto = productSearchLstService.getListProductSearchLstLocal(inDto);

    return outDto;
  }
}
