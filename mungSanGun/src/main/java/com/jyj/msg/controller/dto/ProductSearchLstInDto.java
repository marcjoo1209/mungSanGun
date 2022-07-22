/**
 * @file dto.java
 * @author 주영주
 * @description
 **/
package com.jyj.msg.controller.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * @create 2022. 7. 14.
 * @author 주영주
 **/
@Getter
@Setter
public class ProductSearchLstInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  @NotEmpty(message = "순서를 입력 하세요.")
  @Size(max = 5, message = "순서 입력 길이를 확인 하세요.")
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

}
