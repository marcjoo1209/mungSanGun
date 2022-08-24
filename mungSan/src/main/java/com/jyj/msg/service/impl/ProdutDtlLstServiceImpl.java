/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductDtlLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchDto;
import com.jyj.msg.dao.ProductDtlLstDao;
import com.jyj.msg.service.ProductDtlLstService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProdutDtlLstServiceImpl implements ProductDtlLstService{

  @Autowired
  ProductDtlLstDao productDtlLstMapper;

  public List<ProductDtlLstOutDto> getProductDtlLst(ProductSearchDto inDto) {
    return productDtlLstMapper.getProductDtlLst(inDto);
  }
  
  public List<ProductDtlLstOutDto> getListProductDtlLst(ProductSearchDto inDto) {
    return productDtlLstMapper.getListProductDtlLst(inDto);
  }
  
  public Integer createProductDtlLst(ProductDtlLstInDto inDto) {
    return productDtlLstMapper.createProductDtlLst(inDto);
  }

  public Integer modifyProductDtlLst(ProductDtlLstInDto inDto) {
    return productDtlLstMapper.modifyProductDtlLst(inDto);
  }
  
  public Integer removeProductDtlLst(ProductDtlLstInDto inDto) {
    return productDtlLstMapper.removeProductDtlLst(inDto);
  }

}
