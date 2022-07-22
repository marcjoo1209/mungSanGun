/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.TelegramNotiUserLstInDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Mapper
@Repository
public interface TelegramNotiUserLstMapper {
  // 대상 조회
  TelegramNotiUserLstOutDto getTelegramNotiUserLst(TelegramNotiUserLstInDto inDto);
  
  // 리스트 조회
  List<TelegramNotiUserLstOutDto> getListTelegramNotiUserLst();
  
  // 리스트 생성
  Integer createTelegramNotiUserLst(TelegramNotiUserLstInDto inDto);

  // 리스트 수정
  Integer modifyTelegramNotiUserLst(TelegramNotiUserLstInDto inDto);
  
  // 리스트 삭제
  Integer removeTelegramNotiUserLst(TelegramNotiUserLstInDto inDto);
}
