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
public class ProductSearchLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "대상웹페이지별명", example = "1")
  private String TARGETCOMMANT;
  
  @ApiModelProperty(value = "이커머스순서", example = "1")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "대상웹페이지주소", example = "1")
  private String TARGETWEBURL;
  
  @ApiModelProperty(value = "기준 금액", example = "1")
  private String TARGETAMT;
  
  @ApiModelProperty(value = "0:최소, 1:최대 초과 구분", example = "1")
  private String GBUPDOWN;
  
  @ApiModelProperty(value = "0:쿠폰, 1:카드 구분", example = "1")
  private String GBCARD;
  
  @ApiModelProperty(value = "품절시 알람 요청 Y:알람요청:,N:알람미요청", example = "1")
  private String ALAMSOLDOUT;
  
  @ApiModelProperty(value = "로그인id", example = "1")
  private String ID;
  
  @ApiModelProperty(value = "로그인pwd", example = "1")
  private String PWD;
  
  @ApiModelProperty(value = "생성일자", example = "1")
  private String CREATEDTM;
  
  @ApiModelProperty(value = "수정일자", example = "1")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "수정 유저 아이디", example = "1")
  private String AUDITID;
  
  @ApiModelProperty(value = "알람 여부", example = "1")
  private String ALAMYN;

  @ApiModelProperty(value = "사용 여부", example = "1")
  private String USEYN;

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getTARGETCOMMANT() {
    return TARGETCOMMANT;
  }

  public void setTARGETCOMMANT(String tARGETCOMMANT) {
    TARGETCOMMANT = tARGETCOMMANT;
  }

  public String getSHOPIDX() {
    return SHOPIDX;
  }

  public void setSHOPIDX(String sHOPIDX) {
    SHOPIDX = sHOPIDX;
  }

  public String getTARGETWEBURL() {
    return TARGETWEBURL;
  }

  public void setTARGETWEBURL(String tARGETWEBURL) {
    TARGETWEBURL = tARGETWEBURL;
  }

  public String getTARGETAMT() {
    return TARGETAMT;
  }

  public void setTARGETAMT(String tARGETAMT) {
    TARGETAMT = tARGETAMT;
  }

  public String getGBUPDOWN() {
    return GBUPDOWN;
  }

  public void setGBUPDOWN(String gBUPDOWN) {
    GBUPDOWN = gBUPDOWN;
  }

  public String getGBCARD() {
    return GBCARD;
  }

  public void setGBCARD(String gBCARD) {
    GBCARD = gBCARD;
  }

  public String getALAMSOLDOUT() {
    return ALAMSOLDOUT;
  }

  public void setALAMSOLDOUT(String aLAMSOLDOUT) {
    ALAMSOLDOUT = aLAMSOLDOUT;
  }

  public String getID() {
    return ID;
  }

  public void setID(String iD) {
    ID = iD;
  }

  public String getPWD() {
    return PWD;
  }

  public void setPWD(String pWD) {
    PWD = pWD;
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

  public String getALAMYN() {
    return ALAMYN;
  }

  public void setALAMYN(String aLAMYN) {
    ALAMYN = aLAMYN;
  }

  public String getUSEYN() {
    return USEYN;
  }

  public void setUSEYN(String uSEYN) {
    USEYN = uSEYN;
  }

  
}
