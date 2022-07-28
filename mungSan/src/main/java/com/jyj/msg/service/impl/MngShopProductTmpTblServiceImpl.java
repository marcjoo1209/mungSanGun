/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.dao.MngShopProductTmpTblDao;
import com.jyj.msg.service.MngShopProductTmpTblService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class  MngShopProductTmpTblServiceImpl  implements MngShopProductTmpTblService {

  @Autowired
  MngShopProductTmpTblDao MngShopProductTmpTblMapper;

  public MngShopProductTmpTblOutDto getMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    return MngShopProductTmpTblMapper.getMngShopProductTmpTbl(inDto);
  }
  
  public List<MngShopProductTmpTblOutDto> getListMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    return MngShopProductTmpTblMapper.getListMngShopProductTmpTbl(inDto);
  }
  
  public Integer createMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    return MngShopProductTmpTblMapper.createMngShopProductTmpTbl(inDto);
  }
  
  public Integer createListMngShopProductTmpTbl(List<MngShopProductTmpTblOutDto> inDto) {
    return MngShopProductTmpTblMapper.createListMngShopProductTmpTbl(inDto);
  }

  public Integer modifyMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    return MngShopProductTmpTblMapper.modifyMngShopProductTmpTbl(inDto);
  }
  
  public Integer removeMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    return MngShopProductTmpTblMapper.removeMngShopProductTmpTbl(inDto);
  }

}
