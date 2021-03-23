/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.controller
 * 파일명     : IndexController.java
 * 작성일     : 2021. 1. 21.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icia.web.model.User2;
import com.icia.web.service.UserService2;
import com.icia.web.util.CookieUtil;

/**
 * <pre>
 * 패키지명   : com.icia.web.controller
 * 파일명     : IndexController.java
 * 작성일     : 2021. 1. 21.
 * 작성자     : daekk
 * 설명       : 인덱스 컨트롤러
 * </pre>
 */
@Controller("indexController")
public class IndexController
{
   @Value("#{env['auth.cookie.name']}")
   private String AUTH_COOKIE_NAME;
   
   @Autowired
   private UserService2 userService2;
   
   private static Logger logger = LoggerFactory.getLogger(IndexController.class);

   /**
    * <pre>
    * 메소드명   : index
    * 작성일     : 2021. 1. 21.
    * 작성자     : daekk
    * 설명       : 인덱스 페이지 
    * </pre>
    * @param request  HttpServletRequest
    * @param response HttpServletResponse
    * @return String
    */
   @RequestMapping(value = "/index", method=RequestMethod.GET)
   public String index(HttpServletRequest request, HttpServletResponse response)
   {
      return "/index";
   }
   
   //mainPage
   @RequestMapping(value = "/mainHome", method=RequestMethod.GET)
   public String mainHome(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      
      User2 user2 = null;
      
      if(cookieUserId != null)
      {
         user2 = userService2.userSelect2(cookieUserId);
      }
      
      model.addAttribute("user2", user2);
      
      return "/travel/mainHome";
   }
   
   @RequestMapping(value = "/userSearch", method=RequestMethod.GET)
   public String userSearch(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
   	return "/user/userSearch";
   }

}