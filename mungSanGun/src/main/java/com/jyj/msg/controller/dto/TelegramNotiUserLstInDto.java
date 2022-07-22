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
public class TelegramNotiUserLstInDto {
  @ApiModelProperty(value = "순서", example = "1", required = true)
  @NotEmpty(message = "순서를 입력 하세요.")
  @Size(max = 5, message = "순서 입력 길이를 확인 하세요.")
  private String IDX;

  @ApiModelProperty(value = "채팅 token", example = "채팅 token")
  private String TOKEN;
  
  @ApiModelProperty(value = "채팅id", example = "채팅id")
  private String CHATID;
  
  @ApiModelProperty(value = "사용유무", example = "Y")
  private String USEYN;
  
  @ApiModelProperty(value = "수정일자", example = "yyyymmdd")
  private String AUDITDTM;
  
  @ApiModelProperty(value = "수정 사용자", example = "testuser")
  private String AUDITID;
  
}
