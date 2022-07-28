/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.dao.ProductSearchLstDao;
import com.jyj.msg.service.ProductSearchLstService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProductSearchLstServiceImpl implements ProductSearchLstService {

  @Autowired
  ProductSearchLstDao productSearchLstMapper;

  public ProductSearchLstOutDto getProductSearchLst(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.getProductSearchLst(inDto);
  }
  
  public List<ProductSearchLstOutDto> getListProductSearchLst() {
    return productSearchLstMapper.getListProductSearchLst();
  }
  
  public List<ProductSearchLstOutDto> getListProductSearchLstLocal(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.getListProductSearchLstLocal(inDto);
  }

  public Integer createProductSearchLst(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.createProductSearchLst(inDto);
  }

  public Integer modifyProductSearchLst(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.modifyProductSearchLst(inDto);
  }
  
  public Integer removeProductSearchLst(ProductSearchLstInDto inDto) {
    return productSearchLstMapper.removeProductSearchLst(inDto);
  }

}
