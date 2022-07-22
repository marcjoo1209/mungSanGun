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
public class ProductAmtSearchLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "상품 idx", example = "상품 idx")
  private String PRODUCTIDX;
  
  @ApiModelProperty(value = "상품 이름", example = "상품 이름")
  private String PRODUCTNM;
  
  @ApiModelProperty(value = "상점 idx", example = "1")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "상품 URL", example = "http://www.auction.com/test")
  private String PRODUCTURL;
  
  @ApiModelProperty(value = "로그인 id", example = "testuser")
  private String LOGINID;
  
  @ApiModelProperty(value = "로그인 pwd", example = "testpwd")
  private String LOGINPWD;
  
  @ApiModelProperty(value = "알고싶은가격\r\n"
                            + "1:카드가격\r\n"
                            + "2:쿠폰가격\r\n"
                            + "3:일반가격", example = "1")
  private String AMTGB;

  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;
  
}
