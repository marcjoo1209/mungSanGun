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
public class CodeLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "코드아이디", example = "1")
  private String CODEID;
  
  @ApiModelProperty(value = "코드이름", example = "1")
  private String CODENM;
  
  @ApiModelProperty(value = "코드값1", example = "1")
  private String CODEVAL1;
  
  @ApiModelProperty(value = "코드값2", example = "1")
  private String CODEVAL2;
  
  @ApiModelProperty(value = "코드값3", example = "1")
  private String CODEVAL3;
  
  @ApiModelProperty(value = "코드값4", example = "1")
  private String CODEVAL4;
  
  @ApiModelProperty(value = "코드값5", example = "1")
  private String CODEVAL5;
  
  @ApiModelProperty(value = "코드값6", example = "1")
  private String CODEVAL6;
  
  @ApiModelProperty(value = "코드값7", example = "1")
  private String CODEVAL7;
  
  @ApiModelProperty(value = "코드값8", example = "1")
  private String CODEVAL8;
  
  @ApiModelProperty(value = "코드값9", example = "1")
  private String CODEVAL9;
  
  @ApiModelProperty(value = "코드값10", example = "1")
  private String CODEVAL10;
  
  @ApiModelProperty(value = "변경사용자", example = "1")
  private String AUDITID;
  
  @ApiModelProperty(value = "변경일자", example = "1")
  private String AUDITDTM;

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getCODEID() {
    return CODEID;
  }

  public void setCODEID(String cODEID) {
    CODEID = cODEID;
  }

  public String getCODENM() {
    return CODENM;
  }

  public void setCODENM(String cODENM) {
    CODENM = cODENM;
  }

  public String getCODEVAL1() {
    return CODEVAL1;
  }

  public void setCODEVAL1(String cODEVAL1) {
    CODEVAL1 = cODEVAL1;
  }

  public String getCODEVAL2() {
    return CODEVAL2;
  }

  public void setCODEVAL2(String cODEVAL2) {
    CODEVAL2 = cODEVAL2;
  }

  public String getCODEVAL3() {
    return CODEVAL3;
  }

  public void setCODEVAL3(String cODEVAL3) {
    CODEVAL3 = cODEVAL3;
  }

  public String getCODEVAL4() {
    return CODEVAL4;
  }

  public void setCODEVAL4(String cODEVAL4) {
    CODEVAL4 = cODEVAL4;
  }

  public String getCODEVAL5() {
    return CODEVAL5;
  }

  public void setCODEVAL5(String cODEVAL5) {
    CODEVAL5 = cODEVAL5;
  }

  public String getCODEVAL6() {
    return CODEVAL6;
  }

  public void setCODEVAL6(String cODEVAL6) {
    CODEVAL6 = cODEVAL6;
  }

  public String getCODEVAL7() {
    return CODEVAL7;
  }

  public void setCODEVAL7(String cODEVAL7) {
    CODEVAL7 = cODEVAL7;
  }

  public String getCODEVAL8() {
    return CODEVAL8;
  }

  public void setCODEVAL8(String cODEVAL8) {
    CODEVAL8 = cODEVAL8;
  }

  public String getCODEVAL9() {
    return CODEVAL9;
  }

  public void setCODEVAL9(String cODEVAL9) {
    CODEVAL9 = cODEVAL9;
  }

  public String getCODEVAL10() {
    return CODEVAL10;
  }

  public void setCODEVAL10(String cODEVAL10) {
    CODEVAL10 = cODEVAL10;
  }

  public String getAUDITID() {
    return AUDITID;
  }

  public void setAUDITID(String aUDITID) {
    AUDITID = aUDITID;
  }

  public String getAUDITDTM() {
    return AUDITDTM;
  }

  public void setAUDITDTM(String aUDITDTM) {
    AUDITDTM = aUDITDTM;
  }

  
}
