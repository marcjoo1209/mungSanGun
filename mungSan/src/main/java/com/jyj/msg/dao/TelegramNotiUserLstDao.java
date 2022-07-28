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
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstInDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Repository
public class TelegramNotiUserLstDao {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  // 대상 조회
  public TelegramNotiUserLstOutDto getTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    TelegramNotiUserLstOutDto outDto =
        mybatis.selectOne("TelegramNotiUserLstMapper.getTelegramNotiUserLst", inDto);
    return outDto;
  }
  
  // 리스트 조회
  public List<TelegramNotiUserLstOutDto> getListTelegramNotiUserLst() {
    List<TelegramNotiUserLstOutDto> outDto =
        mybatis.selectList("TelegramNotiUserLstMapper.getListTelegramNotiUserLst");
    return outDto;
  }
  
  // 리스트 생성
  public Integer createTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    Integer outDto =
        mybatis.insert("TelegramNotiUserLstMapper.createTelegramNotiUserLst", inDto);
    return outDto;
  }

  // 리스트 수정
  public Integer modifyTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    Integer outDto =
        mybatis.update("TelegramNotiUserLstMapper.modifyTelegramNotiUserLst", inDto);
    return outDto;
  }
  
  // 리스트 삭제
  public Integer removeTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    Integer outDto =
        mybatis.update("TelegramNotiUserLstMapper.removeTelegramNotiUserLst", inDto);
    return outDto;
  }
}
