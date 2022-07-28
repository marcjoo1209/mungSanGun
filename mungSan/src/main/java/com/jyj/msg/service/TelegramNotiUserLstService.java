/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.TelegramNotiUserLstInDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public interface TelegramNotiUserLstService {

  TelegramNotiUserLstOutDto getTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) ;  
  List<TelegramNotiUserLstOutDto> getListTelegramNotiUserLst() ;
  
  Integer createTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) ;

  Integer modifyTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) ;
  
  Integer removeTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) ;

}
