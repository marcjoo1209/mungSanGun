/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

/**
 * @create 2023. 1. 20.
 * @author 주영주
 **/
public class ProductDtlExcelLstDto {  
  private String PDLIDX         ;
  private String SHOPIDX        ;
  private String SHOPNM         ;
  private String DTLPAYAMT      ;
  private String DTLPRODUCTLINK ;
public String getPDLIDX() {
	return PDLIDX;
}
public void setPDLIDX(String pDLIDX) {
	PDLIDX = pDLIDX;
}
public String getSHOPIDX() {
	return SHOPIDX;
}
public void setSHOPIDX(String sHOPIDX) {
	SHOPIDX = sHOPIDX;
}
public String getSHOPNM() {
	return SHOPNM;
}
public void setSHOPNM(String sHOPNM) {
	SHOPNM = sHOPNM;
}
public String getDTLPAYAMT() {
	return DTLPAYAMT;
}
public void setDTLPAYAMT(String dTLPAYAMT) {
	DTLPAYAMT = dTLPAYAMT;
}
public String getDTLPRODUCTLINK() {
	return DTLPRODUCTLINK;
}
public void setDTLPRODUCTLINK(String dTLPRODUCTLINK) {
	DTLPRODUCTLINK = dTLPRODUCTLINK;
}
  
  
}
