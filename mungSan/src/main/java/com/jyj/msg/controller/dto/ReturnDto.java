/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import io.swagger.annotations.ApiModelProperty;

/**
 * @create 2023. 1. 13.
 * @author 주영주
 **/
public class ReturnDto {
  @ApiModelProperty(value = "리턴결과값", example = "1", required = true)
  private String resultStr;

public String getResultStr() {
	return resultStr;
}

public void setResultStr(String resultStr) {
	this.resultStr = resultStr;
}
  
}
