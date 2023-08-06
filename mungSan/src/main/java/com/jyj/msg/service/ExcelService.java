/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.jyj.msg.controller.dto.ExcelLstOutDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductExcelLstDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ReturnDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
public interface ExcelService {

  List<MngShopProductTmpTblOutDto> uploadExcelFile(MultipartFile file);

  List<ExcelLstOutDto> uploadExcelMainFile(MultipartFile file);

  List<ExcelLstOutDto> getListExcelLst();
  
  int createListExcelListTbl(ProductLstInDto inDto);

  int createListExcelDtlListTbl(ProductDtlLstInDto inDto);
  
  List<ProductExcelLstDto> getCountProductLst();
  
  ReturnDto getCountProductLstFile(HttpServletRequest request);
  
}
