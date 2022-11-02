/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;
import com.jyj.msg.dao.ProductLstDao;
import com.jyj.msg.service.ProductLstService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class ProdutLstServiceImpl implements ProductLstService{

  @Autowired
  ProductLstDao productLstMapper;

  public ProductLstOutDto getProductLst(ProductLstInDto inDto) {
    return productLstMapper.getProductLst(inDto);
  }
  
  public List<ProductLstOutDto> getListProductLst(ProductLstInDto inDto) {
    return productLstMapper.getListProductLst(inDto);
  }

  public List<ProductLstOutDto> getListProductLstLowPrice(ProductLstInDto inDto) {
    return productLstMapper.getListProductLstLowPrice(inDto);
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

  public String getMaxNum() {
    return productLstMapper.getMaxNum();
  }

  public int callRankProductDtl(int IDX) {
    return productLstMapper.callRankProductDtl(IDX);
  }

}
