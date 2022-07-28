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
public class UserPageLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "상품이름", example = "상품이름")
  private String PRODUCTNM;
  
  @ApiModelProperty(value = "가격", example = "가격")
  private String LOWAMT;
  
  @ApiModelProperty(value = "상품URL", example = "URL")
  private String URL;

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getPRODUCTNM() {
    return PRODUCTNM;
  }

  public void setPRODUCTNM(String pRODUCTNM) {
    PRODUCTNM = pRODUCTNM;
  }

  public String getLOWAMT() {
    return LOWAMT;
  }

  public void setLOWAMT(String lOWAMT) {
    LOWAMT = lOWAMT;
  }

  public String getURL() {
    return URL;
  }

  public void setURL(String uRL) {
    URL = uRL;
  }
  
  
}
