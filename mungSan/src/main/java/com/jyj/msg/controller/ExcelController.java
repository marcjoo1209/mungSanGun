package com.jyj.msg.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jyj.msg.common.CommonUtil;
import com.jyj.msg.controller.dto.CodeLstOutDto;
import com.jyj.msg.controller.dto.FileDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.ProductExcelLstDto;
import com.jyj.msg.controller.dto.ReturnDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.CodeLstService;
import com.jyj.msg.service.ExcelService;
import com.jyj.msg.service.FileService;
import com.jyj.msg.service.MngShopProductTmpTblService;
import com.jyj.msg.service.ProductAmtSearchLogService;
import com.jyj.msg.service.ProductAmtSearchLstService;
import com.jyj.msg.service.ProductSearchLstService;
import com.jyj.msg.service.ShopLstService;

import io.swagger.annotations.ApiOperation;

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
  @Autowired
  FileService fileService;

	private static final Logger LOGGER = LoggerFactory.getLogger(ExcelController.class);
	
	/* 엑셀 다운로드 페이지 이동
	 * 
	 * */
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
	
	/* 엑셀 업로드 후 메인 페이지 이동
	 * */
	@RequestMapping(method = RequestMethod.POST,value="/excelUpload")
	public String excelUpload(MultipartHttpServletRequest request, Model model) {
	  LOGGER.debug("excelUpload");
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

	/* 엑셀 업로드 후 메인 페이지 이동2
	 * 
    @RequestMapping(method = RequestMethod.POST,value="/excelUploadMain")
    public String excelUploadMain(MultipartHttpServletRequest request, Model model) {
      LOGGER.debug("excelUploadMain");
      MultipartFile file = null;
      Iterator<String> iterator = request.getFileNames();
      if(iterator.hasNext()) {
          file = request.getFile(iterator.next());
      }
      // 엑셀 데이터 정리
      List<ExcelLstOutDto> list = excelService.uploadExcelMainFile(file);
      for(int i = 0; i<list.size(); i++) {
        if(list.get(i).getIDX() == null) {
          LOGGER.error("IDX가 null 일 경우 입력 할 수 없습니다.");
          break;
        }
        ProductLstInDto pdlDto = new ProductLstInDto();
        ProductDtlLstInDto plDto1 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto2 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto3 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto4 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto5 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto6 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto7 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto8 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto9 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto10 = new ProductDtlLstInDto();
        ProductDtlLstInDto plDto11 = new ProductDtlLstInDto();
        
        pdlDto.setIDX(list.get(i).getIDX());
        pdlDto.setPRODUCTNM(list.get(i).getPRODUCTNM());
        pdlDto.setIMGURL(list.get(i).getIMGURL());
        pdlDto.setLEADAMT(list.get(i).getLEADAMT());
        pdlDto.setMEMO(list.get(i).getMEMO());

        // 상품 입력
        excelService.createListExcelListTbl(pdlDto);
        
        //////////////////////111111111111111111111111111111/////////////////
        plDto1.setIDX(                  list.get(i).getPdl1PDLIDX());
        if(list.get(i).getPdl1SHOPIDX() == null) {
          plDto1.setSHOPIDX(              "1");
        } else {
          plDto1.setSHOPIDX(              list.get(i).getPdl1SHOPIDX());
        }
        plDto1.setDTLNOMALAMT(          list.get(i).getPdl1DTLNOMALAMT());
        plDto1.setDTLSHIPAMT(           list.get(i).getPdl1DTLSHIPAMT());
        plDto1.setDTLCOMMITIONAMT(      list.get(i).getPdl1DTLCOMMITIONAMT());
        plDto1.setDTLCALCAMT(           list.get(i).getPdl1DTLCALCAMT());
        plDto1.setDTLPAYAMT(            list.get(i).getPdl1DTLPAYAMT());
        plDto1.setDTLINCOMMAMT(         list.get(i).getPdl1DTLINCOMMAMT());
        plDto1.setDTLLOWAMT(            list.get(i).getPdl1DTLLOWAMT());
        plDto1.setDTLPRODUCTLINK(       list.get(i).getPdl1DTLPRODUCTLINK());
        plDto1.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto1);
        //////////////////////222222222222222222222222222/////////////////
        plDto2.setIDX(                  list.get(i).getPdl2PDLIDX());
        if(list.get(i).getPdl2SHOPIDX() == null) {
          plDto2.setSHOPIDX(              "2");
        } else {
          plDto2.setSHOPIDX(              list.get(i).getPdl2SHOPIDX());
        }
        plDto2.setDTLNOMALAMT(          list.get(i).getPdl2DTLNOMALAMT());
        plDto2.setDTLSHIPAMT(           list.get(i).getPdl2DTLSHIPAMT());
        plDto2.setDTLCOMMITIONAMT(      list.get(i).getPdl2DTLCOMMITIONAMT());
        plDto2.setDTLCALCAMT(           list.get(i).getPdl2DTLCALCAMT());
        plDto2.setDTLPAYAMT(            list.get(i).getPdl2DTLPAYAMT());
        plDto2.setDTLINCOMMAMT(         list.get(i).getPdl2DTLINCOMMAMT());
        plDto2.setDTLLOWAMT(            list.get(i).getPdl2DTLLOWAMT());
        plDto2.setDTLPRODUCTLINK(       list.get(i).getPdl2DTLPRODUCTLINK());
        plDto2.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto2);

        //////////////////////33333333333333333333333333333/////////////////
        plDto3.setIDX(                  list.get(i).getPdl3PDLIDX());
        if(list.get(i).getPdl3SHOPIDX() == null) {
          plDto3.setSHOPIDX(              "3");
        } else {
          plDto3.setSHOPIDX(              list.get(i).getPdl3SHOPIDX());
        }
        plDto3.setDTLNOMALAMT(          list.get(i).getPdl3DTLNOMALAMT());
        plDto3.setDTLSHIPAMT(           list.get(i).getPdl3DTLSHIPAMT());
        plDto3.setDTLCOMMITIONAMT(      list.get(i).getPdl3DTLCOMMITIONAMT());
        plDto3.setDTLCALCAMT(           list.get(i).getPdl3DTLCALCAMT());
        plDto3.setDTLPAYAMT(            list.get(i).getPdl3DTLPAYAMT());
        plDto3.setDTLINCOMMAMT(         list.get(i).getPdl3DTLINCOMMAMT());
        plDto3.setDTLLOWAMT(            list.get(i).getPdl3DTLLOWAMT());
        plDto3.setDTLPRODUCTLINK(       list.get(i).getPdl3DTLPRODUCTLINK());
        plDto3.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto3);

        //////////////////////4444444444444444444444444/////////////////
        plDto4.setIDX(                  list.get(i).getPdl4PDLIDX());
        if(list.get(i).getPdl4SHOPIDX() == null) {
          plDto4.setSHOPIDX(              "4");
        } else {
          plDto4.setSHOPIDX(              list.get(i).getPdl4SHOPIDX());
        }
        plDto4.setDTLNOMALAMT(          list.get(i).getPdl4DTLNOMALAMT());
        plDto4.setDTLSHIPAMT(           list.get(i).getPdl4DTLSHIPAMT());
        plDto4.setDTLCOMMITIONAMT(      list.get(i).getPdl4DTLCOMMITIONAMT());
        plDto4.setDTLCALCAMT(           list.get(i).getPdl4DTLCALCAMT());
        plDto4.setDTLPAYAMT(            list.get(i).getPdl4DTLPAYAMT());
        plDto4.setDTLINCOMMAMT(         list.get(i).getPdl4DTLINCOMMAMT());
        plDto4.setDTLLOWAMT(            list.get(i).getPdl4DTLLOWAMT());
        plDto4.setDTLPRODUCTLINK(       list.get(i).getPdl4DTLPRODUCTLINK());
        plDto4.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto4);

        //////////////////////5555555555555555555/////////////////
        plDto5.setIDX(                  list.get(i).getPdl5PDLIDX());
        if(list.get(i).getPdl5SHOPIDX() == null) {
          plDto5.setSHOPIDX(              "5");
        } else {
          plDto5.setSHOPIDX(              list.get(i).getPdl5SHOPIDX());
        }
        plDto5.setDTLNOMALAMT(          list.get(i).getPdl5DTLNOMALAMT());
        plDto5.setDTLSHIPAMT(           list.get(i).getPdl5DTLSHIPAMT());
        plDto5.setDTLCOMMITIONAMT(      list.get(i).getPdl5DTLCOMMITIONAMT());
        plDto5.setDTLCALCAMT(           list.get(i).getPdl5DTLCALCAMT());
        plDto5.setDTLPAYAMT(            list.get(i).getPdl5DTLPAYAMT());
        plDto5.setDTLINCOMMAMT(         list.get(i).getPdl5DTLINCOMMAMT());
        plDto5.setDTLLOWAMT(            list.get(i).getPdl5DTLLOWAMT());
        plDto5.setDTLPRODUCTLINK(       list.get(i).getPdl5DTLPRODUCTLINK());
        plDto5.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto5);

        //////////////////////66666666666666666666/////////////////
        plDto6.setIDX(                  list.get(i).getPdl6PDLIDX());
        if(list.get(i).getPdl6SHOPIDX() == null) {
          plDto6.setSHOPIDX(              "6");
        } else {
          plDto6.setSHOPIDX(              list.get(i).getPdl6SHOPIDX());
        }
        plDto6.setDTLNOMALAMT(          list.get(i).getPdl6DTLNOMALAMT());
        plDto6.setDTLSHIPAMT(           list.get(i).getPdl6DTLSHIPAMT());
        plDto6.setDTLCOMMITIONAMT(      list.get(i).getPdl6DTLCOMMITIONAMT());
        plDto6.setDTLCALCAMT(           list.get(i).getPdl6DTLCALCAMT());
        plDto6.setDTLPAYAMT(            list.get(i).getPdl6DTLPAYAMT());
        plDto6.setDTLINCOMMAMT(         list.get(i).getPdl6DTLINCOMMAMT());
        plDto6.setDTLLOWAMT(            list.get(i).getPdl6DTLLOWAMT());
        plDto6.setDTLPRODUCTLINK(       list.get(i).getPdl6DTLPRODUCTLINK());
        plDto6.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto6);

        //////////////////////77777777777777777777777777/////////////////
        plDto7.setIDX(                  list.get(i).getPdl7PDLIDX());
        if(list.get(i).getPdl7SHOPIDX() == null) {
          plDto7.setSHOPIDX(              "7");
        } else {
          plDto7.setSHOPIDX(              list.get(i).getPdl7SHOPIDX());
        }
        plDto7.setDTLNOMALAMT(          list.get(i).getPdl7DTLNOMALAMT());
        plDto7.setDTLSHIPAMT(           list.get(i).getPdl7DTLSHIPAMT());
        plDto7.setDTLCOMMITIONAMT(      list.get(i).getPdl7DTLCOMMITIONAMT());
        plDto7.setDTLCALCAMT(           list.get(i).getPdl7DTLCALCAMT());
        plDto7.setDTLPAYAMT(            list.get(i).getPdl7DTLPAYAMT());
        plDto7.setDTLINCOMMAMT(         list.get(i).getPdl7DTLINCOMMAMT());
        plDto7.setDTLLOWAMT(            list.get(i).getPdl7DTLLOWAMT());
        plDto7.setDTLPRODUCTLINK(       list.get(i).getPdl7DTLPRODUCTLINK());
        plDto7.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto7);

        //////////////////////888888888888888888888/////////////////
        plDto8.setIDX(                  list.get(i).getPdl8PDLIDX());
        if(list.get(i).getPdl8SHOPIDX() == null) {
          plDto8.setSHOPIDX(              "8");
        } else {
          plDto8.setSHOPIDX(              list.get(i).getPdl8SHOPIDX());
        }
        plDto8.setDTLNOMALAMT(          list.get(i).getPdl8DTLNOMALAMT());
        plDto8.setDTLSHIPAMT(           list.get(i).getPdl8DTLSHIPAMT());
        plDto8.setDTLCOMMITIONAMT(      list.get(i).getPdl8DTLCOMMITIONAMT());
        plDto8.setDTLCALCAMT(           list.get(i).getPdl8DTLCALCAMT());
        plDto8.setDTLPAYAMT(            list.get(i).getPdl8DTLPAYAMT());
        plDto8.setDTLINCOMMAMT(         list.get(i).getPdl8DTLINCOMMAMT());
        plDto8.setDTLLOWAMT(            list.get(i).getPdl8DTLLOWAMT());
        plDto8.setDTLPRODUCTLINK(       list.get(i).getPdl8DTLPRODUCTLINK());
        plDto8.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto8);

        //////////////////////99999999999999999999/////////////////
        plDto9.setIDX(                  list.get(i).getPdl9PDLIDX());
        if(list.get(i).getPdl9SHOPIDX() == null) {
          plDto9.setSHOPIDX(              "9");
        } else {
          plDto9.setSHOPIDX(              list.get(i).getPdl9SHOPIDX());
        }
        plDto9.setDTLNOMALAMT(          list.get(i).getPdl9DTLNOMALAMT());
        plDto9.setDTLSHIPAMT(           list.get(i).getPdl9DTLSHIPAMT());
        plDto9.setDTLCOMMITIONAMT(      list.get(i).getPdl9DTLCOMMITIONAMT());
        plDto9.setDTLCALCAMT(           list.get(i).getPdl9DTLCALCAMT());
        plDto9.setDTLPAYAMT(            list.get(i).getPdl9DTLPAYAMT());
        plDto9.setDTLINCOMMAMT(         list.get(i).getPdl9DTLINCOMMAMT());
        plDto9.setDTLLOWAMT(            list.get(i).getPdl9DTLLOWAMT());
        plDto9.setDTLPRODUCTLINK(       list.get(i).getPdl9DTLPRODUCTLINK());
        plDto9.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto9);

        //////////////////////1010101001010101010/////////////////
        plDto10.setIDX(                  list.get(i).getPdl10PDLIDX());
        if(list.get(i).getPdl10SHOPIDX() == null) {
          plDto10.setSHOPIDX(              "10");
        } else {
          plDto10.setSHOPIDX(              list.get(i).getPdl10SHOPIDX());
        }
        plDto10.setDTLNOMALAMT(          list.get(i).getPdl10DTLNOMALAMT());
        plDto10.setDTLSHIPAMT(           list.get(i).getPdl10DTLSHIPAMT());
        plDto10.setDTLCOMMITIONAMT(      list.get(i).getPdl10DTLCOMMITIONAMT());
        plDto10.setDTLCALCAMT(           list.get(i).getPdl10DTLCALCAMT());
        plDto10.setDTLPAYAMT(            list.get(i).getPdl10DTLPAYAMT());
        plDto10.setDTLINCOMMAMT(         list.get(i).getPdl10DTLINCOMMAMT());
        plDto10.setDTLLOWAMT(            list.get(i).getPdl10DTLLOWAMT());
        plDto10.setDTLPRODUCTLINK(       list.get(i).getPdl10DTLPRODUCTLINK());
        plDto10.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto10);

        //////////////////////1111111111111111111111111/////////////////
        plDto11.setIDX(                  list.get(i).getPdl11PDLIDX());
        if(list.get(i).getPdl11SHOPIDX() == null) {
          plDto11.setSHOPIDX(              "11");
        } else {
          plDto11.setSHOPIDX(              list.get(i).getPdl11SHOPIDX());
        }
        plDto11.setDTLNOMALAMT(          list.get(i).getPdl11DTLNOMALAMT());
        plDto11.setDTLSHIPAMT(           list.get(i).getPdl11DTLSHIPAMT());
        plDto11.setDTLCOMMITIONAMT(      list.get(i).getPdl11DTLCOMMITIONAMT());
        plDto11.setDTLCALCAMT(           list.get(i).getPdl11DTLCALCAMT());
        plDto11.setDTLPAYAMT(            list.get(i).getPdl11DTLPAYAMT());
        plDto11.setDTLINCOMMAMT(         list.get(i).getPdl11DTLINCOMMAMT());
        plDto11.setDTLLOWAMT(            list.get(i).getPdl11DTLLOWAMT());
        plDto11.setDTLPRODUCTLINK(       list.get(i).getPdl11DTLPRODUCTLINK());
        plDto11.setPRODUCTIDX(           list.get(i).getIDX());

        // 상품 상세 입력
        excelService.createListExcelDtlListTbl(plDto11);

      }
      return "redirect:/admin-page-lst-main";
    }
    */

	/* 엑셀 업로드 후 메인 페이지 이동2
	 * 
	 */
    @RequestMapping(method = RequestMethod.POST,value="/excelUploadMain")
    public String excelUploadMain(MultipartFile myFile, MultipartHttpServletRequest request, Model model) {
    	LOGGER.info("===================== orgFile =====================[" + myFile.getOriginalFilename() + "]");
    	FileDto fd = new FileDto();
    	FileDto targetFd = new FileDto();
    	
    	fd.setORGFILENAME(myFile.getOriginalFilename());
    	String newFileName = "";
    	try {
    		newFileName = CommonUtil.saveFile(request, myFile);
    		fd.setFILENAME(newFileName);
    		
    		/* 기존 파일 삭제 후 입력 한다. */
    		fileService.modifyDelFile();
    		fileService.createFile(fd);

    		// update
    		fileService.modifyStandByFile();
    		// search
    		targetFd = fileService.getOneFile();
    		// excel file insert proc
    		targetFd.getFILENAME();
    		// 1000Row check
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return "redirect:/admin-page-lst-main";
    }
    

    @RequestMapping(value="/get-count-product-lst", method=RequestMethod.POST)
    @ApiOperation(value = "전 상품 조회 후 json 데이터 리턴", notes="전 상품 조회 후 json 데이터 리턴")
    @ResponseBody
    public List<ProductExcelLstDto> getCountProductLst(@RequestBody Map<String, Object> data) throws IOException, SQLException {
  	  System.out.println("/get-count-product-lst 호출 시작");

  	  List<ProductExcelLstDto> outDto = excelService.getCountProductLst();

  	  if(outDto == null) {
  		  outDto = new ArrayList<>();
  	  }

  	  return outDto;
    }

    @RequestMapping(value="/get-count-product-lst-file", method=RequestMethod.POST)
    @ApiOperation(value = "전 상품 조회 후 dat 파일 리턴", notes="전 상품 조회 후 dat 파일 리턴")
    @ResponseBody
    public ReturnDto getCountProductLstFile(@RequestBody Map<String, Object> data, HttpServletRequest request) throws IOException, SQLException {
  	  System.out.println("/get-count-product-lst-file 호출 시작");

  	  ReturnDto outDto = excelService.getCountProductLstFile(request);

  	  if(outDto == null) {
  		  outDto = new ReturnDto();
  	  }

  	  return outDto;
    }

    @RequestMapping(value="/get-search-file", method=RequestMethod.POST)
    @ApiOperation(value = "생성된 dat 파일 다운로드", notes="생성된 dat 파일 다운로드")
    public ReturnDto getSearchFile(@RequestBody Map<String, Object> data, HttpServletRequest request) throws IOException, SQLException {
  	  System.out.println("/get-search-file 호출 시작");

  	  ReturnDto outDto = excelService.getCountProductLstFile(request);

  	  if(outDto == null) {
  		  outDto = new ReturnDto();
  	  }

  	  return outDto;
    }
}
