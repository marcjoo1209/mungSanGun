/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.jyj.msg.common.CommonUtil;
import com.jyj.msg.controller.dto.ExcelLstOutDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductLstOutDto;
import com.jyj.msg.dao.ExcelDao;
import com.jyj.msg.dao.ProductLstDao;
import com.jyj.msg.service.ExcelService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Service
public class ExcelServiceImpl implements ExcelService{

  @Autowired
  ExcelDao excelMapper;

  public List<MngShopProductTmpTblOutDto> uploadExcelFile(MultipartFile excelFile) {
    // 참고
    //https://bono915.tistory.com/entry/SpringBoot-%EC%97%91%EC%85%80Excel-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C-%EB%B0%A9%EB%B2%95poi-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC 
    
    List<MngShopProductTmpTblOutDto> list = new ArrayList<MngShopProductTmpTblOutDto>();
    DataFormatter formatter = new DataFormatter();

    try {
      OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
      XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
      
      // 첫 시트 불러오기
      XSSFSheet sheet = workbook.getSheetAt(0);
      
      for(int i = 1; i<sheet.getLastRowNum()+1; i++) {

        MngShopProductTmpTblOutDto outDto = new MngShopProductTmpTblOutDto();
        XSSFRow row = sheet.getRow(i);
        
        // 행이 존존재지 않으면 패스
        if(null == row) {
          continue;
        }

        // 행의 첫번째 열(이름부터 받아오기) 
        XSSFCell cell = row.getCell(0);
        String s = "";
        
        s = formatter.formatCellValue(row.getCell(0));
        if(null != cell) outDto.setDIDX(s);
        
        // 행의 두번째 열 받아오기 
        cell = row.getCell(1);
        s = formatter.formatCellValue(row.getCell(1));
        if(null != cell) outDto.setCOLUMNA1(s);
        
        // 행의 세번째 열 받아오기
        cell = row.getCell(2);
        s = formatter.formatCellValue(row.getCell(2));
        if(null != cell) outDto.setCOLUMNA2(s);
        
        // 행의 네번째 열 받아오기
        cell = row.getCell(3);
        s = formatter.formatCellValue(row.getCell(3));
        if(null != cell) outDto.setCOLUMNA3(s);
        
        // 행의 5번째 열 받아오기
        cell = row.getCell(4);
        s = formatter.formatCellValue(row.getCell(4));
        if(null != cell) outDto.setCOLUMNA4(s);
        
        // 행의 6번째 열 받아오기
        cell = row.getCell(5);
        s = formatter.formatCellValue(row.getCell(5));
        if(null != cell) outDto.setCOLUMNA5(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(6);
        s = formatter.formatCellValue(row.getCell(6));
        if(null != cell) outDto.setCOLUMNA6(s);
        // 행의 8번째 열 받아오기
        cell = row.getCell(7);
        s = formatter.formatCellValue(row.getCell(7));
        if(null != cell) outDto.setCOLUMNA7(s);
        // 행의 9번째 열 받아오기
        cell = row.getCell(8);
        s = formatter.formatCellValue(row.getCell(8));
        if(null != cell) outDto.setCOLUMNA8(s);
        // 행의 10번째 열 받아오기
        cell = row.getCell(9);
        s = formatter.formatCellValue(row.getCell(9));
        if(null != cell) outDto.setCOLUMNA9(s);
        // 행의 11번째 열 받아오기
        cell = row.getCell(10);
        s = formatter.formatCellValue(row.getCell(10));
        if(null != cell) outDto.setCOLUMNB1(s);
        // 행의 12번째 열 받아오기
        cell = row.getCell(11);
        s = formatter.formatCellValue(row.getCell(11));
        if(null != cell) outDto.setCOLUMNB2(s);
        // 행의 13번째 열 받아오기
        cell = row.getCell(12);
        s = formatter.formatCellValue(row.getCell(12));
        if(null != cell) outDto.setCOLUMNB3(s);
        // 행의 14번째 열 받아오기
        cell = row.getCell(13);
        s = formatter.formatCellValue(row.getCell(13));
        if(null != cell) outDto.setCOLUMNB4(s);
        // 행의 15번째 열 받아오기
        cell = row.getCell(14);
        s = formatter.formatCellValue(row.getCell(14));
        if(null != cell) outDto.setCOLUMNB5(s);
        // 행의 16번째 열 받아오기
        cell = row.getCell(15);
        s = formatter.formatCellValue(row.getCell(15));
        if(null != cell) outDto.setCOLUMNB6(s);
        // 행의 17번째 열 받아오기
        cell = row.getCell(16);
        s = formatter.formatCellValue(row.getCell(16));
        if(null != cell) outDto.setCOLUMNB7(s);
        // 행의 18번째 열 받아오기
        cell = row.getCell(17);
        s = formatter.formatCellValue(row.getCell(17));
        if(null != cell) outDto.setCOLUMNB8(s);
        // 행의 19번째 열 받아오기
        cell = row.getCell(18);
        s = formatter.formatCellValue(row.getCell(18));
        if(null != cell) outDto.setCOLUMNB9(s);
        // 행의 20번째 열 받아오기
        cell = row.getCell(19);
        s = formatter.formatCellValue(row.getCell(19));
        if(null != cell) outDto.setCOLUMNC1(s);
        // 행의 21번째 열 받아오기
        cell = row.getCell(20);
        s = formatter.formatCellValue(row.getCell(20));
        if(null != cell) outDto.setCOLUMNC2(s);
        // 행의 22번째 열 받아오기
        cell = row.getCell(21);
        s = formatter.formatCellValue(row.getCell(21));
        if(null != cell) outDto.setCOLUMNC3(s);
        // 행의 23번째 열 받아오기
        cell = row.getCell(22);
        s = formatter.formatCellValue(row.getCell(22));
        if(null != cell) outDto.setCOLUMNC4(s);
        // 행의 24번째 열 받아오기
        cell = row.getCell(23);
        s = formatter.formatCellValue(row.getCell(23));
        if(null != cell) outDto.setCOLUMNC5(s);
        // 행의 25번째 열 받아오기
        cell = row.getCell(24);
        s = formatter.formatCellValue(row.getCell(24));
        if(null != cell) outDto.setCOLUMNC6(s);
        // 행의 26번째 열 받아오기
        cell = row.getCell(25);
        s = formatter.formatCellValue(row.getCell(25));
        if(null != cell) outDto.setCOLUMNC7(s);
        // 행의 27번째 열 받아오기
        cell = row.getCell(26);
        s = formatter.formatCellValue(row.getCell(26));
        if(null != cell) outDto.setCOLUMNC8(s);
        // 행의 28번째 열 받아오기
        cell = row.getCell(27);
        s = formatter.formatCellValue(row.getCell(27));
        if(null != cell) outDto.setCOLUMNC9(s);
        // 행의 29번째 열 받아오기
        cell = row.getCell(28);
        s = formatter.formatCellValue(row.getCell(28));
        if(null != cell) outDto.setCOLUMND1(s);
        // 행의 30번째 열 받아오기
        cell = row.getCell(29);
        s = formatter.formatCellValue(row.getCell(29));
        if(null != cell) outDto.setCOLUMND2(s);
        // 행의 31번째 열 받아오기
        cell = row.getCell(30);
        s = formatter.formatCellValue(row.getCell(30));
        if(null != cell) outDto.setCOLUMND3(s);
        // 행의 32번째 열 받아오기
        cell = row.getCell(31);
        s = formatter.formatCellValue(row.getCell(31));
        if(null != cell) outDto.setCOLUMND4(s);
        // 행의 33번째 열 받아오기
        cell = row.getCell(32);
        s = formatter.formatCellValue(row.getCell(32));
        if(null != cell) outDto.setCOLUMND5(s);
        // 행의 34번째 열 받아오기
        cell = row.getCell(33);
        s = formatter.formatCellValue(row.getCell(33));
        if(null != cell) outDto.setCOLUMND6(s);
        
        list.add(outDto);
      }
      
    } catch(Exception e) {
      e.printStackTrace();
    }
    return list;
  }
                
      /*
      // 2번째 행 부터 list에 담기
      for(int i=1; i<sheet.getLastRowNum() + 1; i++) {
          MngShopProductTmpTblOutDto outDto = new MngShopProductTmpTblOutDto();
          XSSFRow row = sheet.getRow(i);
          
          // 행이 존재하기 않으면 패스
          if(null == row) {
              continue;
          }

          // 행의 첫번째 열(이름부터 받아오기) 
          XSSFCell cell = row.getCell(0);
          if(null != cell) outDto.setDIDX(cell.getStringCellValue());
          // 행의 두번째 열 받아오기 
          cell = row.getCell(1);
          if(null != cell) outDto.setCOLUMNA1(cell.getStringCellValue());
          // 행의 세번째 열 받아오기
          cell = row.getCell(2);
          if(null != cell) outDto.setCOLUMNA2(cell.getStringCellValue());
          // 행의 네번째 열 받아오기
          cell = row.getCell(3);
          if(null != cell) outDto.setCOLUMNA3(cell.getStringCellValue());
          // 행의 5번째 열 받아오기
          cell = row.getCell(4);
          if(null != cell) outDto.setCOLUMNA4(cell.getStringCellValue());
          // 행의 6번째 열 받아오기
          cell = row.getCell(5);
          if(null != cell) outDto.setCOLUMNA5(cell.getStringCellValue());
          // 행의 7번째 열 받아오기
          cell = row.getCell(6);
          if(null != cell) outDto.setCOLUMNA6(cell.getStringCellValue());
          // 행의 8번째 열 받아오기
          cell = row.getCell(7);
          if(null != cell) outDto.setCOLUMNA7(cell.getStringCellValue());
          // 행의 9번째 열 받아오기
          cell = row.getCell(8);
          if(null != cell) outDto.setCOLUMNA8(cell.getStringCellValue());
          // 행의 10번째 열 받아오기
          cell = row.getCell(9);
          if(null != cell) outDto.setCOLUMNA9(cell.getStringCellValue());
          // 행의 11번째 열 받아오기
          cell = row.getCell(10);
          if(null != cell) outDto.setCOLUMNB1(cell.getStringCellValue());
          // 행의 12번째 열 받아오기
          cell = row.getCell(11);
          if(null != cell) outDto.setCOLUMNB2(cell.getStringCellValue());
          // 행의 13번째 열 받아오기
          cell = row.getCell(12);
          if(null != cell) outDto.setCOLUMNB3(cell.getStringCellValue());
          // 행의 14번째 열 받아오기
          cell = row.getCell(13);
          if(null != cell) outDto.setCOLUMNB4(cell.getStringCellValue());
          // 행의 15번째 열 받아오기
          cell = row.getCell(14);
          if(null != cell) outDto.setCOLUMNB5(cell.getStringCellValue());
          // 행의 16번째 열 받아오기
          cell = row.getCell(15);
          if(null != cell) outDto.setCOLUMNB6(cell.getStringCellValue());
          // 행의 17번째 열 받아오기
          cell = row.getCell(16);
          if(null != cell) outDto.setCOLUMNB7(cell.getStringCellValue());
          // 행의 18번째 열 받아오기
          cell = row.getCell(17);
          if(null != cell) outDto.setCOLUMNB8(cell.getStringCellValue());
          // 행의 19번째 열 받아오기
          cell = row.getCell(18);
          if(null != cell) outDto.setCOLUMNB9(cell.getStringCellValue());
          // 행의 20번째 열 받아오기
          cell = row.getCell(19);
          if(null != cell) outDto.setCOLUMNC1(cell.getStringCellValue());
          // 행의 21번째 열 받아오기
          cell = row.getCell(20);
          if(null != cell) outDto.setCOLUMNC2(cell.getStringCellValue());
          // 행의 22번째 열 받아오기
          cell = row.getCell(21);
          if(null != cell) outDto.setCOLUMNC3(cell.getStringCellValue());
          // 행의 23번째 열 받아오기
          cell = row.getCell(22);
          if(null != cell) outDto.setCOLUMNC4(cell.getStringCellValue());
          // 행의 24번째 열 받아오기
          cell = row.getCell(23);
          if(null != cell) outDto.setCOLUMNC5(cell.getStringCellValue());
          // 행의 25번째 열 받아오기
          cell = row.getCell(24);
          if(null != cell) outDto.setCOLUMNC6(cell.getStringCellValue());
          // 행의 26번째 열 받아오기
          cell = row.getCell(25);
          if(null != cell) outDto.setCOLUMNC7(cell.getStringCellValue());
          // 행의 27번째 열 받아오기
          cell = row.getCell(26);
          if(null != cell) outDto.setCOLUMNC8(cell.getStringCellValue());
          // 행의 28번째 열 받아오기
          cell = row.getCell(27);
          if(null != cell) outDto.setCOLUMNC9(cell.getStringCellValue());
          // 행의 29번째 열 받아오기
          cell = row.getCell(28);
          if(null != cell) outDto.setCOLUMND1(cell.getStringCellValue());
          // 행의 30번째 열 받아오기
          cell = row.getCell(29);
          if(null != cell) outDto.setCOLUMND2(cell.getStringCellValue());
          // 행의 31번째 열 받아오기
          cell = row.getCell(30);
          if(null != cell) outDto.setCOLUMND3(cell.getStringCellValue());
          // 행의 32번째 열 받아오기
          cell = row.getCell(31);
          if(null != cell) outDto.setCOLUMND4(cell.getStringCellValue());
          // 행의 33번째 열 받아오기
          cell = row.getCell(32);
          if(null != cell) outDto.setCOLUMND5(cell.getStringCellValue());
          // 행의 34번째 열 받아오기
          cell = row.getCell(33);
          if(null != cell) outDto.setCOLUMND6(cell.getStringCellValue());
          
          list.add(outDto);
      }
      */

  public List<ExcelLstOutDto> getListExcelLst() {
    return excelMapper.getListExcelLst();
  }

  public List<ExcelLstOutDto> uploadExcelMainFile(MultipartFile excelFile) {
    // 참고
    //https://bono915.tistory.com/entry/SpringBoot-%EC%97%91%EC%85%80Excel-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C-%EB%B0%A9%EB%B2%95poi-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC 
    
    List<ExcelLstOutDto> list = new ArrayList<ExcelLstOutDto>();
    DataFormatter formatter = new DataFormatter();

    try {
      OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
      XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
      
      // 첫 시트 불러오기
      XSSFSheet sheet = workbook.getSheetAt(0);
      
      for(int i = 1; i<sheet.getLastRowNum()+1; i++) {

        ExcelLstOutDto outDto = new ExcelLstOutDto();
        XSSFRow row = sheet.getRow(i);
        
        // 행이 존존재지 않으면 패스
        if(null == row) {
          continue;
        }

        // 행의 첫번째 열(이름부터 받아오기) 
        XSSFCell cell = row.getCell(0);
        String s = "";
        
        s = formatter.formatCellValue(row.getCell(0));
        if(null != cell) outDto.setIDX(s);
        
        // 행의 두번째 열 받아오기 
        cell = row.getCell(1);
        s = formatter.formatCellValue(row.getCell(1));
        if(null != cell) outDto.setPRODUCTNM(s);
        
        // 행의 세번째 열 받아오기
        cell = row.getCell(2);
        s = formatter.formatCellValue(row.getCell(2));
        if(null != cell) outDto.setIMGURL(s);
        
        // 행의 네번째 열 받아오기
        cell = row.getCell(3);
        s = formatter.formatCellValue(row.getCell(3));
        if(null != cell) outDto.setLEADAMT(s);
        
        // 행의 5번째 열 받아오기
        cell = row.getCell(4);
        s = formatter.formatCellValue(row.getCell(4));
        if(null != cell) outDto.setMEMO(s);
        
        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(5);
        s = formatter.formatCellValue(row.getCell(5));
        if(null != cell) outDto.setPdl1PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(6);
        s = formatter.formatCellValue(row.getCell(6));
        if(null != cell) outDto.setPdl1SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(7);
        s = formatter.formatCellValue(row.getCell(7));
        if(null != cell) outDto.setPdl1SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(8);
        s = formatter.formatCellValue(row.getCell(8));
        if(null != cell) outDto.setPdl1DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(9);
        s = formatter.formatCellValue(row.getCell(9));
        if(null != cell) outDto.setPdl1DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(10);
        s = formatter.formatCellValue(row.getCell(10));
        if(null != cell) outDto.setPdl1DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(11);
        s = formatter.formatCellValue(row.getCell(11));
        if(null != cell) outDto.setPdl1DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(12);
        s = formatter.formatCellValue(row.getCell(12));
        if(null != cell) outDto.setPdl1DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(13);
        s = formatter.formatCellValue(row.getCell(13));
        if(null != cell) outDto.setPdl1DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(14);
        s = formatter.formatCellValue(row.getCell(14));
        if(null != cell) outDto.setPdl1DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(15);
        s = formatter.formatCellValue(row.getCell(15));
        if(null != cell) outDto.setPdl1DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(16);
        s = formatter.formatCellValue(row.getCell(16));
        if(null != cell) outDto.setPdl2PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(17);
        s = formatter.formatCellValue(row.getCell(17));
        if(null != cell) outDto.setPdl2SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(18);
        s = formatter.formatCellValue(row.getCell(18));
        if(null != cell) outDto.setPdl2SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(19);
        s = formatter.formatCellValue(row.getCell(19));
        if(null != cell) outDto.setPdl2DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(20);
        s = formatter.formatCellValue(row.getCell(20));
        if(null != cell) outDto.setPdl2DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(21);
        s = formatter.formatCellValue(row.getCell(21));
        if(null != cell) outDto.setPdl2DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(22);
        s = formatter.formatCellValue(row.getCell(22));
        if(null != cell) outDto.setPdl2DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(23);
        s = formatter.formatCellValue(row.getCell(23));
        if(null != cell) outDto.setPdl2DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(24);
        s = formatter.formatCellValue(row.getCell(24));
        if(null != cell) outDto.setPdl2DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(25);
        s = formatter.formatCellValue(row.getCell(25));
        if(null != cell) outDto.setPdl2DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(26);
        s = formatter.formatCellValue(row.getCell(26));
        if(null != cell) outDto.setPdl2DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(27);
        s = formatter.formatCellValue(row.getCell(27));
        if(null != cell) outDto.setPdl3PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(28);
        s = formatter.formatCellValue(row.getCell(28));
        if(null != cell) outDto.setPdl3SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(29);
        s = formatter.formatCellValue(row.getCell(29));
        if(null != cell) outDto.setPdl3SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(30);
        s = formatter.formatCellValue(row.getCell(30));
        if(null != cell) outDto.setPdl3DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(31);
        s = formatter.formatCellValue(row.getCell(31));
        if(null != cell) outDto.setPdl3DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(32);
        s = formatter.formatCellValue(row.getCell(32));
        if(null != cell) outDto.setPdl3DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(33);
        s = formatter.formatCellValue(row.getCell(33));
        if(null != cell) outDto.setPdl3DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(34);
        s = formatter.formatCellValue(row.getCell(34));
        if(null != cell) outDto.setPdl3DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(35);
        s = formatter.formatCellValue(row.getCell(35));
        if(null != cell) outDto.setPdl3DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(36);
        s = formatter.formatCellValue(row.getCell(36));
        if(null != cell) outDto.setPdl3DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(37);
        s = formatter.formatCellValue(row.getCell(37));
        if(null != cell) outDto.setPdl3DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(38);
        s = formatter.formatCellValue(row.getCell(38));
        if(null != cell) outDto.setPdl4PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(39);
        s = formatter.formatCellValue(row.getCell(39));
        if(null != cell) outDto.setPdl4SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(40);
        s = formatter.formatCellValue(row.getCell(40));
        if(null != cell) outDto.setPdl4SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(41);
        s = formatter.formatCellValue(row.getCell(41));
        if(null != cell) outDto.setPdl4DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(42);
        s = formatter.formatCellValue(row.getCell(42));
        if(null != cell) outDto.setPdl4DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(43);
        s = formatter.formatCellValue(row.getCell(43));
        if(null != cell) outDto.setPdl4DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(44);
        s = formatter.formatCellValue(row.getCell(44));
        if(null != cell) outDto.setPdl4DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(45);
        s = formatter.formatCellValue(row.getCell(45));
        if(null != cell) outDto.setPdl4DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(46);
        s = formatter.formatCellValue(row.getCell(46));
        if(null != cell) outDto.setPdl4DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(47);
        s = formatter.formatCellValue(row.getCell(47));
        if(null != cell) outDto.setPdl4DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(48);
        s = formatter.formatCellValue(row.getCell(48));
        if(null != cell) outDto.setPdl4DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(49);
        s = formatter.formatCellValue(row.getCell(49));
        if(null != cell) outDto.setPdl5PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(50);
        s = formatter.formatCellValue(row.getCell(50));
        if(null != cell) outDto.setPdl5SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(51);
        s = formatter.formatCellValue(row.getCell(51));
        if(null != cell) outDto.setPdl5SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(52);
        s = formatter.formatCellValue(row.getCell(52));
        if(null != cell) outDto.setPdl5DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(53);
        s = formatter.formatCellValue(row.getCell(53));
        if(null != cell) outDto.setPdl5DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(54);
        s = formatter.formatCellValue(row.getCell(54));
        if(null != cell) outDto.setPdl5DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(55);
        s = formatter.formatCellValue(row.getCell(55));
        if(null != cell) outDto.setPdl5DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(56);
        s = formatter.formatCellValue(row.getCell(56));
        if(null != cell) outDto.setPdl5DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(57);
        s = formatter.formatCellValue(row.getCell(57));
        if(null != cell) outDto.setPdl5DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(58);
        s = formatter.formatCellValue(row.getCell(58));
        if(null != cell) outDto.setPdl5DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(59);
        s = formatter.formatCellValue(row.getCell(59));
        if(null != cell) outDto.setPdl5DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(60);
        s = formatter.formatCellValue(row.getCell(60));
        if(null != cell) outDto.setPdl6PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(61);
        s = formatter.formatCellValue(row.getCell(61));
        if(null != cell) outDto.setPdl6SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(62);
        s = formatter.formatCellValue(row.getCell(62));
        if(null != cell) outDto.setPdl6SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(63);
        s = formatter.formatCellValue(row.getCell(63));
        if(null != cell) outDto.setPdl6DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(64);
        s = formatter.formatCellValue(row.getCell(64));
        if(null != cell) outDto.setPdl6DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(65);
        s = formatter.formatCellValue(row.getCell(65));
        if(null != cell) outDto.setPdl6DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(66);
        s = formatter.formatCellValue(row.getCell(66));
        if(null != cell) outDto.setPdl6DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(67);
        s = formatter.formatCellValue(row.getCell(67));
        if(null != cell) outDto.setPdl6DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(68);
        s = formatter.formatCellValue(row.getCell(68));
        if(null != cell) outDto.setPdl6DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(69);
        s = formatter.formatCellValue(row.getCell(69));
        if(null != cell) outDto.setPdl6DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(70);
        s = formatter.formatCellValue(row.getCell(70));
        if(null != cell) outDto.setPdl6DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(71);
        s = formatter.formatCellValue(row.getCell(71));
        if(null != cell) outDto.setPdl7PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(72);
        s = formatter.formatCellValue(row.getCell(72));
        if(null != cell) outDto.setPdl7SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(73);
        s = formatter.formatCellValue(row.getCell(73));
        if(null != cell) outDto.setPdl7SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(74);
        s = formatter.formatCellValue(row.getCell(74));
        if(null != cell) outDto.setPdl7DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(75);
        s = formatter.formatCellValue(row.getCell(75));
        if(null != cell) outDto.setPdl7DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(76);
        s = formatter.formatCellValue(row.getCell(76));
        if(null != cell) outDto.setPdl7DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(77);
        s = formatter.formatCellValue(row.getCell(77));
        if(null != cell) outDto.setPdl7DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(78);
        s = formatter.formatCellValue(row.getCell(78));
        if(null != cell) outDto.setPdl7DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(79);
        s = formatter.formatCellValue(row.getCell(79));
        if(null != cell) outDto.setPdl7DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(80);
        s = formatter.formatCellValue(row.getCell(80));
        if(null != cell) outDto.setPdl7DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(81);
        s = formatter.formatCellValue(row.getCell(81));
        if(null != cell) outDto.setPdl7DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(82);
        s = formatter.formatCellValue(row.getCell(82));
        if(null != cell) outDto.setPdl8PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(83);
        s = formatter.formatCellValue(row.getCell(83));
        if(null != cell) outDto.setPdl8SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(84);
        s = formatter.formatCellValue(row.getCell(84));
        if(null != cell) outDto.setPdl8SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(85);
        s = formatter.formatCellValue(row.getCell(85));
        if(null != cell) outDto.setPdl8DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(86);
        s = formatter.formatCellValue(row.getCell(86));
        if(null != cell) outDto.setPdl8DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(87);
        s = formatter.formatCellValue(row.getCell(87));
        if(null != cell) outDto.setPdl8DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(88);
        s = formatter.formatCellValue(row.getCell(88));
        if(null != cell) outDto.setPdl8DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(89);
        s = formatter.formatCellValue(row.getCell(89));
        if(null != cell) outDto.setPdl8DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(90);
        s = formatter.formatCellValue(row.getCell(90));
        if(null != cell) outDto.setPdl8DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(91);
        s = formatter.formatCellValue(row.getCell(91));
        if(null != cell) outDto.setPdl8DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(92);
        s = formatter.formatCellValue(row.getCell(92));
        if(null != cell) outDto.setPdl8DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(93);
        s = formatter.formatCellValue(row.getCell(93));
        if(null != cell) outDto.setPdl9PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(94);
        s = formatter.formatCellValue(row.getCell(94));
        if(null != cell) outDto.setPdl9SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(95);
        s = formatter.formatCellValue(row.getCell(95));
        if(null != cell) outDto.setPdl9SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(96);
        s = formatter.formatCellValue(row.getCell(96));
        if(null != cell) outDto.setPdl9DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(97);
        s = formatter.formatCellValue(row.getCell(97));
        if(null != cell) outDto.setPdl9DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(98);
        s = formatter.formatCellValue(row.getCell(98));
        if(null != cell) outDto.setPdl9DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(99);
        s = formatter.formatCellValue(row.getCell(99));
        if(null != cell) outDto.setPdl9DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(100);
        s = formatter.formatCellValue(row.getCell(100));
        if(null != cell) outDto.setPdl9DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(101);
        s = formatter.formatCellValue(row.getCell(101));
        if(null != cell) outDto.setPdl9DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(102);
        s = formatter.formatCellValue(row.getCell(102));
        if(null != cell) outDto.setPdl9DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(103);
        s = formatter.formatCellValue(row.getCell(103));
        if(null != cell) outDto.setPdl9DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(104);
        s = formatter.formatCellValue(row.getCell(104));
        if(null != cell) outDto.setPdl10PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(105);
        s = formatter.formatCellValue(row.getCell(105));
        if(null != cell) outDto.setPdl10SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(106);
        s = formatter.formatCellValue(row.getCell(106));
        if(null != cell) outDto.setPdl10SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(107);
        s = formatter.formatCellValue(row.getCell(107));
        if(null != cell) outDto.setPdl10DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(108);
        s = formatter.formatCellValue(row.getCell(108));
        if(null != cell) outDto.setPdl10DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(109);
        s = formatter.formatCellValue(row.getCell(109));
        if(null != cell) outDto.setPdl10DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(110);
        s = formatter.formatCellValue(row.getCell(110));
        if(null != cell) outDto.setPdl10DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(111);
        s = formatter.formatCellValue(row.getCell(111));
        if(null != cell) outDto.setPdl10DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(112);
        s = formatter.formatCellValue(row.getCell(112));
        if(null != cell) outDto.setPdl10DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(113);
        s = formatter.formatCellValue(row.getCell(113));
        if(null != cell) outDto.setPdl10DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(114);
        s = formatter.formatCellValue(row.getCell(114));
        if(null != cell) outDto.setPdl10DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start ***************/
        // 행의 6번째 열 받아오기
        cell = row.getCell(115);
        s = formatter.formatCellValue(row.getCell(115));
        if(null != cell) outDto.setPdl11PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(116);
        s = formatter.formatCellValue(row.getCell(116));
        if(null != cell) outDto.setPdl11SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(117);
        s = formatter.formatCellValue(row.getCell(117));
        if(null != cell) outDto.setPdl11SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(118);
        s = formatter.formatCellValue(row.getCell(118));
        if(null != cell) outDto.setPdl11DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(119);
        s = formatter.formatCellValue(row.getCell(119));
        if(null != cell) outDto.setPdl11DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(120);
        s = formatter.formatCellValue(row.getCell(120));
        if(null != cell) outDto.setPdl11DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(121);
        s = formatter.formatCellValue(row.getCell(121));
        if(null != cell) outDto.setPdl11DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(122);
        s = formatter.formatCellValue(row.getCell(122));
        if(null != cell) outDto.setPdl11DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(123);
        s = formatter.formatCellValue(row.getCell(123));
        if(null != cell) outDto.setPdl11DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(124);
        s = formatter.formatCellValue(row.getCell(124));
        if(null != cell) outDto.setPdl11DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(125);
        s = formatter.formatCellValue(row.getCell(125));
        if(null != cell) outDto.setPdl11DTLPRODUCTLINK(s);
        /***************************************************/

        /********* loop start **************
        // 행의 6번째 열 받아오기
        cell = row.getCell(126);
        s = formatter.formatCellValue(row.getCell(126));
        if(null != cell) outDto.setPdl12PDLIDX(s);
        
        // 행의 7번째 열 받아오기
        cell = row.getCell(127);
        s = formatter.formatCellValue(row.getCell(127));
        if(null != cell) outDto.setPdl12SHOPIDX(s);
        
        // 행의 8번째 열 받아오기
        cell = row.getCell(128);
        s = formatter.formatCellValue(row.getCell(128));
        if(null != cell) outDto.setPdl12SHOPNM(s);
        
        // 행의 9번째 열 받아오기
        cell = row.getCell(129);
        s = formatter.formatCellValue(row.getCell(129));
        if(null != cell) outDto.setPdl12DTLNOMALAMT(s);
        
        // 행의 10번째 열 받아오기
        cell = row.getCell(130);
        s = formatter.formatCellValue(row.getCell(130));
        if(null != cell) outDto.setPdl12DTLSHIPAMT(s);
        
        // 행의 11번째 열 받아오기
        cell = row.getCell(131);
        s = formatter.formatCellValue(row.getCell(131));
        if(null != cell) outDto.setPdl12DTLCOMMITIONAMT(s);
        
        // 행의 12번째 열 받아오기
        cell = row.getCell(132);
        s = formatter.formatCellValue(row.getCell(132));
        if(null != cell) outDto.setPdl12DTLCALCAMT(s);
        
        // 행의 13번째 열 받아오기
        cell = row.getCell(133);
        s = formatter.formatCellValue(row.getCell(133));
        if(null != cell) outDto.setPdl12DTLPAYAMT(s);
        
        // 행의 14번째 열 받아오기
        cell = row.getCell(134);
        s = formatter.formatCellValue(row.getCell(134));
        if(null != cell) outDto.setPdl12DTLINCOMMAMT(s);
        
        // 행의 15번째 열 받아오기
        cell = row.getCell(135);
        s = formatter.formatCellValue(row.getCell(135));
        if(null != cell) outDto.setPdl12DTLLOWAMT(s);
        
        // 행의 16번째 열 받아오기
        cell = row.getCell(136);
        s = formatter.formatCellValue(row.getCell(136));
        if(null != cell) outDto.setPdl12DTLPRODUCTLINK(s);
        /***************************************************/
        
        list.add(outDto);
      }
      
    } catch(Exception e) {
      e.printStackTrace();
    }
    return list;
  }
  
  public int createListExcelListTbl(ProductLstInDto inDto) {
    return excelMapper.createListExcelListTbl(inDto);
  }

  public int createListExcelDtlListTbl(ProductDtlLstInDto inDto) {
    return excelMapper.createListExcelDtlListTbl(inDto);
  } 
}
