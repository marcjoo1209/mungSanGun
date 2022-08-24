/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import io.swagger.annotations.ApiModelProperty;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public class ProductSearchDto {
  @ApiModelProperty(value = "상품IDX", example = "1", required = true)
  private String PRODUCTIDX;

  public String getPRODUCTIDX() {
    return PRODUCTIDX;
  }

  public void setPRODUCTIDX(String pRODUCTIDX) {
    PRODUCTIDX = pRODUCTIDX;
  }
  
  
}
