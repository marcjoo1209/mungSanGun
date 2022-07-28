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
public class TelegramNotiUserLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "채팅 token", example = "채팅 token")
  private String TOKEN;
  
  @ApiModelProperty(value = "채팅id", example = "채팅id")
  private String CHATID;
  
  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "수정 사용자", example = "testuser")
  private String AUDITID;

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getTOKEN() {
    return TOKEN;
  }

  public void setTOKEN(String tOKEN) {
    TOKEN = tOKEN;
  }

  public String getCHATID() {
    return CHATID;
  }

  public void setCHATID(String cHATID) {
    CHATID = cHATID;
  }

  public String getUSEYN() {
    return USEYN;
  }

  public void setUSEYN(String uSEYN) {
    USEYN = uSEYN;
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

  
}
