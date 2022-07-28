/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface MngShopProductTmpTblService {

  MngShopProductTmpTblOutDto getMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  List<MngShopProductTmpTblOutDto> getListMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  Integer createMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  Integer createListMngShopProductTmpTbl(List<MngShopProductTmpTblOutDto> inDto);

  Integer modifyMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  Integer removeMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);

}
