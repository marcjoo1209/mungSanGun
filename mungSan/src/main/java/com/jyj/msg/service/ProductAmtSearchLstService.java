/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.ProductAmtSearchLstInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface ProductAmtSearchLstService {

  ProductAmtSearchLstOutDto getProductAmtSearchLst(ProductAmtSearchLstInDto inDto);
  
  List<ProductAmtSearchLstOutDto> getListProductAmtSearchLstByShop(ProductAmtSearchLstInDto inDto);
  
  List<ProductAmtSearchLstOutDto> getListProductAmtSearchLst();
  
  Integer createProductAmtSearchLst(ProductAmtSearchLstInDto inDto);

  Integer modifyProductAmtSearchLst(ProductAmtSearchLstInDto inDto);
  
  Integer removeProductAmtSearchLst(ProductAmtSearchLstInDto inDto);

}
