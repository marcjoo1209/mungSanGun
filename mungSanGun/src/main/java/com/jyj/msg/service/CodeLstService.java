/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jyj.msg.controller.dto.CodeLstInDto;
import com.jyj.msg.controller.dto.CodeLstOutDto;
import com.jyj.msg.mapper.CodeLstMapper;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Service
public class CodeLstService {
  
  @Autowired
  CodeLstMapper codeLstMapper;
  
  public List<CodeLstOutDto> getListCodeLst(){
    return codeLstMapper.getListCodeLst();
  }
  
  public Integer createCodeLst(CodeLstInDto inDto){
    return codeLstMapper.createCodeLst(inDto);
  }
  
  public Integer modifyCodeLst(CodeLstInDto inDto){
    return codeLstMapper.modifyCodeLst(inDto);
  }
  

}
