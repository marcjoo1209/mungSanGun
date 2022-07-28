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
import org.springframework.transaction.annotation.Transactional;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstInDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class MngShopProductTmpTblDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 대상 조회
  public MngShopProductTmpTblOutDto getMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    MngShopProductTmpTblOutDto outDto =
        mybatis.selectOne("MngShopProductTmpTblMapper.getMngShopProductTmpTbl", inDto);
    return outDto;
  }
  
  // 리스트 조회
  public List<MngShopProductTmpTblOutDto> getListMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    List<MngShopProductTmpTblOutDto> outDto =
        mybatis.selectList("MngShopProductTmpTblMapper.getListMngShopProductTmpTbl", inDto);
    return outDto;
  }
  
  // 리스트 생성
  public Integer createMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    Integer outDto =
        mybatis.insert("MngShopProductTmpTblMapper.createMngShopProductTmpTbl", inDto);
    return outDto;
  }
  
  // 리스트 다건 생성
  @Transactional(rollbackFor = Exception.class)
  public Integer createListMngShopProductTmpTbl(List<MngShopProductTmpTblOutDto> inDto) {
    Integer outDto = 0;
    for(MngShopProductTmpTblOutDto dInDto:inDto) {
      outDto = mybatis.insert("MngShopProductTmpTblMapper.createListMngShopProductTmpTbl", dInDto);
      System.out.println(outDto);
    }
    return outDto;
  }

  // 리스트 수정
  public Integer modifyMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    Integer outDto =
        mybatis.update("MngShopProductTmpTblMapper.modifyMngShopProductTmpTbl", inDto);
    return outDto;
  }
  
  // 리스트 삭제
  public Integer removeMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto) {
    Integer outDto =
        mybatis.update("MngShopProductTmpTblMapper.removeMngShopProductTmpTbl", inDto);
    return outDto;
  }
}
