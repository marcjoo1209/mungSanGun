/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface ProductLstService {

  ProductLstOutDto getProductLst(ProductLstInDto inDto);
  
  List<ProductLstOutDto> getListProductLst();
  
  Integer createProductLst(ProductLstInDto inDto);

  Integer modifyProductLst(ProductLstInDto inDto);
  
  Integer removeProductLst(ProductLstInDto inDto);

}
