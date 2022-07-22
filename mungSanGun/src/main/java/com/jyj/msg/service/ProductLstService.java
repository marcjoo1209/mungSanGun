/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;
import com.jyj.msg.mapper.ProductLstMapper;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProductLstService {

  @Autowired
  ProductLstMapper productLstMapper;

  public ProductLstOutDto getProductLst(ProductLstInDto inDto) {
    return productLstMapper.getProductLst(inDto);
  }
  
  public List<ProductLstOutDto> getListProductLst() {
    return productLstMapper.getListProductLst();
  }
  
  public Integer createProductLst(ProductLstInDto inDto) {
    return productLstMapper.createProductLst(inDto);
  }

  public Integer modifyProductLst(ProductLstInDto inDto) {
    return productLstMapper.modifyProductLst(inDto);
  }
  
  public Integer removeProductLst(ProductLstInDto inDto) {
    return productLstMapper.removeProductLst(inDto);
  }

}
