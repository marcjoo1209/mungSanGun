/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.controller.dto.CodeLstOutDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.controller.dto.UserPageLstOutDto;
import com.jyj.msg.service.CodeLstService;
import com.jyj.msg.service.MngShopProductTmpTblService;
import com.jyj.msg.service.ProductAmtSearchLogService;
import com.jyj.msg.service.ProductAmtSearchLstService;
import com.jyj.msg.service.ProductSearchLstService;
import com.jyj.msg.service.ShopLstService;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
//@Slf4j
@Controller
@SessionAttributes("aptinfo")
public class MsgMainController {
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
/*
  //@RequestMapping(value = "/")
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt")
  public String mainView(Model model) throws Exception {
   // log.debug("/ 호출 시작");
    List<ProductAmtSearchLstOutDto> outDto = productAmtSearchLstService.getListProductAmtSearchLst();
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();

    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "1");
    
    return "product_amt_manage_page";
  }

  //@RequestMapping(value = "/main", method = RequestMethod.POST)
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt1")
  public String mainPage(Model model) throws Exception {
  //  log.debug("Main Page POST");

    return "redirect:main";
  }
  
  //@RequestMapping(value = "/main", method = RequestMethod.GET)
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt2")
  public String main(Model model) throws Exception {
   // log.debug("Main Page");
    List<ProductSearchLstOutDto> outDto = productSearchLstService.getListProductSearchLst();
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();

    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "1");

    return "main_page";
  }

  //@RequestMapping(value = "/log", method = RequestMethod.POST)
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt3")
  public String logPage(Model model) throws Exception {
  //  log.debug("log Page POST");

    return "redirect:log";
  }
  
  //@RequestMapping(value = "/log", method = RequestMethod.GET)
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt4")
  public String log(Model model) throws Exception {
   // log.debug("log Page");
    List<ProductAmtSearchLogOutDto> outDto = productAmtSearchLogService.getListProductAmtSearchLog();
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    
    return "log_page";
  }
  */
  @RequestMapping(value = "/admin-page-lst")
  public String adminPageLst(Model model, HttpServletRequest request) throws Exception {
   // log.debug("admin Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("list2cnt", outDto.size());
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    
    return "jsp/admin_page_lst";
  }
  
  @RequestMapping(value = "/modifyAdminPage")
  public String modifyAdminPage(Model model, HttpServletRequest request) throws Exception {
   // log.debug("modifyAdminPage");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    String GBCD = request.getParameter("GBCD");
    
    inDto.setDIDX(request.getParameter("DIDX"));
    
    inDto.setCOLUMNA1(request.getParameter("COLUMNA1"));
    inDto.setCOLUMNA2(request.getParameter("COLUMNA2"));
    inDto.setCOLUMNA3(request.getParameter("COLUMNA3"));
    inDto.setCOLUMNA4(request.getParameter("COLUMNA4"));
    inDto.setCOLUMNA5(request.getParameter("COLUMNA5"));
    inDto.setCOLUMNA6(request.getParameter("COLUMNA6"));
    inDto.setCOLUMNA7(request.getParameter("COLUMNA7"));
    inDto.setCOLUMNA8(request.getParameter("COLUMNA8"));
    inDto.setCOLUMNA9(request.getParameter("COLUMNA9"));
    inDto.setCOLUMNB1(request.getParameter("COLUMNB1"));
    inDto.setCOLUMNB2(request.getParameter("COLUMNB2"));
    inDto.setCOLUMNB3(request.getParameter("COLUMNB3"));
    inDto.setCOLUMNB4(request.getParameter("COLUMNB4"));
    inDto.setCOLUMNB5(request.getParameter("COLUMNB5"));
    inDto.setCOLUMNB6(request.getParameter("COLUMNB6"));
    inDto.setCOLUMNB7(request.getParameter("COLUMNB7"));
    inDto.setCOLUMNB8(request.getParameter("COLUMNB8"));
    inDto.setCOLUMNB9(request.getParameter("COLUMNB9"));
    inDto.setCOLUMNC1(request.getParameter("COLUMNC1"));
    inDto.setCOLUMNC2(request.getParameter("COLUMNC2"));
    inDto.setCOLUMNC3(request.getParameter("COLUMNC3"));
    inDto.setCOLUMNC4(request.getParameter("COLUMNC4"));
    inDto.setCOLUMNC5(request.getParameter("COLUMNC5"));
    inDto.setCOLUMNC6(request.getParameter("COLUMNC6"));
    inDto.setCOLUMNC7(request.getParameter("COLUMNC7"));
    inDto.setCOLUMNC8(request.getParameter("COLUMNC8"));
    inDto.setCOLUMNC9(request.getParameter("COLUMNC9"));
    inDto.setCOLUMND1(request.getParameter("COLUMND1"));
    inDto.setCOLUMND2(request.getParameter("COLUMND2"));
    inDto.setCOLUMND3(request.getParameter("COLUMND3"));
    inDto.setCOLUMND4(request.getParameter("COLUMND4"));
    inDto.setCOLUMND5(request.getParameter("COLUMND5"));
    inDto.setCOLUMND6(request.getParameter("COLUMND6"));
    
    // 입력
    if("I".equals(GBCD)) {
     // log.debug("입력 호출");
      mngShopProductTmpTblService.createMngShopProductTmpTbl(inDto);
    }
    // 수정
    else if("U".equals(GBCD)) {
     // log.debug("수정 호출");
      mngShopProductTmpTblService.modifyMngShopProductTmpTbl(inDto);
    }
    inDto.setCOLUMNA1("");
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("list2cnt", outDto.size());
    
    return "jsp/admin_page_lst";
  }

