package com.icia.web.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icia.common.util.StringUtil;
import com.icia.web.model.Response;
import com.icia.web.model.User2;
import com.icia.web.dao.AdminDao;
import com.icia.web.model.Admin;
import com.icia.web.model.HiBoard;
import com.icia.web.model.Paging;
import com.icia.web.service.AdminService;
import com.icia.web.service.HiBoardService;
import com.icia.web.service.UserService2;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;

/*관리자 컨트롤러*/
@Controller("adminController")
public class AdminController 
{
   
   private static final int LIST_COUNT = 10;
   private static final int PAGE_COUNT = 10;
   
   //로그
   private static Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   // 쿠키명
   @Value("#{env['auth.cookie.name']}")
   private String AUTH_COOKIE_NAME;
   
   //서비스 호출   
   @Autowired
   private AdminService adminService;
   
   @Autowired
   private HiBoardService hiBoardService;
   
   @Autowired
   private UserService2 userService2;
   
 
   //로그인
   @RequestMapping(value="/admin/login2", method=RequestMethod.POST)
    @ResponseBody
      public Response<Object> login2(HttpServletRequest request, HttpServletResponse response)
      {
         String adminId = HttpUtil.get(request, "adminId");
         String adminPwd = HttpUtil.get(request, "adminPwd");
         
         Response<Object> ajaxResponse = new Response<Object>();
         
         if(!StringUtil.isEmpty(adminId) && !StringUtil.isEmpty(adminPwd))
         {
            Admin admin = adminService.adminSelect(adminId);
            
            if(admin != null)
            {
               if(StringUtil.equals(admin.getAdminPwd(), adminPwd))
               {
                  CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_NAME, CookieUtil.stringToHex(adminId));
                  
                  ajaxResponse.setResponse(0, "Success"); // 로그인 성공
               }
               else
               {
                  ajaxResponse.setResponse(-1, "Passwords do not match"); // 비밀번호 불일치
               }
            }
            else
            {
               ajaxResponse.setResponse(404, "Not Found"); // 사용자 정보 없음 (Not Found)
            }
         }
         else
         {
            ajaxResponse.setResponse(400, "Bad Request"); // 파라미터가 올바르지 않음 (Bad Request)
         }
         
         if(logger.isDebugEnabled())
         {
            logger.debug("[AdminController] /admin/login2 response 오류! \n" + JsonUtil.toJsonPretty(ajaxResponse));
         }
         
