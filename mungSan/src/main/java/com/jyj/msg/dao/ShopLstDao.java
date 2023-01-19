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
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Repository
public class ShopLstDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 리스트 조회
  public List<ShopLstOutDto> getListShopLst() {
    List<ShopLstOutDto> outDto =
        mybatis.selectList("ShopLstMapper.getListShopLst");
    return outDto;
  }
  // 리스트 생성
  public Integer createShopLst(ShopLstInDto inDto) {
    Integer outDto =
        mybatis.insert("ShopLstMapper.createShopLst", inDto);
    return outDto;
  }
  // 리스트 수정
  public Integer modifyShopLst(ShopLstInDto inDto) {
    Integer outDto =
        mybatis.update("ShopLstMapper.modifyShopLst", inDto);
    return outDto;
  }
  // 리스트 삭제
  public Integer removeShopLst(ShopLstInDto inDto) {
    Integer outDto =
        mybatis.delete("ShopLstMapper.removeShopLst", inDto);
    return outDto;
  }
  // 대상 조회
  public ShopLstOutDto getShopIdx(ShopLstInDto inDto) {
    ShopLstOutDto outDto =
        mybatis.selectOne("ShopLstMapper.getShopIdx", inDto);
    return outDto;
  }
}
