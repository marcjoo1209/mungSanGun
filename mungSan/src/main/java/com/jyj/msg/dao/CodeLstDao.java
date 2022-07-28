/**
 * @file CodeLstServiceImpl.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.CodeLstInDto;
import com.jyj.msg.controller.dto.CodeLstOutDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Repository
public class CodeLstDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 리스트 조회
  public List<CodeLstOutDto> getListCodeLst() {
    List<CodeLstOutDto> outDto =
        mybatis.selectList("CodeLstMapper.getListCodeLst");
    return outDto;
  }
  // 리스트 생성
  public Integer createCodeLst(CodeLstInDto inDto) {
    Integer outDto =
        mybatis.insert("CodeLstMapper.createCodeLst", inDto);
    return outDto;
  }
  // 리스트 수정
  public Integer modifyCodeLst(CodeLstInDto inDto) {
    Integer outDto =
        mybatis.insert("CodeLstMapper.modifyCodeLst", inDto);
    return outDto;
  }
}
