/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.mapper.ProductSearchLstMapper;
import com.jyj.msg.mapper.ShopLstMapper;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProductSearchLstService {

  @Autowired
  ProductSearchLstMapper productSearchLstMapper;

  public List<ProductSearchLstOutDto> getListProductSearchLst() {
    return productSearchLstMapper.getListProductSearchLst();
  }

  public Integer createProductSearchLst(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.createProductSearchLst(inDto);
  }

  public Integer modifyProductSearchLst(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.modifyProductSearchLst(inDto);
  }

}
