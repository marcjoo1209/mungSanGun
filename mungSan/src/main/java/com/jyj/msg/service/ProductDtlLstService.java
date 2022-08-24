/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductDtlLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface ProductDtlLstService {

  List<ProductDtlLstOutDto> getProductDtlLst(ProductSearchDto inDto);
  
  List<ProductDtlLstOutDto> getListProductDtlLst(ProductSearchDto inDto);
  
  Integer createProductDtlLst(ProductDtlLstInDto inDto);

  Integer modifyProductDtlLst(ProductDtlLstInDto inDto);
  
  Integer removeProductDtlLst(ProductDtlLstInDto inDto);

}
