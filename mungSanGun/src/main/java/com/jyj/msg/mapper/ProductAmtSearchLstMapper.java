/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductAmtSearchLstInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Mapper
@Repository
public interface ProductAmtSearchLstMapper {
  // 대상 조회
  ProductAmtSearchLstOutDto getProductAmtSearchLst(ProductAmtSearchLstInDto inDto);
  
  // 리스트 조회
  List<ProductAmtSearchLstOutDto> getListProductAmtSearchLstByShop(ProductAmtSearchLstInDto inDto);
  
  // 리스트 조회
  List<ProductAmtSearchLstOutDto> getListProductAmtSearchLst();
  
  // 리스트 생성
  Integer createProductAmtSearchLst(ProductAmtSearchLstInDto inDto);

  // 리스트 수정
  Integer modifyProductAmtSearchLst(ProductAmtSearchLstInDto inDto);
  
  // 리스트 삭제
  Integer removeProductAmtSearchLst(ProductAmtSearchLstInDto inDto);
}
