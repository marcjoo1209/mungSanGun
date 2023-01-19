/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.dao.ShopLstDao;
import com.jyj.msg.service.ShopLstService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Service
public class ShopLstServicImpl  implements ShopLstService{
  
  @Autowired
  ShopLstDao shopLstMapper;
  
  public List<ShopLstOutDto> getListShopLst(){
    return shopLstMapper.getListShopLst();
  }
  
  public Integer createShopLst(ShopLstInDto inDto){
    return shopLstMapper.createShopLst(inDto);
  }
  
  public Integer modifyShopLst(ShopLstInDto inDto){
    return shopLstMapper.modifyShopLst(inDto);
  }
  
  public Integer removeShopLst(ShopLstInDto inDto){
    return shopLstMapper.removeShopLst(inDto);
  }

  public ShopLstOutDto getShopIdx(ShopLstInDto inDto){
    return shopLstMapper.getShopIdx(inDto);
  }
}
