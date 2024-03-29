/**
 * @file ProductAmtSearchLstController.java
 * @author 주영주
 * @description
**/
package com.jyj.msg.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jyj.msg.controller.dto.ProductAmtSearchLstInDto;
import com.jyj.msg.controller.dto.ProductAmtSearchLstOutDto;
import com.jyj.msg.service.ProductAmtSearchLstService;
import io.swagger.annotations.ApiOperation;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
//@Slf4j
@Controller
@SessionAttributes("aptinfo")
public class ProductAmtSearchLstController {
	@Autowired
	ProductAmtSearchLstService productAmtSearchLstService;

	@RequestMapping(value = "/getlist-product-amt-search-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 리스트 조회 로컬 호출", notes = "상품 대상 리스트 조회 로컬 호출")
	public List<ProductAmtSearchLstOutDto> getListProductAmtSearchLst() throws IOException {
		List<ProductAmtSearchLstOutDto> outDto = productAmtSearchLstService.getListProductAmtSearchLst();

		return outDto;
	}

	@RequestMapping(value = "/getlist-product-amt-search-lst-by-shop", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 리스트 조회 로컬 호출", notes = "상품 대상 리스트 조회 로컬 호출")
	public List<ProductAmtSearchLstOutDto> getListProductAmtSearchLstByShop(@RequestBody ProductAmtSearchLstInDto inDto)
			throws IOException {
		List<ProductAmtSearchLstOutDto> outDto = productAmtSearchLstService.getListProductAmtSearchLstByShop(inDto);

		return outDto;
	}

	@RequestMapping(value = "/get-product-amt-search-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 조회 호출", notes = "상품 대상 리스트 조회 호출")
	public ProductAmtSearchLstOutDto getProductAmtSearchLst(@RequestBody ProductAmtSearchLstInDto inDto)
			throws IOException {
		ProductAmtSearchLstOutDto outDto = productAmtSearchLstService.getProductAmtSearchLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/create-product-amt-search-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 생성 호출", notes = "상품 대상 리스트 생성 호출")
	public Integer createProductAmtSearchLst(@RequestBody ProductAmtSearchLstInDto inDto) throws IOException {
		Integer outDto = productAmtSearchLstService.createProductAmtSearchLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/modify-product-amt-search-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 수정 호출", notes = "상품 대상 리스트 수정 호출")
	public Integer modifyProductAmtSearchLst(@RequestBody ProductAmtSearchLstInDto inDto) throws IOException {
		Integer outDto = productAmtSearchLstService.modifyProductAmtSearchLst(inDto);

		return outDto;
	}

	@RequestMapping(value = "/remove-product-amt-search-lst", method = RequestMethod.POST)
	@ApiOperation(value = "상품 대상 수정 호출", notes = "상품 대상 리스트 수정 호출")
	public Integer removeProductAmtSearchLst(@RequestBody ProductAmtSearchLstInDto inDto) throws IOException {
		Integer outDto = productAmtSearchLstService.removeProductAmtSearchLst(inDto);

		return outDto;
	}
}
