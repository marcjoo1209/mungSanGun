/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class ProductAmtSearchLogDao {

  @Autowired
  private SqlSessionTemplate mybatis;

  // 상품 조회 로그 조회
  public List<ProductAmtSearchLogOutDto> getListProductAmtSearchLog() {
    List<ProductAmtSearchLogOutDto> outDto =
        mybatis.selectList("ProductAmtSearchLogMapper.getListProductAmtSearchLog");
    return outDto;
  }
  
  // 상품 조회 로그 조
  public ProductAmtSearchLogOutDto getProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    ProductAmtSearchLogOutDto outDto =
        mybatis.selectOne("ProductAmtSearchLogMapper.getListProductAmtSearchLog",  inDto);
    return outDto;
  }

  // 상품 조회 로그 생성
  public Integer createProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    Integer outDto =
        mybatis.insert("ProductAmtSearchLogMapper.createProductAmtSearchLog",  inDto);
    return outDto;
  }

  // 상품 조회 로그 생성
  public Integer modifyProductAmtSearchLog(ProductAmtSearchLogInDto inDto) {
    Integer outDto =
        mybatis.update("ProductAmtSearchLogMapper.modifyProductAmtSearchLog",  inDto);
    return outDto;
  }
}
