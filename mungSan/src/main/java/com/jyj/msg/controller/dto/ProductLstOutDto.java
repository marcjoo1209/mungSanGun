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
public class ProductLstOutDto {
  @ApiModelProperty(value = "순서", example = "1")
  private String IDX;

  @ApiModelProperty(value = "쇼핑몰 idx", example = "쇼핑몰 idx")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "상품 이름", example = "상품 이름")
  private String PRODUCTNM;
  
  @ApiModelProperty(value = "이미지URL", example = "1000")
  private String IMGURL;
  
  @ApiModelProperty(value = "판매가", example = "1000")
  private String NOMALAMT;
  
  @ApiModelProperty(value = "배송비", example = "1000")
  private String SHIPAMT;
  
  @ApiModelProperty(value = "수수료", example = "1000")
  private String COMMITIONAMT;
  
  @ApiModelProperty(value = "정산가", example = "Y")
  private String CALCAMT;
  
  @ApiModelProperty(value = "구입가", example = "yyyymmdd")
  private String PAYAMT;

  @ApiModelProperty(value = "마진", example = "testUser")
  private String INCOMEAMT;
  
  @ApiModelProperty(value = "최저가", example = "yyyymmdd")
  private String LOWAMT;
  
  @ApiModelProperty(value = "링크", example = "yyyymmdd")
  private String PRODUCTLINK;
  
  @ApiModelProperty(value = "사용여부", example = "yyyymmdd")
  private String USEYN;
  
  @ApiModelProperty(value = "생성일자", example = "yyyymmdd")
  private String CREATEDTM;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "수정사용자", example = "yyyymmdd")
  private String AUDITID;
  
  @ApiModelProperty(value = "MEMO", example = "yyyymmdd")
  private String MEMO;
  
  @ApiModelProperty(value = "LEADAMT", example = "yyyymmdd")
  private String LEADAMT;

  public String getMEMO() {
    return MEMO;
  }

  public void setMEMO(String mEMO) {
    MEMO = mEMO;
  }

  public String getLEADAMT() {
    return LEADAMT;
  }

  public void setLEADAMT(String lEADAMT) {
    LEADAMT = lEADAMT;
  }

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getSHOPIDX() {
    return SHOPIDX;
  }

  public void setSHOPIDX(String sHOPIDX) {
    SHOPIDX = sHOPIDX;
  }

  public String getPRODUCTNM() {
    return PRODUCTNM;
  }

  public void setPRODUCTNM(String pRODUCTNM) {
    PRODUCTNM = pRODUCTNM;
  }

  public String getIMGURL() {
    return IMGURL;
  }

  public void setIMGURL(String iMGURL) {
    IMGURL = iMGURL;
  }

  public String getNOMALAMT() {
    return NOMALAMT;
  }

  public void setNOMALAMT(String nOMALAMT) {
    NOMALAMT = nOMALAMT;
  }

  public String getSHIPAMT() {
    return SHIPAMT;
  }

  public void setSHIPAMT(String sHIPAMT) {
    SHIPAMT = sHIPAMT;
  }

  public String getCOMMITIONAMT() {
    return COMMITIONAMT;
  }

  public void setCOMMITIONAMT(String cOMMITIONAMT) {
    COMMITIONAMT = cOMMITIONAMT;
  }

  public String getCALCAMT() {
    return CALCAMT;
  }

  public void setCALCAMT(String cALCAMT) {
    CALCAMT = cALCAMT;
  }

  public String getPAYAMT() {
    return PAYAMT;
  }

  public void setPAYAMT(String pAYAMT) {
    PAYAMT = pAYAMT;
  }

  public String getINCOMEAMT() {
    return INCOMEAMT;
  }

  public void setINCOMEAMT(String iNCOMEAMT) {
    INCOMEAMT = iNCOMEAMT;
  }

  public String getLOWAMT() {
    return LOWAMT;
  }

  public void setLOWAMT(String lOWAMT) {
    LOWAMT = lOWAMT;
  }

  public String getPRODUCTLINK() {
    return PRODUCTLINK;
  }

  public void setPRODUCTLINK(String pRODUCTLINK) {
    PRODUCTLINK = pRODUCTLINK;
  }

  public String getUSEYN() {
    return USEYN;
  }

  public void setUSEYN(String uSEYN) {
    USEYN = uSEYN;
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


}