  @RequestMapping(value = "/removeAdminPage")
  public String removeAdminPage(Model model, HttpServletRequest request) throws Exception {
    //log.debug("removeAdminPage");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    
    inDto.setDIDX(request.getParameter("DIDX1"));
    
    // 입력
    //log.debug("삭제 호출");
    mngShopProductTmpTblService.removeMngShopProductTmpTbl(inDto);

    inDto.setCOLUMNA1("");
    inDto.setDIDX("");
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("list2cnt", outDto.size());
    
    return "jsp/admin_page_lst";
  }
  
  @RequestMapping(value = "/user-page")
  public String userPageLst(Model model, HttpServletRequest request) throws Exception {
   // log.debug("admin Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outList = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();

    UserPageLstOutDto pageOutDto = new UserPageLstOutDto();
    List<UserPageLstOutDto> pageOutDtoList = new ArrayList<UserPageLstOutDto>();
    for(MngShopProductTmpTblOutDto outDto : outList) {
      pageOutDto = new UserPageLstOutDto();
      
      // 최소가격 확인
      int col1 = -1;
      int col2 = -1;
      int col3 = -1;
      int col4 = -1;
      int col5 = -1;
      int col6 = -1;
      int col7 = -1;
      if(outDto.getCOLUMNA8() != null) {
        col1 = Integer.parseInt(outDto.getCOLUMNA8());
      } else {
        col1 = 100000000;
      }
      
      if(outDto.getCOLUMNB3() != null) {
        col2 = Integer.parseInt(outDto.getCOLUMNB3());
      } else {
        col2 = 100000000;
      }
      
      if(outDto.getCOLUMNB7() != null) {
        col3 = Integer.parseInt(outDto.getCOLUMNB7());
      } else {
        col3 = 100000000;
      }
      
      if(outDto.getCOLUMNC2() != null) {
        col4 = Integer.parseInt(outDto.getCOLUMNC2());
      } else {
        col4 = 100000000;
      }
      
      if(outDto.getCOLUMNC6() != null) {
        col5 = Integer.parseInt(outDto.getCOLUMNC6());
      } else {
        col5 = 100000000;
      }
      
      if(outDto.getCOLUMND1() != null) {
        col6 = Integer.parseInt(outDto.getCOLUMND1());
      } else {
        col6 = 100000000;
      }
      
      if(outDto.getCOLUMND5() != null) {
        col7 = Integer.parseInt(outDto.getCOLUMND5());
      } else {
        col7 = 100000000;
      }
      
      int lowAmtTmp = -1;
      String lowAmt = "";
      String urlTmp = "";
      
      if(col1 < col2) {
        lowAmtTmp = col1;
        urlTmp    = outDto.getCOLUMNA9();
      }else {
        lowAmtTmp = col2;
        urlTmp    = outDto.getCOLUMNB4();
      }
      
      if(lowAmtTmp > col3) {
        lowAmtTmp = col3;
        urlTmp    = outDto.getCOLUMNB8();
      }
      
      if(lowAmtTmp > col4) {
        lowAmtTmp = col4;
        urlTmp    = outDto.getCOLUMNC3();
      }
      
      if(lowAmtTmp > col5) {
        lowAmtTmp = col5;
        urlTmp    = outDto.getCOLUMNC7();
      }
      
      if(lowAmtTmp > col6) {
        lowAmtTmp = col6;
        urlTmp    = outDto.getCOLUMND2();
      }
      
      if(lowAmtTmp > col7) {
        lowAmtTmp = col7;
        urlTmp    = outDto.getCOLUMND6();
      }
      
      if(lowAmtTmp == 100000000) {
        lowAmtTmp = 0;
        urlTmp = "";
      }

      lowAmt = Integer.toString(lowAmtTmp);
      
      pageOutDto.setPRODUCTNM(outDto.getCOLUMNA1());
      pageOutDto.setIDX(outDto.getDIDX());
      pageOutDto.setLOWAMT(lowAmt);
      pageOutDto.setURL(urlTmp);
      
      pageOutDtoList.add(pageOutDto);
    }
    
    model.addAttribute("outDto", pageOutDtoList);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("list2cnt", pageOutDtoList.size());
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    
    return "jsp/user_page_lst";
  }
  
