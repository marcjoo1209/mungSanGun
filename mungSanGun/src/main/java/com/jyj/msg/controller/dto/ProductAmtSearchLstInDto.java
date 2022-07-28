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
public class ProductAmtSearchLstInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  private String IDX;

  @ApiModelProperty(value = "상품 idx", example = "상품 idx")
  private String PRODUCTIDX;
  
  @ApiModelProperty(value = "상품 이름", example = "상품 이름")
  private String PRODUCTNM;
  
  @ApiModelProperty(value = "상점 idx", example = "1")
  private String SHOPIDX;
  
  @ApiModelProperty(value = "상품 URL", example = "http://www.auction.com/test")
  private String PRODUCTURL;
  
  @ApiModelProperty(value = "로그인 id", example = "testuser")
  private String LOGINID;
  
  @ApiModelProperty(value = "로그인 pwd", example = "testpwd")
  private String LOGINPWD;
  
  @ApiModelProperty(value = "알고싶은가격\r\n"
                            + "1:카드가격\r\n"
                            + "2:쿠폰가격\r\n"
                            + "3:일반가격", example = "1")
  private String AMTGB;

  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;

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

  public String getPRODUCTNM() {
    return PRODUCTNM;
  }

  public void setPRODUCTNM(String pRODUCTNM) {
    PRODUCTNM = pRODUCTNM;
  }

  public String getSHOPIDX() {
    return SHOPIDX;
  }

  public void setSHOPIDX(String sHOPIDX) {
    SHOPIDX = sHOPIDX;
  }

  public String getPRODUCTURL() {
    return PRODUCTURL;
  }

  public void setPRODUCTURL(String pRODUCTURL) {
    PRODUCTURL = pRODUCTURL;
  }

  public String getLOGINID() {
    return LOGINID;
  }

  public void setLOGINID(String lOGINID) {
    LOGINID = lOGINID;
  }

  public String getLOGINPWD() {
    return LOGINPWD;
  }

  public void setLOGINPWD(String lOGINPWD) {
    LOGINPWD = lOGINPWD;
  }

  public String getAMTGB() {
    return AMTGB;
  }

  public void setAMTGB(String aMTGB) {
    AMTGB = aMTGB;
  }

  public String getUSEYN() {
    return USEYN;
  }

  public void setUSEYN(String uSEYN) {
    USEYN = uSEYN;
  }

  
}
