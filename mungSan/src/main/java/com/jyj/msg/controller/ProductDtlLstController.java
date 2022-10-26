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
import com.jyj.msg.controller.dto.ProductDtlLstInDto;
import com.jyj.msg.controller.dto.ProductDtlLstOutDto;
import com.jyj.msg.controller.dto.ProductLstInDto;
import com.jyj.msg.controller.dto.ProductSearchDto;
import com.jyj.msg.service.ProductDtlLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
//@Slf4j
@RestController
@SessionAttributes("productdtl")
public class ProductDtlLstController {
	@Autowired
	ProductDtlLstService productDtlLstService;

	@RequestMapping(value = "/create-product-dtl-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 생성 호출", notes = "상품 대상 리스트 생성 호출")
	public int createProductLst(@RequestBody Map<String, Object> data) throws IOException {
		System.out.println("/create-product-dtl-lst 호출 시작");
		ProductDtlLstInDto inDto = new ProductDtlLstInDto();

		inDto.setIDX(CommonUtil.checkDataIsNull(data.get("IDX")));
		inDto.setSHOPIDX(CommonUtil.checkDataIsNull(data.get("SHOPIDX")));
		inDto.setOLDSHOPIDX(CommonUtil.checkDataIsNull(data.get("OLDSHOPIDX")));
		inDto.setPRODUCTIDX(CommonUtil.checkDataIsNull(data.get("PRODUCTIDX")));
		inDto.setDTLNOMALAMT(CommonUtil.checkDataIsNull(data.get("DTLNOMALAMT")));
		inDto.setDTLSHIPAMT(CommonUtil.checkDataIsNull(data.get("DTLSHIPAMT")));
		inDto.setDTLCOMMITIONAMT(CommonUtil.checkDataIsNull(data.get("DTLCOMMITIONAMT")));
		inDto.setDTLCALCAMT(CommonUtil.checkDataIsNull(data.get("DTLCALCAMT")));
		inDto.setDTLPAYAMT(CommonUtil.checkDataIsNull(data.get("DTLPAYAMT")));
		inDto.setDTLINCOMMAMT(CommonUtil.checkDataIsNull(data.get("DTLINCOMMAMT")));
		inDto.setDTLLOWAMT(CommonUtil.checkDataIsNull(data.get("DTLLOWAMT")));
		inDto.setDTLPRODUCTLINK(CommonUtil.checkDataIsNull(data.get("DTLPRODUCTLINK")));

		System.out.println(inDto.getDTLSHIPAMT());

		int outDto = productDtlLstService.createProductDtlLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/remove-product-dtl-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 생성 호출", notes = "상품 대상 리스트 생성 호출")
	public int removeProductLst(@RequestBody Map<String, Object> data) throws IOException {
		System.out.println("/remove-product-dtl-lst 호출 시작");
		ProductDtlLstInDto inDto = new ProductDtlLstInDto();

		inDto.setIDX(CommonUtil.checkDataIsNull(data.get("IDX")));
		inDto.setSHOPIDX(CommonUtil.checkDataIsNull(data.get("SHOPIDX")));
		inDto.setOLDSHOPIDX(CommonUtil.checkDataIsNull(data.get("OLDSHOPIDX")));
		inDto.setPRODUCTIDX(CommonUtil.checkDataIsNull(data.get("PRODUCTIDX")));
		inDto.setDTLNOMALAMT(CommonUtil.checkDataIsNull(data.get("DTLNOMALAMT")));
		inDto.setDTLSHIPAMT(CommonUtil.checkDataIsNull(data.get("DTLSHIPAMT")));
		inDto.setDTLCOMMITIONAMT(CommonUtil.checkDataIsNull(data.get("DTLCOMMITIONAMT")));
		inDto.setDTLCALCAMT(CommonUtil.checkDataIsNull(data.get("DTLCALCAMT")));
		inDto.setDTLPAYAMT(CommonUtil.checkDataIsNull(data.get("DTLPAYAMT")));
		inDto.setDTLINCOMMAMT(CommonUtil.checkDataIsNull(data.get("DTLINCOMMAMT")));
		inDto.setDTLLOWAMT(CommonUtil.checkDataIsNull(data.get("DTLLOWAMT")));
		inDto.setDTLPRODUCTLINK(CommonUtil.checkDataIsNull(data.get("DTLPRODUCTLINK")));

		System.out.println(inDto.getDTLSHIPAMT());
		Integer outDto = productDtlLstService.removeProductDtlLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/modify-product-dtl-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 수정 호출", notes = "상품 대상 리스트 수정 호출")
	public int modifyProductLst(@RequestBody Map<String, Object> data) throws IOException {
		System.out.println("/modify-product-dtl-lst 호출 시작");
		ProductDtlLstInDto inDto = new ProductDtlLstInDto();

		inDto.setIDX(CommonUtil.checkDataIsNull(data.get("IDX")));
		inDto.setSHOPIDX(CommonUtil.checkDataIsNull(data.get("SHOPIDX")));
		inDto.setOLDSHOPIDX(CommonUtil.checkDataIsNull(data.get("OLDSHOPIDX")));
		inDto.setPRODUCTIDX(CommonUtil.checkDataIsNull(data.get("PRODUCTIDX")));
		inDto.setDTLNOMALAMT(CommonUtil.checkDataIsNull(data.get("DTLNOMALAMT")));
		inDto.setDTLSHIPAMT(CommonUtil.checkDataIsNull(data.get("DTLSHIPAMT")));
		inDto.setDTLCOMMITIONAMT(CommonUtil.checkDataIsNull(data.get("DTLCOMMITIONAMT")));
		inDto.setDTLCALCAMT(CommonUtil.checkDataIsNull(data.get("DTLCALCAMT")));
		inDto.setDTLPAYAMT(CommonUtil.checkDataIsNull(data.get("DTLPAYAMT")));
		inDto.setDTLINCOMMAMT(CommonUtil.checkDataIsNull(data.get("DTLINCOMMAMT")));
		inDto.setDTLLOWAMT(CommonUtil.checkDataIsNull(data.get("DTLLOWAMT")));
		inDto.setDTLPRODUCTLINK(CommonUtil.checkDataIsNull(data.get("DTLPRODUCTLINK")));

		System.out.println(inDto.getDTLSHIPAMT());
		Integer outDto = productDtlLstService.modifyProductDtlLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/get-list-product-dtl-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 상세 대상 리스트 조회 로컬 호출", notes = "상품 상세 대상 리스트 조회 로컬 호출")
	public List<ProductDtlLstOutDto> getListProductDtlLst(@RequestBody ProductSearchDto inDto) throws IOException {
		System.out.println("/get-list-product-dtl-lst 호출 시작");
		System.out.println(inDto.getPRODUCTIDX());
		List<ProductDtlLstOutDto> outDto = productDtlLstService.getListProductDtlLst(inDto);

		return outDto;
	}

}