  @RequestMapping(value = "/admin-page-lst-main")
  public String adminPageLstMain(Model model, HttpServletRequest request) throws Exception {
    //log.debug("admin Page Lst Main");
    /*
     * MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
     * inDto.setCOLUMNA1(request.getParameter("COL1")); List<MngShopProductTmpTblOutDto> outDto =
     * mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto); List<ShopLstOutDto>
     * shopOutDto = shopLstService.getListShopLst(); List<CodeLstOutDto> codeOutDto =
     * codeLstService.getListCodeLst();
     * 
     * model.addAttribute("outDto", outDto); model.addAttribute("shopOutDto", shopOutDto);
     * model.addAttribute("codeOutDto", codeOutDto); model.addAttribute("headGb", "2");
     * model.addAttribute("searchTxt", inDto.getCOLUMNA1());
     */
    
    return "jsp/admin_page_lst_main";
  }

  @RequestMapping(value = "")
  public String root(Model model, HttpServletRequest request) throws Exception {
   // log.debug("root Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outList = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();

    UserPageLstOutDto pageOutDto = new UserPageLstOutDto();
    List<UserPageLstOutDto> pageOutDtoList = new ArrayList<UserPageLstOutDto>();
    for(MngShopProductTmpTblOutDto outDto : outList) {
      pageOutDto = new UserPageLstOutDto();
      
      // 최소가격 확인
      int col1 = -1;
      int col2 = -1;
      int col3 = -1;
      int col4 = -1;
      int col5 = -1;
      int col6 = -1;
      int col7 = -1;
      if(outDto.getCOLUMNA8() != null) {
        col1 = Integer.parseInt(outDto.getCOLUMNA8());
      } else {
        col1 = 100000000;
      }
      
      if(outDto.getCOLUMNB3() != null) {
        col2 = Integer.parseInt(outDto.getCOLUMNB3());
      } else {
        col2 = 100000000;
      }
      
      if(outDto.getCOLUMNB7() != null) {
        col3 = Integer.parseInt(outDto.getCOLUMNB7());
      } else {
        col3 = 100000000;
      }
      
      if(outDto.getCOLUMNC2() != null) {
        col4 = Integer.parseInt(outDto.getCOLUMNC2());
      } else {
        col4 = 100000000;
      }
      
      if(outDto.getCOLUMNC6() != null) {
        col5 = Integer.parseInt(outDto.getCOLUMNC6());
      } else {
        col5 = 100000000;
      }
      
      if(outDto.getCOLUMND1() != null) {
        col6 = Integer.parseInt(outDto.getCOLUMND1());
      } else {
        col6 = 100000000;
      }
      
      if(outDto.getCOLUMND5() != null) {
        col7 = Integer.parseInt(outDto.getCOLUMND5());
      } else {
        col7 = 100000000;
      }
      
      int lowAmtTmp = -1;
      String lowAmt = "";
      String urlTmp = "";
      
      if(col1 < col2) {
        lowAmtTmp = col1;
        urlTmp    = outDto.getCOLUMNA9();
      }else {
        lowAmtTmp = col2;
        urlTmp    = outDto.getCOLUMNB4();
      }
      
      if(lowAmtTmp > col3) {
        lowAmtTmp = col3;
        urlTmp    = outDto.getCOLUMNB8();
      }
      
      if(lowAmtTmp > col4) {
        lowAmtTmp = col4;
        urlTmp    = outDto.getCOLUMNC3();
      }
      
      if(lowAmtTmp > col5) {
        lowAmtTmp = col5;
        urlTmp    = outDto.getCOLUMNC7();
      }
      
      if(lowAmtTmp > col6) {
        lowAmtTmp = col6;
        urlTmp    = outDto.getCOLUMND2();
      }
      
      if(lowAmtTmp > col7) {
        lowAmtTmp = col7;
        urlTmp    = outDto.getCOLUMND6();
      }
      
      if(lowAmtTmp == 100000000) {
        lowAmtTmp = 0;
        urlTmp = "";
      }

      lowAmt = Integer.toString(lowAmtTmp);
      
      pageOutDto.setPRODUCTNM(outDto.getCOLUMNA1());
      pageOutDto.setIDX(outDto.getDIDX());
      pageOutDto.setLOWAMT(lowAmt);
      pageOutDto.setURL(urlTmp);
      
      pageOutDtoList.add(pageOutDto);
    }
    
    model.addAttribute("outDto", pageOutDtoList);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("list2cnt", pageOutDtoList.size());
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    
    return "jsp/user_page_lst";
  }
  
