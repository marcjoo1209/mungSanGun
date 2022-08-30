/**
 * @file ProductDtlLstController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.common.CommonUtil;
import com.jyj.msg.controller.dto.ExcelLstOutDto;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductDtlLstOutDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductSearchDto;
import com.jyj.msg.service.ExcelService;
import com.jyj.msg.service.ProductDtlLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
//@Slf4j
@RestController
@SessionAttributes("exceldtl")
//@RequestMapping(value = "/api/v1/app/")
public class ExcelLstController {
  @Autowired
  ExcelService excelService;

  @RequestMapping(value="/getlst-excel-lst", method=RequestMethod.POST)
  @ApiOperation(value = "상품 대상 생성 호출", notes="상품 대상 리스트 생성 호출")
  public List<ExcelLstOutDto> getListExcelLst(@RequestBody Map<String, Object> data) throws IOException {
    System.out.println("/getlst-excel-lst 호출 시작");
    
    List<ExcelLstOutDto> outDto = excelService.getListExcelLst();

    return outDto;
  }
}
