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
public class ProductDtlLstInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  private String IDX;

  @ApiModelProperty(value = "쇼핑몰 idx", example = "쇼핑몰 idx")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "이전 쇼핑몰 idx", example = "이전 쇼핑몰 idx")
  private String OLDSHOPIDX;
  
  @ApiModelProperty(value = "상품 idx", example = "상품 idx")
  private String PRODUCTIDX;

  @ApiModelProperty(value = "배송비", example = "Y")
  private String DTLSHIPAMT;
  
  @ApiModelProperty(value = "수수료", example = "Y")
  private String DTLCOMMITIONAMT;
  
  @ApiModelProperty(value = "정산가", example = "Y")
  private String DTLCALCAMT;
  
  @ApiModelProperty(value = "구입가", example = "Y")
  private String DTLPAYAMT;
  
  @ApiModelProperty(value = "마진", example = "Y")
  private String DTLINCONNAMT;

  @ApiModelProperty(value = "최저가", example = "Y")
  private String DTLLOWAMT;
  
  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;
  
  @ApiModelProperty(value = "생성일자", example = "yyyymmdd")
  private String CREATEDTM;

  @ApiModelProperty(value = "수정사용자", example = "testUser")
  private String AUDITID;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String DTLPRODUCTLINK;

  @ApiModelProperty(value = "판매가", example = "yyyymmdd")
  private String DTLNOMALAMT;

  @ApiModelProperty(value = "판매가", example = "yyyymmdd")
  private String DTLINCOMMAMT;
  
  
  public String getOLDSHOPIDX() {
    return OLDSHOPIDX;
  }

  public void setOLDSHOPIDX(String oLDSHOPIDX) {
    OLDSHOPIDX = oLDSHOPIDX;
  }

  public String getDTLINCOMMAMT() {
    return DTLINCOMMAMT;
  }

  public void setDTLINCOMMAMT(String dTLINCOMMAMT) {
    DTLINCOMMAMT = dTLINCOMMAMT;
  }

  public String getDTLNOMALAMT() {
    return DTLNOMALAMT;
  }

  public void setDTLNOMALAMT(String dTLNOMALAMT) {
    DTLNOMALAMT = dTLNOMALAMT;
  }

  public String getDTLPRODUCTLINK() {
    return DTLPRODUCTLINK;
  }

  public void setDTLPRODUCTLINK(String dTLPRODUCTLINK) {
    DTLPRODUCTLINK = dTLPRODUCTLINK;
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

  public String getPRODUCTIDX() {
    return PRODUCTIDX;
  }

  public void setPRODUCTIDX(String pRODUCTIDX) {
    PRODUCTIDX = pRODUCTIDX;
  }

  public String getDTLSHIPAMT() {
    return DTLSHIPAMT;
  }

  public void setDTLSHIPAMT(String dTLSHIPAMT) {
    DTLSHIPAMT = dTLSHIPAMT;
  }

  public String getDTLCOMMITIONAMT() {
    return DTLCOMMITIONAMT;
  }

  public void setDTLCOMMITIONAMT(String dTLCOMMITIONAMT) {
    DTLCOMMITIONAMT = dTLCOMMITIONAMT;
  }

  public String getDTLCALCAMT() {
    return DTLCALCAMT;
  }

  public void setDTLCALCAMT(String dTLCALCAMT) {
    DTLCALCAMT = dTLCALCAMT;
  }

  public String getDTLPAYAMT() {
    return DTLPAYAMT;
  }

  public void setDTLPAYAMT(String dTLPAYAMT) {
    DTLPAYAMT = dTLPAYAMT;
  }

  public String getDTLINCONNAMT() {
    return DTLINCONNAMT;
  }

  public void setDTLINCONNAMT(String dTLINCONNAMT) {
    DTLINCONNAMT = dTLINCONNAMT;
  }

  public String getDTLLOWAMT() {
    return DTLLOWAMT;
  }

  public void setDTLLOWAMT(String dTLLOWAMT) {
    DTLLOWAMT = dTLLOWAMT;
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
