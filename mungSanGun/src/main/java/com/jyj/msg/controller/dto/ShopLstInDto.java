/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import io.swagger.annotations.ApiModelProperty;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
public class ShopLstInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  private String IDX;

  @ApiModelProperty(value = "생성일자", example = "1")
  private String CREATEDTM;
  
  @ApiModelProperty(value = "수정일자", example = "1")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "생성 사용자 아이디", example = "1")
  private String AUDITID;
  
  @ApiModelProperty(value = "이커머스 이름", example = "1")
  private String SHOPNM;

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getCREATEDTM() {
    return CREATEDTM;
  }

  public void setCREATEDTM(String cREATEDTM) {
    CREATEDTM = cREATEDTM;
  }

  public String getAUDITDTM() {
    return AUDITDTM;
  }

  public void setAUDITDTM(String aUDITDTM) {
    AUDITDTM = aUDITDTM;
  }

  public String getAUDITID() {
    return AUDITID;
  }

  public void setAUDITID(String aUDITID) {
    AUDITID = aUDITID;
  }

  public String getSHOPNM() {
    return SHOPNM;
  }

  public void setSHOPNM(String sHOPNM) {
    SHOPNM = sHOPNM;
  }

  
}
