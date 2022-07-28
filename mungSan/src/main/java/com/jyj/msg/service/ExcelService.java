/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
public interface ExcelService {
  
  List<MngShopProductTmpTblOutDto> uploadExcelFile(MultipartFile file);

}
