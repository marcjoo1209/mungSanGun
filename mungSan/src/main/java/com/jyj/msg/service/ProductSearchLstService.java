/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface ProductSearchLstService {

  ProductSearchLstOutDto getProductSearchLst(ProductSearchLstInDto inDto);
  
  List<ProductSearchLstOutDto> getListProductSearchLst() ;
  
  List<ProductSearchLstOutDto> getListProductSearchLstLocal(ProductSearchLstInDto inDto);

  Integer createProductSearchLst(ProductSearchLstInDto inDto) ;

  Integer modifyProductSearchLst(ProductSearchLstInDto inDto) ;
  
  Integer removeProductSearchLst(ProductSearchLstInDto inDto) ;

}
