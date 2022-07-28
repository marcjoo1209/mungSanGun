/**
 * @file CodeLstService.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.service.ExcelService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
**/
@Service
public class ExcelServiceImpl implements ExcelService{
  
  
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

}
