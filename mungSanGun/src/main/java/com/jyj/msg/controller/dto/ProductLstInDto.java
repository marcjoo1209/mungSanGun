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
public class ProductLstInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  private String IDX;

  @ApiModelProperty(value = "쇼핑몰 idx", example = "쇼핑몰 idx")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "상품 이름", example = "상품 이름")
  private String PRODUCTNM;
  
  @ApiModelProperty(value = "카드가격", example = "1000")
  private String CARDAMT;
  
  @ApiModelProperty(value = "쿠폰가격", example = "1000")
  private String COUPONAMT;
  
  @ApiModelProperty(value = "일반가격", example = "1000")
  private String NOMALAMT;
  
  @ApiModelProperty(value = "최저가격", example = "1000")
  private String LOWAMT;
  
  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;
  
  @ApiModelProperty(value = "생성일자", example = "yyyymmdd")
  private String CREATEDTM;

  @ApiModelProperty(value = "수정사용자", example = "testUser")
  private String AUDITID;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "정렬구분", example = "yyyymmdd")
  private String PRODUCTNMDESC;

  
  public String getPRODUCTNMDESC() {
    return PRODUCTNMDESC;
  }

  public void setPRODUCTNMDESC(String pRODUCTNMDESC) {
    PRODUCTNMDESC = pRODUCTNMDESC;
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

  public String getCARDAMT() {
    return CARDAMT;
  }

  public void setCARDAMT(String cARDAMT) {
    CARDAMT = cARDAMT;
  }

  public String getCOUPONAMT() {
    return COUPONAMT;
  }

  public void setCOUPONAMT(String cOUPONAMT) {
    COUPONAMT = cOUPONAMT;
  }

  public String getNOMALAMT() {
    return NOMALAMT;
  }

  public void setNOMALAMT(String nOMALAMT) {
    NOMALAMT = nOMALAMT;
  }

  public String getLOWAMT() {
    return LOWAMT;
  }

  public void setLOWAMT(String lOWAMT) {
    LOWAMT = lOWAMT;
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