  @RequestMapping(value = "/")
  public String nomalPageLst(Model model, HttpServletRequest request) throws Exception {
   // log.debug("nomal Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outList = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();

    UserPageLstOutDto pageOutDto = new UserPageLstOutDto();
    List<UserPageLstOutDto> pageOutDtoList = new ArrayList<UserPageLstOutDto>();
    for(MngShopProductTmpTblOutDto outDto : outList) {
      pageOutDto = new UserPageLstOutDto();
      
      // 최소가격 확인
      int col1 = -1;
      int col2 = -1;
      int col3 = -1;
      int col4 = -1;
      int col5 = -1;
      int col6 = -1;
      int col7 = -1;
      if(outDto.getCOLUMNA8() != null) {
        col1 = Integer.parseInt(outDto.getCOLUMNA8());
      } else {
        col1 = 100000000;
      }
      
      if(outDto.getCOLUMNB3() != null) {
        col2 = Integer.parseInt(outDto.getCOLUMNB3());
      } else {
        col2 = 100000000;
      }
      
      if(outDto.getCOLUMNB7() != null) {
        col3 = Integer.parseInt(outDto.getCOLUMNB7());
      } else {
        col3 = 100000000;
      }
      
      if(outDto.getCOLUMNC2() != null) {
        col4 = Integer.parseInt(outDto.getCOLUMNC2());
      } else {
        col4 = 100000000;
      }
      
      if(outDto.getCOLUMNC6() != null) {
        col5 = Integer.parseInt(outDto.getCOLUMNC6());
      } else {
        col5 = 100000000;
      }
      
      if(outDto.getCOLUMND1() != null) {
        col6 = Integer.parseInt(outDto.getCOLUMND1());
      } else {
        col6 = 100000000;
      }
      
      if(outDto.getCOLUMND5() != null) {
        col7 = Integer.parseInt(outDto.getCOLUMND5());
      } else {
        col7 = 100000000;
      }
      
      int lowAmtTmp = -1;
      String lowAmt = "";
      String urlTmp = "";
      
      if(col1 < col2) {
        lowAmtTmp = col1;
        urlTmp    = outDto.getCOLUMNA9();
      }else {
        lowAmtTmp = col2;
        urlTmp    = outDto.getCOLUMNB4();
      }
      
      if(lowAmtTmp > col3) {
        lowAmtTmp = col3;
        urlTmp    = outDto.getCOLUMNB8();
      }
      
      if(lowAmtTmp > col4) {
        lowAmtTmp = col4;
        urlTmp    = outDto.getCOLUMNC3();
      }
      
      if(lowAmtTmp > col5) {
        lowAmtTmp = col5;
        urlTmp    = outDto.getCOLUMNC7();
      }
      
      if(lowAmtTmp > col6) {
        lowAmtTmp = col6;
        urlTmp    = outDto.getCOLUMND2();
      }
      
      if(lowAmtTmp > col7) {
        lowAmtTmp = col7;
        urlTmp    = outDto.getCOLUMND6();
      }
      
      if(lowAmtTmp == 100000000) {
        lowAmtTmp = 0;
        urlTmp = "";
      }

      lowAmt = Integer.toString(lowAmtTmp);
      
      pageOutDto.setPRODUCTNM(outDto.getCOLUMNA1());
      pageOutDto.setIDX(outDto.getDIDX());
      pageOutDto.setLOWAMT(lowAmt);
      pageOutDto.setURL(urlTmp);
      
      pageOutDtoList.add(pageOutDto);
    }
    
    model.addAttribute("outDto", pageOutDtoList);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("list2cnt", pageOutDtoList.size());
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    
    return "jsp/user_page_lst";
  }
}
