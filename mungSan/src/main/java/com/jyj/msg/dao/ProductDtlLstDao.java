/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductDtlLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class ProductDtlLstDao {
  @Autowired
  private SqlSessionTemplate mybatis;

  // 대상 조회
  public List<ProductDtlLstOutDto> getProductDtlLst(ProductSearchDto inDto) {
    List<ProductDtlLstOutDto> outDto =
        mybatis.selectOne("ProductDtlLstMapper.getProductDtlLst",inDto);
    return outDto;
  }
  
  // 리스트 조회
  public List<ProductDtlLstOutDto> getListProductDtlLst(ProductSearchDto inDto) {
    List<ProductDtlLstOutDto> outDto =
        mybatis.selectList("ProductDtlLstMapper.getListProductDtlLst", inDto);
    return outDto;
  }
  
  // 리스트 생성
  public Integer createProductDtlLst(ProductDtlLstInDto inDto) {
    Integer outDto =
        mybatis.insert("ProductDtlLstMapper.createProductDtlLst", inDto);
    return outDto;
  }

  // 리스트 수정
  public Integer modifyProductDtlLst(ProductDtlLstInDto inDto) {
    Integer outDto =
        mybatis.update("ProductDtlLstMapper.modifyProductDtlLst", inDto);
    return outDto;
  }
  
  // 리스트 삭제
  public Integer removeProductDtlLst(ProductDtlLstInDto inDto) {
    Integer outDto =
        mybatis.update("ProductDtlLstMapper.removeProductDtlLst", inDto);
    return outDto;
  }
}
