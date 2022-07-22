/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Getter
@Setter
public class ProductLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "쇼핑몰 idx", example = "쇼핑몰 idx")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "상품 이름", example = "상품 이름")
  private String PRODUCTNM;
  
  @ApiModelProperty(value = "카드가격", example = "1000")
  private String CARDAMT;
  
  @ApiModelProperty(value = "쿠폰가격", example = "1000")
  private String COUPONAMT;
  
  @ApiModelProperty(value = "일반가격", example = "1000")
  private String NOMALAMT;
  
  @ApiModelProperty(value = "최저가격", example = "1000")
  private String LOWAMT;
  
  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;
  
  @ApiModelProperty(value = "생성일자", example = "yyyymmdd")
  private String CREATEDTM;

  @ApiModelProperty(value = "수정사용자", example = "testUser")
  private String AUDITID;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String AUDITDTM;
  
}
