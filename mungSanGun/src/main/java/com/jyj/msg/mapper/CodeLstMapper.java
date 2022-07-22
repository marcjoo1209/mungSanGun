/**
 * @file CodeLstServiceImpl.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.jyj.msg.controller.dto.CodeLstInDto;
import com.jyj.msg.controller.dto.CodeLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Mapper
@Repository
public interface CodeLstMapper {
  // 리스트 조회
  List<CodeLstOutDto> getListCodeLst();
  // 리스트 생성
  Integer createCodeLst(CodeLstInDto inDto);
  // 리스트 수정
  Integer modifyCodeLst(CodeLstInDto inDto);
}
