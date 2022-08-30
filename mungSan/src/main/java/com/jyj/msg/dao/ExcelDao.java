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
import com.jyj.msg.controller.dto.ExcelLstOutDto;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstInDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstInDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Repository
public class ExcelDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 리스트 조회
  public List<ExcelLstOutDto> getListExcelLst() {
    List<ExcelLstOutDto> outDto =
        mybatis.selectList("ExcelMapper.getListExcelLst");
    return outDto;
  }

  // 리스트 조회
  public int createListExcelListTbl(ProductLstInDto inDto) {
    int outDto =
        mybatis.insert("ExcelMapper.createListExcelListTbl", inDto);
    return outDto;
  }

  // 리스트 조회
  public int createListExcelDtlListTbl(ProductDtlLstInDto inDto) {
    int outDto =
        mybatis.insert("ExcelMapper.createListExcelDtlListTbl", inDto);
    return outDto;
  }
}
