/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
public interface ShopLstService {
  
  List<ShopLstOutDto> getListShopLst();
  
  Integer createShopLst(ShopLstInDto inDto);
  
  Integer modifyShopLst(ShopLstInDto inDto);
  

}
