package com.jyj.msg.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.jyj.msg.controller.dto.CodeLstOutDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.CodeLstService;
import com.jyj.msg.service.ExcelService;
import com.jyj.msg.service.MngShopProductTmpTblService;
import com.jyj.msg.service.ProductAmtSearchLogService;
import com.jyj.msg.service.ProductAmtSearchLstService;
import com.jyj.msg.service.ProductSearchLstService;
import com.jyj.msg.service.ShopLstService;

@Controller
@SessionAttributes("aptinfo")
public class ExcelController {

  @Autowired
  ProductSearchLstService productSearchLstService;
  @Autowired
  ProductAmtSearchLogService productAmtSearchLogService;
  @Autowired
  ShopLstService shopLstService;
  @Autowired
  CodeLstService codeLstService;
  @Autowired
  ProductAmtSearchLstService productAmtSearchLstService;
  @Autowired
  MngShopProductTmpTblService mngShopProductTmpTblService;
  @Autowired
  ExcelService excelService;

	private static final Logger LOGGER = LoggerFactory.getLogger(ExcelController.class);
	

	@RequestMapping(method = RequestMethod.POST,value="/excelDownload")
	public String excelDownload(HttpServletRequest request, Model model) {
	   // log.debug("admin Page Lst");
	    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
	    inDto.setCOLUMNA1(request.getParameter("COL1"));
	    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
	    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
	    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
	    
	    model.addAttribute("list", outDto);
	    model.addAttribute("shopOutDto", shopOutDto);
	    model.addAttribute("codeOutDto", codeOutDto);
	    model.addAttribute("headGb", "2");
	    model.addAttribute("list_size", outDto.size());
	    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
	    
		return "excel/excelDownload";
    }
	
	@RequestMapping(method = RequestMethod.POST,value="/excelUpload")
	public String excelUpload(MultipartHttpServletRequest request, Model model) {
	  LOGGER.debug("admin Page Lst");
	  MultipartFile file = null;
	  Iterator<String> iterator = request.getFileNames();
      if(iterator.hasNext()) {
          file = request.getFile(iterator.next());
      }
      // 엑셀 데이터 정리
      List<MngShopProductTmpTblOutDto> list = excelService.uploadExcelFile(file);
      // 다건 입력 수정 호출
      mngShopProductTmpTblService.createListMngShopProductTmpTbl(list);
      
	  return "redirect:/admin-page-lst";
	}

}
