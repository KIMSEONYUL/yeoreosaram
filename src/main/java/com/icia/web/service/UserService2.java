package com.icia.web.service;

import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.web.dao.UserDao2;
import com.icia.web.model.Response;
import com.icia.web.model.User2;


@Service("userService2")
public class UserService2
{
   private static Logger logger = LoggerFactory.getLogger(UserService2.class);
   
   @Autowired
   private UserDao2 userDao2;
   private SqlSessionTemplate sqlSession;
   
   @Inject
   JavaMailSender mailSender;
   
   public int userInsert2(User2 user2)
   {
      int count = 0;
      
      try
      {
         count = userDao2.userInsert2(user2);
      }
      catch(Exception e)
      {
         logger.error("[UserService2] userInsert2 Exception", e);
      }
      
      return count;
   }

   public User2 userSelect2(String userId2)
   {
      User2 user2 = null;
      
      try
      {
         user2 = userDao2.userSelect2(userId2);
      }
      catch(Exception e)
      {
         logger.error("[UserService2] userSelect2 Exception", e);
      }
      
      return user2;
   }
   
	public int userUpdate2(User2 user2)
	{
		int count = 0;
		
		try
		{
			count = userDao2.userUpdate2(user2);
		}
		catch(Exception e)
		{
			logger.error("[UserService2] userUpdate2 Exception", e);
		}
		
		return count;
	}
	
	public int userStatusUpdate2(User2 user2)
	{
		int count = 0;
		
		try
		{
			count = userDao2.userStatusUpdate2(user2);
		}
		catch(Exception e)
		{
			logger.error("[UserService2] userStatusUpdate2 Exception", e);
		}
		
		return count;
	}
	
	//아이디찾기
	public String findId(String userEmail2) throws Exception{
		return sqlSession.selectOne("user.findId", userEmail2);
	}
	
	
    public String findId(HttpServletResponse response, String userEmail2) throws Exception{
    	response.setContentType("text/html;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	String userId2 = userDao2.findId(userEmail2);
    	
    	if(userId2 == null) {
    		out.println("<script>");
    		out.println("alert('가입된 아이디가 없습니다.');");
    		out.println("history.go(-1);");
    		out.println("</script>");
    		out.close();
    		return null;
    	}
    	else {
    		return userId2;
    	}
    }
    
    //비번변경
    @Transactional
    public int updatePwd(User2 user2) throws Exception{
    	return sqlSession.update("com.icia.web.dao.UserDao2.updatePwd", user2);
    }
    
    ////////////////////////////////////////////////////
    public User2 findPwd(String userId2, String userEmail2)
    {
       User2 user2 = null;
       
       try
       {
    	user2 = userDao2.findPwd(userId2, userEmail2);
       }
       catch(Exception e)
       {
          logger.error("[UserService2] findPwd Exception", e);
       }
       
       return user2;
    }
    
    
 }