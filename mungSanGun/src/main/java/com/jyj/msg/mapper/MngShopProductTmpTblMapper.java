/**
 * @file ShopLstServiceImpl.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Mapper
@Repository
public interface MngShopProductTmpTblMapper {
  // 대상 조회
  MngShopProductTmpTblOutDto getMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  // 리스트 조회
  List<MngShopProductTmpTblOutDto> getListMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  // 리스트 생성
  Integer createMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);

  // 리스트 수정
  Integer modifyMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
  
  // 리스트 삭제
  Integer removeMngShopProductTmpTbl(MngShopProductTmpTblInDto inDto);
}
