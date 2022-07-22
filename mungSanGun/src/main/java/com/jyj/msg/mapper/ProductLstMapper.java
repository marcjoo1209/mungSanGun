/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Mapper
@Repository
public interface ProductLstMapper {
  // 대상 조회
  ProductLstOutDto getProductLst(ProductLstInDto inDto);
  
  // 리스트 조회
  List<ProductLstOutDto> getListProductLst();
  
  // 리스트 생성
  Integer createProductLst(ProductLstInDto inDto);

  // 리스트 수정
  Integer modifyProductLst(ProductLstInDto inDto);
  
  // 리스트 삭제
  Integer removeProductLst(ProductLstInDto inDto);
}
