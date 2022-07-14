/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.mapper.ProductAmtSearchLogMapper;
import com.jyj.msg.mapper.ShopLstMapper;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProductAmtSearchLogService {

  @Autowired
  ProductAmtSearchLogMapper productAmtSearchLogMapper;

  public List<ProductAmtSearchLogOutDto> getListProductAmtSearchLog() {
    return productAmtSearchLogMapper.getListProductAmtSearchLog();
  }

  public Integer createProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    return productAmtSearchLogMapper.createProductAmtSearchLog(inDto);
  }

  public Integer modifyProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    return productAmtSearchLogMapper.modifyProductAmtSearchLog(inDto);
  }

}
