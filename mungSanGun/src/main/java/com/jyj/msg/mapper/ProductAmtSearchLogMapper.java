/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductAmtSearchLogInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Mapper
@Repository
public interface ProductAmtSearchLogMapper {
  // 상품 조회 로그 조회
  List<ProductAmtSearchLogOutDto> getListProductAmtSearchLog();
  
  // 상품 조회 로그 조회
  ProductAmtSearchLogOutDto getProductAmtSearchLog(ProductAmtSearchLogInDto inDto);

  // 상품 조회 로그 생성
  Integer createProductAmtSearchLog(ProductAmtSearchLogInDto inDto);

  // 상품 조회 로그 생성
  Integer modifyProductAmtSearchLog(ProductAmtSearchLogInDto inDto);
}
