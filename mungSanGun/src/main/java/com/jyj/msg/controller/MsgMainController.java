/**
 * @file MsgMainController.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.jyj.msg.controller.dto.CodeLstOutDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblInDto;
import com.jyj.msg.controller.dto.MngShopProductTmpTblOutDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLogOutDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;
import com.jyj.msg.controller.dto.ProductSearchLstOutDto;
import com.jyj.msg.controller.dto.ShopLstOutDto;
import com.jyj.msg.service.CodeLstService;
import com.jyj.msg.service.MngShopProductTmpTblService;
import com.jyj.msg.service.ProductAmtSearchLogService;
import com.jyj.msg.service.ProductAmtSearchLstService;
import com.jyj.msg.service.ProductSearchLstService;
import com.jyj.msg.service.ShopLstService;
import lombok.extern.slf4j.Slf4j;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Slf4j
@Controller
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

  //@RequestMapping(value = "/")
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt")
  public String mainView(Model model) throws Exception {
    log.debug("/ 호출 시작");
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
    log.debug("Main Page POST");

    return "redirect:main";
  }
  
  //@RequestMapping(value = "/main", method = RequestMethod.GET)
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt2")
  public String main(Model model) throws Exception {
    log.debug("Main Page");
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
    log.debug("log Page POST");

    return "redirect:log";
  }
  
  //@RequestMapping(value = "/log", method = RequestMethod.GET)
  @RequestMapping(value = "/tttttttttttttttttttttttttttttttttt4")
  public String log(Model model) throws Exception {
    log.debug("log Page");
    List<ProductAmtSearchLogOutDto> outDto = productAmtSearchLogService.getListProductAmtSearchLog();
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    
    return "log_page";
  }
  
  @RequestMapping(value = "/admin-page-lst")
  public String adminPageLst(Model model, HttpServletRequest request) throws Exception {
    log.debug("admin Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("headGb", "2");
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    
    return "admin_page_lst";
  }
  
  @RequestMapping(value = "/admin-page-lst-main")
  public String adminPageLstMain(Model model, HttpServletRequest request) throws Exception {
    log.debug("admin Page Lst Main");
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
    
    return "admin_page_lst_main";
  }

  @RequestMapping(value = "")
  public String root(Model model, HttpServletRequest request) throws Exception {
    log.debug("root Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    model.addAttribute("headGb", "2");
    
    return "nomal_page_lst";
  }
  
  @RequestMapping(value = "/")
  public String nomalPageLst(Model model, HttpServletRequest request) throws Exception {
    log.debug("nomal Page Lst");
    MngShopProductTmpTblInDto inDto = new MngShopProductTmpTblInDto();
    inDto.setCOLUMNA1(request.getParameter("COL1"));
    List<MngShopProductTmpTblOutDto> outDto = mngShopProductTmpTblService.getListMngShopProductTmpTbl(inDto);
    List<ShopLstOutDto> shopOutDto = shopLstService.getListShopLst();
    List<CodeLstOutDto> codeOutDto = codeLstService.getListCodeLst();
    
    model.addAttribute("outDto", outDto);
    model.addAttribute("shopOutDto", shopOutDto);
    model.addAttribute("codeOutDto", codeOutDto);
    model.addAttribute("searchTxt", inDto.getCOLUMNA1());
    model.addAttribute("headGb", "2");
    
    return "nomal_page_lst";
  }
}
