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
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class ProductLstDao {
  @Autowired
  private SqlSessionTemplate mybatis;

  // 대상 조회
  public ProductLstOutDto getProductLst(ProductLstInDto inDto) {
    ProductLstOutDto outDto =
        mybatis.selectOne("ProductLstMapper.getProductLst",inDto);
    return outDto;
  }
  
  // 리스트 조회
  public List<ProductLstOutDto> getListProductLst(ProductLstInDto inDto) {
    List<ProductLstOutDto> outDto =
        mybatis.selectList("ProductLstMapper.getListProductLst", inDto);
    return outDto;
  }

  // 리스트 조회
  public List<ProductLstOutDto> getListProductLstLowPrice(ProductLstInDto inDto) {
    List<ProductLstOutDto> outDto =
        mybatis.selectList("ProductLstMapper.getListProductLstLowPrice", inDto);
    return outDto;
  }
  
  // 리스트 생성
  public Integer createProductLst(ProductLstInDto inDto) {
    Integer outDto =
        mybatis.insert("ProductLstMapper.createProductLst", inDto);
    return outDto;
  }

  // 리스트 수정
  public Integer modifyProductLst(ProductLstInDto inDto) {
    Integer outDto =
        mybatis.update("ProductLstMapper.modifyProductLst", inDto);
    return outDto;
  }
  
  // 리스트 삭제
  public Integer removeProductLst(ProductLstInDto inDto) {
    Integer outDto =
        mybatis.update("ProductLstMapper.removeProductLst", inDto);
    return outDto;
  }

  // 대상 조회
  public String getMaxNum() {
    String outDto =
        mybatis.selectOne("ProductLstMapper.getMaxNum");
    return outDto;
  }
}
