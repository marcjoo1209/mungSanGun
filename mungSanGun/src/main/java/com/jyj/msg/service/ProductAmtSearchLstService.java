/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductAmtSearchLstInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;
import com.jyj.msg.mapper.ProductAmtSearchLstMapper;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProductAmtSearchLstService {

  @Autowired
  ProductAmtSearchLstMapper productAmtSearchLstMapper;

  public ProductAmtSearchLstOutDto getProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    return productAmtSearchLstMapper.getProductAmtSearchLst(inDto);
  }
  
  public List<ProductAmtSearchLstOutDto> getListProductAmtSearchLstByShop(ProductAmtSearchLstInDto inDto) {
    return productAmtSearchLstMapper.getListProductAmtSearchLstByShop(inDto);
  }
  
  public List<ProductAmtSearchLstOutDto> getListProductAmtSearchLst() {
    return productAmtSearchLstMapper.getListProductAmtSearchLst();
  }
  
  public Integer createProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    return productAmtSearchLstMapper.createProductAmtSearchLst(inDto);
  }

  public Integer modifyProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    return productAmtSearchLstMapper.modifyProductAmtSearchLst(inDto);
  }
  
  public Integer removeProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    return productAmtSearchLstMapper.removeProductAmtSearchLst(inDto);
  }

}
