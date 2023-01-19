package com.jyj.msg.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyInterceptor extends HandlerInterceptorAdapter {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		logger.info("===========================          START         ===========================");
		logger.info(" Request URI \t:  " + request.getRequestURI());
		try {
			if(request.getRequestURI().equals("/createOrderItemLst.do")
					|| request.getRequestURI().equals("/getOrderItemLst.do")
                    || request.getRequestURI().equals("/")
                    || request.getRequestURI().equals("")
                    || request.getRequestURI().equals("/admin-page-lst")
                    || request.getRequestURI().equals("/modifyAdminPage")
                    || request.getRequestURI().equals("/removeAdminPage")
                    || request.getRequestURI().equals("/user-page")
                    || request.getRequestURI().equals("/admin-page-lst-main")
                    || request.getRequestURI().equals("/modifyAdminPage")
                    || request.getRequestURI().equals("/modifyAdminPage")
                    || request.getRequestURI().equals("/excelDownload")
                    || request.getRequestURI().equals("/excelUpload")
                    || request.getRequestURI().equals("/getlistproductdtllst")
                    || request.getRequestURI().equals("/getlist-product-lst")
                    || request.getRequestURI().equals("/create-product-lst")
                    || request.getRequestURI().equals("/remove-product-lst")
                    || request.getRequestURI().equals("/modify-product-lst")
                    || request.getRequestURI().equals("/admin-page-lst-sub")
                    || request.getRequestURI().equals("/admin-page-lst-sub-pop")
                    || request.getRequestURI().equals("/user-page-lst-sub-pop")
                    || request.getRequestURI().equals("/get-list-product-dtl-lst")
                    || request.getRequestURI().equals("/create-product-dtl-lst")
                    || request.getRequestURI().equals("/remove-product-dtl-lst")
                    || request.getRequestURI().equals("/modify-product-dtl-lst")
                    || request.getRequestURI().equals("/admin-page-product-code")
                    || request.getRequestURI().equals("/admin-page-shop-code")
                    || request.getRequestURI().equals("/modify-shop-lst")
                    || request.getRequestURI().equals("/remove-shop-lst")
                    || request.getRequestURI().equals("/create-shop-lst")
                    || request.getRequestURI().equals("/product-lst")
                    || request.getRequestURI().equals("/user-main")
                    || request.getRequestURI().equals("/getlst-excel-lst")
                    || request.getRequestURI().equals("/excelUploadMain")
                    || request.getRequestURI().equals("/create-product-lst-bigdata")
                    || request.getRequestURI().equals("/create-product-dtl-lst-bigdata")
			   ) {
				return true;
			} 
			if (request.getSession().getAttribute("_loginSession_") == null
					/*
					   && (request.getRequestURI().equals("/getlst-excel-lst.do")
						|| request.getRequestURI().equals("/excelUploadMain.do")
						*/
			          ) {
				response.sendRedirect("/userLogin.do");
				return false;
			} else if (request.getSession().getAttribute("_loginSession_") != null
					/*
					   && (request.getRequestURI().equals("/getlst-excel-lst.do")
						|| request.getRequestURI().equals("/excelUploadMain.do")
						*/
			          ) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		
		logger.info("===========================          END           ===========================");
	}

}
	