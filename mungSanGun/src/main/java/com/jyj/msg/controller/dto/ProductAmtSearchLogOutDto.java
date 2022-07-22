/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Getter
@Setter
public class ProductAmtSearchLogOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "상품 IDX", example = "1")
  private String PRODUCTIDX;
  
  @ApiModelProperty(value = "홈쇼핑 IDX", example = "1")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "카드 금액", example = "1")
  private String CARDAMT;
  
  @ApiModelProperty(value = "쿠폰 금액", example = "1")
  private String COUPONAMT;
  
  @ApiModelProperty(value = "일반 금액", example = "1")
  private String NOMALAMT;
  
  @ApiModelProperty(value = "생성일자", example = "1")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "생성 사용자 아이디", example = "1")
  private String AUDITID;

}
