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
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class ProductSearchLstDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 대상 조회
  public ProductSearchLstOutDto getProductSearchLst(ProductSearchLstInDto inDto) {
    ProductSearchLstOutDto outDto =
        mybatis.selectOne("ProductSearchLstMapper.getProductSearchLst",inDto);
    return outDto;
  }
  
  // 리스트 조회
  public List<ProductSearchLstOutDto> getListProductSearchLst() {
    List<ProductSearchLstOutDto> outDto =
        mybatis.selectList("ProductSearchLstMapper.getProductSearchLst");
    return outDto;
  }
  
  // 리스트 조회
  public List<ProductSearchLstOutDto> getListProductSearchLstLocal(ProductSearchLstInDto inDto) {
    List<ProductSearchLstOutDto> outDto =
        mybatis.selectList("ProductSearchLstMapper.getListProductSearchLstLocal", inDto);
    return outDto;
  }

  // 리스트 생성
  public Integer createProductSearchLst(ProductSearchLstInDto inDto) {
    Integer outDto =
        mybatis.insert("ProductSearchLstMapper.createProductSearchLst", inDto);
    return outDto;
  }

  // 리스트 수정
  public Integer modifyProductSearchLst(ProductSearchLstInDto inDto) {
    Integer outDto =
        mybatis.update("ProductSearchLstMapper.modifyProductSearchLst", inDto);
    return outDto;
  }
  
  // 리스트 삭제
  public Integer removeProductSearchLst(ProductSearchLstInDto inDto) {
    Integer outDto =
        mybatis.update("ProductSearchLstMapper.removeProductSearchLst", inDto);
    return outDto;
  }
}
