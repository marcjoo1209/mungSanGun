/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductAmtSearchLstInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import org.mybatis.spring.SqlSessionTemplate;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class ProductAmtSearchLstDao {

  @Autowired
  private SqlSessionTemplate mybatis;

  // 대상 조회
  public ProductAmtSearchLstOutDto getProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    ProductAmtSearchLstOutDto outDto = new ProductAmtSearchLstOutDto();
    outDto = mybatis.selectOne("ProductAmtSearchLstMapper.getProductAmtSearchLst", inDto);
    if (outDto == null) {
      outDto = new ProductAmtSearchLstOutDto();
    }
    return outDto;
  }

  // 리스트 조회
  public List<ProductAmtSearchLstOutDto> getListProductAmtSearchLstByShop(
      ProductAmtSearchLstInDto inDto) {
    List<ProductAmtSearchLstOutDto> outDto =
        mybatis.selectList("ProductAmtSearchLstMapper.getListProductAmtSearchLstByShop", inDto);
    return outDto;
  }

  // 리스트 조회
  public List<ProductAmtSearchLstOutDto> getListProductAmtSearchLst() {
    List<ProductAmtSearchLstOutDto> outDto =
        mybatis.selectList("ProductAmtSearchLstMapper.getListProductAmtSearchLstByShop");
    return outDto;
  }

  // 리스트 생성
  public Integer createProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    Integer outDto = mybatis.insert("ProductAmtSearchLstMapper.createProductAmtSearchLst", inDto);
    return outDto;
  }

  // 리스트 수정
  public Integer modifyProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    Integer outDto = mybatis.update("ProductAmtSearchLstMapper.modifyProductAmtSearchLst", inDto);
    return outDto;
  }

  // 리스트 삭제
  public Integer removeProductAmtSearchLst(ProductAmtSearchLstInDto inDto) {
    Integer outDto = mybatis.update("ProductAmtSearchLstMapper.removeProductAmtSearchLst", inDto);
    return outDto;
  }
}
