/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Mapper
@Repository
public interface ShopLstMapper {
  // 리스트 조회
  List<ShopLstOutDto> getListShopLst();
  // 리스트 생성
  Integer createShopLst(ShopLstInDto inDto);
  // 리스트 수정
  Integer modifyShopLst(ShopLstInDto inDto);
}
