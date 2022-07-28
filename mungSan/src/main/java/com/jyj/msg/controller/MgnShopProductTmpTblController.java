/**
 * @file MngShopProductTmpTblController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.service.MngShopProductTmpTblService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
//@Slf4j
@Controller
@SessionAttributes("aptinfo")
//@RequestMapping(value = "/api/v1/app/")
public class MgnShopProductTmpTblController {
  @Autowired
  MngShopProductTmpTblService mngShopProductTmpTblService;

  @RequestMapping(value="/getlist-mng-shop-product-tmp-tbl", method=RequestMethod.POST)
  @ApiOperation(value = "알림 대상 리스트 조회 로컬 호출", notes="알림 대상 리스트 조회 로컬 호출")
  public List<MngShopProductTmpTblOutDto> getListMngShopProductTmpTbl(@RequestBody MngShopProductTmpTblInDto inDto) throws IOException {
    //log.debug("/getlist-mng-shop-product-tmp-tbl 호출 시작");
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);

    return outDto;
  }
  
  @RequestMapping(value="/get-mng-shop-product-tmp-tbl", method=RequestMethod.POST)
  @ApiOperation(value = "알림 대상 조회 호출", notes="알림 대상 리스트 조회 호출")
  public MngShopProductTmpTblOutDto getMngShopProductTmpTbl(@RequestBody MngShopProductTmpTblInDto inDto) throws IOException {
    //log.debug("/get-mng-shop-product-tmp-tbl 호출 시작");
    MngShopProductTmpTblOutDto outDto = mngShopProductTmpTblService.getMngShopProductTmpTbl(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/create-mng-shop-product-tmp-tbl", method=RequestMethod.POST)
  @ApiOperation(value = "알림 대상 생성 호출", notes="알림 대상 리스트 생성 호출")
  public Integer createMngShopProductTmpTbl(@RequestBody MngShopProductTmpTblInDto inDto) throws IOException {
    //log.debug("/create-mng-shop-product-tmp-tbl 호출 시작");
    Integer outDto = mngShopProductTmpTblService.createMngShopProductTmpTbl(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/modify-mng-shop-product-tmp-tbl", method=RequestMethod.POST)
  @ApiOperation(value = "알림 대상 수정 호출", notes="알림 대상 리스트 수정 호출")
  public Integer modifyMngShopProductTmpTbl(@RequestBody MngShopProductTmpTblInDto inDto) throws IOException {
    //log.debug("/modify-mng-shop-product-tmp-tbl 호출 시작");
    Integer outDto = mngShopProductTmpTblService.modifyMngShopProductTmpTbl(inDto);
    
    return outDto;
  }
  
  @RequestMapping(value="/remove-mng-shop-product-tmp-tbl", method=RequestMethod.POST)
  @ApiOperation(value = "알림 대상 수정 호출", notes="알림 대상 리스트 수정 호출")
  public Integer removeMngShopProductTmpTbl(@RequestBody MngShopProductTmpTblInDto inDto) throws IOException {
    //log.debug("/remove-mng-shop-product-tmp-tbl 호출 시작");
    Integer outDto = mngShopProductTmpTblService.removeMngShopProductTmpTbl(inDto);
    
    return outDto;
  }
}
