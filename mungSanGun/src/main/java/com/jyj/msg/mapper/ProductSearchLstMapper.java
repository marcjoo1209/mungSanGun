/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Mapper
@Repository
public interface ProductSearchLstMapper {
  // 리스트 조회
  List<ProductSearchLstOutDto> getListProductSearchLst();

  // 리스트 생성
  Integer createProductSearchLst(ProductSearchLstInDto inDto);

  // 리스트 수정
  Integer modifyProductSearchLst(ProductSearchLstInDto inDto);
}
