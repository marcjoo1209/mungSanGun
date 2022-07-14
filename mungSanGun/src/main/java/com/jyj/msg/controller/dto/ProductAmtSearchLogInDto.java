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
public class ProductAmtSearchLogInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  @NotEmpty(message = "순서를 입력 하세요.")
  @Size(max = 5, message = "순서 입력 길이를 확인 하세요.")
  private String IDX;

  @ApiModelProperty(value = "분석 대상 순서", example = "1")
  private String PRODUCTIDX;
  
  @ApiModelProperty(value = "전송 메시지", example = "1")
  private String ALAMMSG;
  
  @ApiModelProperty(value = "생성일자", example = "1")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "생성 사용자 아이디", example = "1")
  private String AUDITID;
  
  @ApiModelProperty(value = "알림 여부", example = "1")
  private String ALAMYN;

}
