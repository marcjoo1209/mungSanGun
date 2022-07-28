/**
 * @file ShopLstService.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.TelegramNotiUserLstInDto;
import com.jyj.msg.controller.dto.TelegramNotiUserLstOutDto;
import com.jyj.msg.dao.TelegramNotiUserLstDao;
import com.jyj.msg.service.TelegramNotiUserLstService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Service
public class TelegramNotiUserLstServiceImpl implements TelegramNotiUserLstService  {

  @Autowired
  TelegramNotiUserLstDao telegramNotiUserLstMapper;

  public TelegramNotiUserLstOutDto getTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    return telegramNotiUserLstMapper.getTelegramNotiUserLst(inDto);
  }
  
  public List<TelegramNotiUserLstOutDto> getListTelegramNotiUserLst() {
    return telegramNotiUserLstMapper.getListTelegramNotiUserLst();
  }
  
  public Integer createTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    return telegramNotiUserLstMapper.createTelegramNotiUserLst(inDto);
  }

  public Integer modifyTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    return telegramNotiUserLstMapper.modifyTelegramNotiUserLst(inDto);
  }
  
  public Integer removeTelegramNotiUserLst(TelegramNotiUserLstInDto inDto) {
    return telegramNotiUserLstMapper.removeTelegramNotiUserLst(inDto);
  }

}
