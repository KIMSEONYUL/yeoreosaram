/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.dao
 * 파일명     : UserDao.java
 * 작성일     : 2021. 1. 19.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.icia.web.model.User2;

@Repository("userDao2")
public interface UserDao2
{
   public int userInsert2(User2 user2);
   
   public int userUpdate2(User2 user2);

   public int userStatusUpdate2(User2 user2);
   
   public User2 userSelect2(String userId2);
   
   //아이디 찾기
   public String findId(String userEmail2) throws Exception;
   
   //임시비번발급
   public int updatePwd(User2 user2) throws Exception;
   
   //비밀번호 찾기
   public User2 findPwd(@Param("userId2")String userId2, @Param("userEmail2") String userEmail2);
   
}