/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service;

import java.util.List;
import com.jyj.msg.controller.dto.CodeLstInDto;
import com.jyj.msg.controller.dto.CodeLstOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
public interface CodeLstService {
  
  List<CodeLstOutDto> getListCodeLst();
  
  Integer createCodeLst(CodeLstInDto inDto);
  
  Integer modifyCodeLst(CodeLstInDto inDto);
  

}
