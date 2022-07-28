/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.dao.ProductAmtSearchLogDao;
import com.jyj.msg.service.ProductAmtSearchLogService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProductAmtSearchLogServiceImpl implements ProductAmtSearchLogService {

  @Autowired
  ProductAmtSearchLogDao productAmtSearchLogMapper;

  public List<ProductAmtSearchLogOutDto> getListProductAmtSearchLog() {
    return productAmtSearchLogMapper.getListProductAmtSearchLog();
  }
  
  public ProductAmtSearchLogOutDto getProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    return productAmtSearchLogMapper.getProductAmtSearchLog(inDto);
  }

  public Integer createProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    return productAmtSearchLogMapper.createProductAmtSearchLog(inDto);
  }

  public Integer modifyProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    return productAmtSearchLogMapper.modifyProductAmtSearchLog(inDto);
  }

}
