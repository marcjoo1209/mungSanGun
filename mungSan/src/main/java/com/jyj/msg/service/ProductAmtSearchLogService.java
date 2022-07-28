/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface ProductAmtSearchLogService {

  List<ProductAmtSearchLogOutDto> getListProductAmtSearchLog();
  
  ProductAmtSearchLogOutDto getProductAmtSearchLog(ProductAmtSearchLogInDto inDto);

  Integer createProductAmtSearchLog(ProductAmtSearchLogInDto inDto);

  Integer modifyProductAmtSearchLog(ProductAmtSearchLogInDto inDto);

}
