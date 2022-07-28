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
public class ProductAmtSearchLogInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  private String IDX;

  @ApiModelProperty(value = "상품 IDX", example = "1")
  private String PRODUCTIDX;
  
  @ApiModelProperty(value = "홈쇼핑 IDX", example = "1")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "카드 금액", example = "1")
  private String CARDAMT;
  
  @ApiModelProperty(value = "쿠폰 금액", example = "1")
  private String COUPONAMT;
  
  @ApiModelProperty(value = "일반 금액", example = "1")
  private String NOMALAMT;
  
  @ApiModelProperty(value = "생성일자", example = "1")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "생성 사용자 아이디", example = "1")
  private String AUDITID;

  public String getIDX() {
    return IDX;
  }

  public void setIDX(String iDX) {
    IDX = iDX;
  }

  public String getPRODUCTIDX() {
    return PRODUCTIDX;
  }

  public void setPRODUCTIDX(String pRODUCTIDX) {
    PRODUCTIDX = pRODUCTIDX;
  }

  public String getSHOPIDX() {
    return SHOPIDX;
  }

  public void setSHOPIDX(String sHOPIDX) {
    SHOPIDX = sHOPIDX;
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