         return ajaxResponse;
         
      }//logIn2
   
   
   //로그아웃
   @RequestMapping(value="admin/logOut2", method=RequestMethod.GET)
   public String logOut2(HttpServletRequest request, HttpServletResponse response)
   {
      if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
      {
          CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
      }
      return "redirect:/";
   }//logOut
   
   //admin/index 이 페이지로 가기 위한 메서드
   @RequestMapping(value="/admin/index", method=RequestMethod.GET)
   public String index(HttpServletRequest request, HttpServletResponse response)
   {
      if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
      {
          CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
      }
      return "/admin/index";
   }
   
   //AdminHome
   @RequestMapping(value = "/admin/adminHome", method=RequestMethod.GET)
   public String mainHome(HttpServletRequest request, HttpServletResponse response)
   {
      return "/admin/adminHome";
   }
   
   //회원 리스트
   @Inject
   AdminDao adminDao;
   
   @RequestMapping(value = "admin/adminList")//, method = RequestMethod.GET)
   public String user2List (Model model) {
      List<Admin> list = adminDao.adminList();
      model.addAttribute("list", list);
      
      return "/admin/adminList";
   }
  
   /*원본
   @RequestMapping(value="/admin/list", method=RequestMethod.GET)
   public String view(HttpServletRequest request, HttpServletResponse response)
   {
      if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
      {
          CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
      }
      return "/admin/list";
   }*/
   
   @RequestMapping(value="/admin/list")
   public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      //if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
     // {
          //CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
        
        //게시물 리스트
          
         Admin admin = new Admin();
      
          List<Admin> list = adminDao.testList(admin);
          
           model.addAttribute("list", list);
           
     // }
      
      return "/admin/list";
   }
   /*
   @RequestMapping(value="/admin/view")
   public String view(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      //if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
     // {
          //CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
        
        //게시물 리스트
          
         Admin admin = new Admin();
         long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
           
          
           if(hiBbsSeq > 0)
           {
              logger.debug("===== 게시물 번호 [" + hiBbsSeq + "]==============================");
             admin = adminService.adminView(hiBbsSeq);
             //System.out.println("게시물 아이디 는"+admin.getAdminId());
       
           }else {
              logger.debug("===== 게시물 보기 오류==============================");
           }
           
           
           
           model.addAttribute("hiBbsSeq", hiBbsSeq);
           
           
     // }
      
      return "/admin/view";
   }*/
   
 /*게시물 조회*/
   @RequestMapping(value="/admin/view")
   public String view(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);

      //본인글 확인 여부
      String boardMe = "N";
      
      Admin admin = null;
      
      logger.debug("1111111111111111===================================================");
      logger.debug("===== hiBbsSeq [" + hiBbsSeq + "]==============================");
      
      
      //if(hiBbsSeq > 0)
      //{
         admin = adminService.adminView(hiBbsSeq);
         System.out.println("게시물 번호" + admin.getHiBbsSeq());
         System.out.println("게시물 제목" + admin.getHiBbsTitle());
         System.out.println("게시물 내용" + admin.getHiBbsContent());
         System.out.println("게시물 작성자" + admin.getAdminId());
         
      //}
      model.addAttribute("hiBbsSeq", hiBbsSeq);
      model.addAttribute("admin", admin);

      
      long totalCount = 0;
      //게시물 리스트
      List<Admin> list = adminDao.testList(admin);
      
      //게시물 답글 리스트
      List<Admin> replylist = null;
      
      

        replylist = adminService.testReplyList(admin);

      
        model.addAttribute("replylist", replylist);
      
      return "/admin/view";
   }
 //게시물 삭제
   @RequestMapping(value="/admin/adminListDelete", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> adminListDelete(HttpServletRequest request, HttpServletResponse response)
   {
      long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0); 
      
      Response<Object> ajaxResponse = new Response<Object>();
      
      
      if(hiBbsSeq > 0) {
         Admin admin = adminService.testSelect(hiBbsSeq);
         
         if(admin != null) {
            try {
               if(adminService.adminListDelete(admin.getHiBbsSeq()) > 0)
                   {
                      ajaxResponse.setResponse(0, "Seccess");
                   }
                   else
                   {
                      ajaxResponse.setResponse(500, "Internal Server Error");
                   }                  
            }catch(Exception e) {
               logger.error("[AdminController] /admin/adminListDelete Exception", e);
                     ajaxResponse.setResponse(500, "internal Server Error");
            }
         }else {
            ajaxResponse.setResponse(400, "Not Found");
         }
      }else {
         ajaxResponse.setResponse(400, "Bad Request");
      }
      
      if(logger.isDebugEnabled())
       {
          logger.debug("[AdminController] /admin/adminListDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
       }
      return ajaxResponse;
   }
   
   //게시물 댓글 삭제
   @RequestMapping(value="/admin/adminReplyDelete", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> AdminReplyDelete(HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);  
      //View.jsp에서 ajax를 통해 hiBbsSeq를 요청
      
      Response<Object> ajaxResponse = new Response<Object>();
      
      if(hiBbsSeq > 0)
      {
         Admin parentAdmin = adminService.testSelect(hiBbsSeq);
         
         if(parentAdmin != null)
         {
           // if(StringUtil.equals(parentAdmin.getUserId(), cookieUserId))   //현재 로그인 한 아이디와 게시판에 등록되어있는 아이디가 같은지 확인
           // {
               try
               {
                 
                                                      
                     if(adminService.adminReplyDelete(parentAdmin.getHiBbsSeq(), parentAdmin.getHiBbsOrder()) > 0)
                     {
                        ajaxResponse.setResponse(0, "Seccess");
                     }
                     else
                     {
                        ajaxResponse.setResponse(500, "Internal Server Error");
                     }                  
                  
               }
               catch(Exception e)
               {
                  logger.error("[AdminController] /admin/adminReplyDelete Exception", e);
                  ajaxResponse.setResponse(500, "internal Server Error");
               }
           // }
         /*
          * else { ajaxResponse.setResponse(400, "Not Found"); }
          */
         }
         else
         {
            ajaxResponse.setResponse(400, "Not Found");
         }
      }
      else
      {
         ajaxResponse.setResponse(400, "Bad Request");
      }
      
      if(logger.isDebugEnabled())
         {
            logger.debug("[AdminController] /admin/adminReplyDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
            
         }
      //else {
        //   logger.debug("댓삭 게시물번호 : "+ hiBbsSeq);
         //}
      
      return ajaxResponse;
      
      
   }
   //고객센터 리스트
   @RequestMapping(value="/admin/adminCustomerList")
   public String adminCustomerList(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      //if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
     // {
          //CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
        
        //게시물 리스트
          
         Admin admin = new Admin();
      
          List<Admin> adminCustomerList = adminDao.qList(admin);
          
           model.addAttribute("adminCustomerList", adminCustomerList);
           
     // }
      
      return "/admin/adminCustomerList";
   }
   //고객센터 게시글 보기
   @RequestMapping(value="/admin/view3")
   public String view3(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      long qnaHiBbsSeq = HttpUtil.get(request, "qnaHiBbsSeq", (long)0);

      //본인글 확인 여부
      String boardMe = "N";
      
      Admin admin = null;
      
      logger.debug("1111111111111111===================================================");
      logger.debug("===== qnaHiBbsSeq [" + qnaHiBbsSeq + "]==============================");
      
      
      //if(hiBbsSeq > 0)
      //{
         admin = adminService.adminqView(qnaHiBbsSeq);
         //System.out.println("게시물 번호" + admin.getQnaHiBbsSeq());
         //System.out.println("게시물 제목" + admin.getQnaHiBbsTitle());
         //System.out.println("게시물 내용" + admin.getQnaHiBbsContent());
//         System.out.println("게시물 작성자" + admin.getAdminId()); => 콘솔창에서 확인하려고 만든 프린트문들임
         
      //}
      model.addAttribute("qnaHiBbsSeq", qnaHiBbsSeq);
      model.addAttribute("admin", admin);

      
      long totalCount = 0;
      //게시물 리스트
      List<Admin> adminCustomerList = adminDao.qList(admin);
      
      //게시물 답글 리스트
//      List<Admin> replylist = null;
//      
//        replylist = adminService.testReplyList(admin); //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
//      
//        model.addAttribute("replylist", replylist);
      
      return "/admin/view3";
   }
   
 //고객센터 게시물 삭제
   @RequestMapping(value="/admin/adminqListDelete", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> adminqListDelete(HttpServletRequest request, HttpServletResponse response)
   {
      long qnaHiBbsSeq = HttpUtil.get(request, "qnaHiBbsSeq", (long)0); 
      
      Response<Object> ajaxResponse = new Response<Object>();
      
      
      if(qnaHiBbsSeq > 0) {
         Admin admin = adminService.qSelect(qnaHiBbsSeq);
         
         if(admin != null) {
            try {
               if(adminService.adminqListDelete(admin.getQnaHiBbsSeq()) > 0)
                   {
                      ajaxResponse.setResponse(0, "Seccess");
                   }
                   else
                   {
                      ajaxResponse.setResponse(500, "Internal Server Error");
                   }                  
            }catch(Exception e) {
               logger.error("[AdminController] /admin/adminqListDelete Exception", e);
                     ajaxResponse.setResponse(500, "internal Server Error");
            }
         }else {
            ajaxResponse.setResponse(400, "Not Found");
         }
      }else {
         ajaxResponse.setResponse(400, "Bad Request");
      }
      
      if(logger.isDebugEnabled())
       {
          logger.debug("[AdminController] /admin/adminqListDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
       }
      return ajaxResponse;
   }
 //고객센터 답변 보기form
   @RequestMapping(value="/admin/adminReplyForm", method=RequestMethod.POST)
   public String adminReplyForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
     
      long qnaHiBbsSeq = HttpUtil.get(request, "qnaHiBbsSeq", (long)0);
      
      String searchType = HttpUtil.get(request, "searchType");
      String searchValue = HttpUtil.get(request, "searchValue");
      long curPage = HttpUtil.get(request, "curPage", (long)1);
      
      //Qna qna = null;
      Admin admin = null;


      if(qnaHiBbsSeq > 0)
      {
         admin = adminService.qSelect(qnaHiBbsSeq);      
      }
      
      model.addAttribute("searchType", searchType);   //첫번째 매개변수는 board/replyForm에서 쓸 변수이름, 두번째 매개변수는 이 메소드에서 받은 값
      model.addAttribute("searchValue", searchValue);
      model.addAttribute("curPage", curPage);
      model.addAttribute("admin", admin);
                  
      return "/admin/adminReplyForm";
   }
 

   /*------------------고객센터 답변 쓰기 proc 시작------------------*/
   //게시물 답변
   @RequestMapping(value="/admin/adminReplyProc", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> adminReplyProc(MultipartHttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       
      long qnaHiBbsSeq = HttpUtil.get(request, "qnaHiBbsSeq", (long)0);
      String qnaHiBbsTitle = HttpUtil.get(request, "qnaHiBbsTitle", "");
      String qnaHiBbsContent = HttpUtil.get(request, "qnaHiBbsContent", "");
      
      Response<Object> ajaxResponse = new Response<Object>();
      
      if(qnaHiBbsSeq > 0 && !StringUtil.isEmpty(qnaHiBbsTitle) && !StringUtil.isEmpty(qnaHiBbsContent))
      {
         Admin parentQna = adminService.qSelect(qnaHiBbsSeq);      //댓글은 부모밑에 있기때문에 parent라고 써줌
         
         if(parentQna != null)
         {
            //Qna qna = new Qna();
            Admin admin = new Admin();
            
            admin.setUserId(cookieUserId);
            admin.setQnaHiBbsTitle(qnaHiBbsTitle);
            admin.setQnaHiBbsContent(qnaHiBbsContent);
            admin.setQnaHiBbsGroup(parentQna.getQnaHiBbsGroup());
            admin.setQnaHiBbsOrder(parentQna.getQnaHiBbsOrder() + 1);
            admin.setQnaHiBbsIndent(parentQna.getQnaHiBbsIndent() + 1);
            admin.setQnaHiBbsParent(qnaHiBbsSeq);
           
            try
            {
               if(adminService.adminReplyInsert(admin) > 0)
               {
                  ajaxResponse.setResponse(0, "Success", admin);
               }
               else
               {
                  ajaxResponse.setResponse(500, "Internal Server Error");
               }
            }
            catch(Exception e)
            {
               logger.error("[AdminController] /admin/adminReplyProc Exception", e);
               ajaxResponse.setResponse(500, "Internal Server Error");
            }         
         }
         else
         {
            ajaxResponse.setResponse(404, "Not Found");
         }
         
      }
      else
      {
         ajaxResponse.setResponse(400, "Bad Request");
      }
      
      if(logger.isDebugEnabled())
         {
            logger.debug("[AdminController] /admin/adminReplyProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
         }
            
      return ajaxResponse;
   }
   
 /*------------------고객센터 proc 끝------------------*/
   
   

   ////////////////////////////////
   
   //회원 강제탈퇴, 강탈 페이지로 연결
   @RequestMapping("admin/adminDelete")
   public String adminDelete() {
      
      return "/admin/adminDelete";
   }
   
   //회원 강제탈퇴 버튼 누를 시
   @RequestMapping(value="/admin/adminDeleteForm", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> adminDelete(HttpServletRequest request, HttpServletResponse response)
   {
      String userId2 = HttpUtil.get(request, "userId2", "");         
      
      Response<Object> ajaxResponse = new Response<Object>();
      
      if(userId2 != null)
      {
         Admin admin = adminService.userSelect(userId2);
         
         if(admin != null)
         {
            
               try
               {                                       
                     if(adminService.userDelete(userId2) > 0)
                     {
                        ajaxResponse.setResponse(0, "Seccess");
                     }
                     else
                     {
                        ajaxResponse.setResponse(500, "Internal Server Error");
                     }                  
                  
               }
               catch(Exception e)
               {
                  logger.error("[AdminController] /admin/delete Exception", e);
                  ajaxResponse.setResponse(500, "internal Server Error");
               }
            
         }
         else
         {
            ajaxResponse.setResponse(400, "Not Found");
         }
      }
      else
      {
         ajaxResponse.setResponse(400, "Bad Request");
      }
      
      if(logger.isDebugEnabled())
         {
            logger.debug("[AdminController] /admin/delete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
         }
      
      return ajaxResponse;
      
      
   }

   
}