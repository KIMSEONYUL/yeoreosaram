package com.icia.web.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

/**
 * @author ahneunhee
 *
 */
public class User2 implements Serializable
{
	private static final long serialVersionUID = 3590858770663735301L;
	SqlSession sqlSession;
	
	private String userId2;    // 사용자 아이디
	private String userPwd2;   // 비밀번호
	private String userPwd3;	//비밀번호확인
	private String userName2;  // 사용자 명
	private String userEmail2; // 사용자 이메일 
	private String status2;    // 상태 ("Y":사용, "N":정지)
	private String regDate2;   // 등록일
	private String gender2;	//성별 ("F":여자, "M":남자)
	private String userBirth2;		//생년월일 (8글자)

	/**
	 * 생성자 
	 */
	public User2()
	{
		userId2 = "";
		userPwd2 = "";
		userName2 = "";
		userEmail2 = "";
		status2 = "";
		regDate2 = "";
		gender2 = "";
		userBirth2 = "";
	}

	public String getUserId2() {
		return userId2;
	}

	public void setUserId2(String userId2) {
		this.userId2 = userId2;
	}

	public String getUserPwd2() {
		return userPwd2;
	}

	public void setUserPwd2(String userPwd2) {
		this.userPwd2 = userPwd2;
	}
	public String getUserPwd3() {
		return userPwd3;
	}

	public void setUserPwd3(String userPwd3) {
		this.userPwd3 = userPwd3;
	}
	
	public String getUserName2() {
		return userName2;
	}

	public void setUserName2(String userName2) {
		this.userName2 = userName2;
	}

	public String getUserEmail2() {
		return userEmail2;
	}

	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}

	public String getStatus2() {
		return status2;
	}

	public void setStatus2(String status2) {
		this.status2 = status2;
	}

	public String getGender2() {
		return gender2;
	}

	public void setGender2(String gender2) {
		this.gender2 = gender2;
	}

	public String getRegDate2() {
		return regDate2;
	}

	public void setRegDate2(String regDate2) {
		this.regDate2 = regDate2;
	}

	public String getUserBirth2() {
		return userBirth2;
	}

	public void setUserBirth2(String userBirth2) {
		this.userBirth2 = userBirth2;
	}
	
	


	/*추가한 부분*/
	/*회원정보삭제처리*/
	public void userDelete(String userId2) {
		sqlSession.update("User2.deleteUser2",userId2);
	}
	


}