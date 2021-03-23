package com.icia.web.model;

public class Admin {
   
   private static final long serialVersionUID = 1L;
   
   private String adminId;
   private String adminPwd;
   
   private String userId2; 
   private String userPwd2;
   private String userName2;
   private String userEmail2;
   private String regDate2;
   
   private long hiBbsSeq;            //게시물 번호
   private String userId;               //사용자 아이디
   private long hiBbsGroup;         //게시물 그룹번호
   private int hiBbsOrder;            //게시물 그룹 내 순서
   private int hiBbsIndent;            //게시물들 들여쓰기
   private String hiBbsTitle;         //게시물 제목
   private String hiBbsContent;      //게시물 내용
   private int hiBbsReadCnt;         //게시물 조회수
   //private String regDate;            //등록일
   private long hiBbsParent;         //부모 게시물 번호
   private String plan;   
   private String userName;         //사용자 이름
   private String userEmail;         //사용자 이메일
   private String gender;            //사용자 성별
   private String gender2;            //사용자 성별
   


private long qnaHiBbsSeq;      //게시물 번호
   //private String userId;   //사용자 아이디
   private long qnaHiBbsGroup;   //게시물 그룹번호
   private int qnaHiBbsOrder;      //게시물 그룹내 순서
   private int qnaHiBbsIndent;      //게시물 들여쓰기
   private String qnaHiBbsTitle;   //게시물 제목
   private String qnaHiBbsContent; //게시물 내용
   private int qnaHiBbsReadCnt;   //게시물 조회수
   private String regDate;      //등록일
   private long qnaHiBbsParent;   //부모 게시물 번호
   
   public Admin()
   {
      adminId="";
      adminPwd="";
      
      userId2="";
      userPwd2="";
      userName2="";      
      userEmail2="";        
      regDate2 = "";
      
      hiBbsSeq=0;            
      userId="";               
      hiBbsGroup=0;         
      hiBbsOrder=0;            
      hiBbsIndent=0;            
      hiBbsTitle="";         
      hiBbsContent="";      
      hiBbsReadCnt=0;         
     //regDate="";     
      hiBbsParent=0;
      plan = "";
      
      userName ="";   //사용자 이름
      userEmail = "";   //사용자이메일   
      
      qnaHiBbsSeq = 0;      //게시물 번호
      qnaHiBbsGroup = 0;   //게시물 그룹번호
      qnaHiBbsOrder =0;      //게시물 그룹내 순서
      qnaHiBbsIndent =0;      //게시물 들여쓰기
      qnaHiBbsTitle = "";   //게시물 제목
      qnaHiBbsContent = ""; //게시물 내용
      qnaHiBbsReadCnt = 0;   //게시물 조회수
      regDate = "";      //등록일
      //qnaHiBoardFile = null; //첨부파일
      qnaHiBbsParent = 0;
   }
   public String getRegDate2() {
      return regDate2;
   }

   public void setRegDate2(String regDate2) {
      this.regDate2 = regDate2;
   }

   public String getGender2() {
      return gender2;
   }

   public void setGender2(String gender2) {
      this.gender2 = gender2;
   }
   
   public String getGender() {
   return gender;
}

public void setGender(String gender) {
   this.gender = gender;
}

   public String getPlan() {
   return plan;
}

public void setPlan(String plan) {
   this.plan = plan;
}

/*adminId, adminPwd getter/setter*/
   public String getAdminId() {
      return adminId;
   }

   public String getAdminPwd() {
      return adminPwd;
   }

   public void setAdminId(String adminId) {
      this.adminId = adminId;
   }

   public void setAdminPwd(String adminPwd) {
      this.adminPwd = adminPwd;
   }
      
   /*tbl_user2 테이블의 id,pwd,name,email getter/setter*/
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
   
   /*HIBBS 테이블 getter/setter*/
   public long getHiBbsSeq() {
      return hiBbsSeq;
   }
   public void setHiBbsSeq(long hiBbsSeq) {
      this.hiBbsSeq = hiBbsSeq;
   }
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public long getHiBbsGroup() {
      return hiBbsGroup;
   }
   public void setHiBbsGroup(long hiBbsGroup) {
      this.hiBbsGroup = hiBbsGroup;
   }
   public int getHiBbsOrder() {
      return hiBbsOrder;
   }
   public void setHiBbsOrder(int hiBbsOrder) {
      this.hiBbsOrder = hiBbsOrder;
   }
   public int getHiBbsIndent() {
      return hiBbsIndent;
   }
   public void setHiBbsIndent(int hiBbsIndent) {
      this.hiBbsIndent = hiBbsIndent;
   }
   public String getHiBbsTitle() {
      return hiBbsTitle;
   }
   public void setHiBbsTitle(String hiBbsTitle) {
      this.hiBbsTitle = hiBbsTitle;
   }
   public String getHiBbsContent() {
      return hiBbsContent;
   }
   public void setHiBbsContent(String hiBbsContent) {
      this.hiBbsContent = hiBbsContent;
   }

   public int getHiBbsReadCnt() {
      return hiBbsReadCnt;
   }

   public void setHiBbsReadCnt(int hiBbsReadCnt) {
      this.hiBbsReadCnt = hiBbsReadCnt;
   }

   public long getHiBbsParent() {
      return hiBbsParent;
   }

   public void setHiBbsParent(long hiBbsParent) {
      this.hiBbsParent = hiBbsParent;
   }
   
   /*HIBOARD name,email getter/setter*/
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getUserEmail() {
      return userEmail;
   }
   public void setUserEmail(String userEmail) {
      this.userEmail = userEmail;
   }
   

  /*QnA getter/setter*/ 
   public long getQnaHiBbsSeq() {
      return qnaHiBbsSeq;
   }
   public void setQnaHiBbsSeq(long qnaHiBbsSeq) {
      this.qnaHiBbsSeq = qnaHiBbsSeq;
   }
   public long getQnaHiBbsGroup() {
      return qnaHiBbsGroup;
   }
   public void setQnaHiBbsGroup(long qnaHiBbsGroup) {
      this.qnaHiBbsGroup = qnaHiBbsGroup;
   }
   public int getQnaHiBbsOrder() {
      return qnaHiBbsOrder;
   }
   public void setQnaHiBbsOrder(int qnaHiBbsOrder) {
      this.qnaHiBbsOrder = qnaHiBbsOrder;
   }
   public int getQnaHiBbsIndent() {
      return qnaHiBbsIndent;
   }
   public void setQnaHiBbsIndent(int qnaHiBbsIndent) {
      this.qnaHiBbsIndent = qnaHiBbsIndent;
   }
   public String getQnaHiBbsTitle() {
      return qnaHiBbsTitle;
   }
   public void setQnaHiBbsTitle(String qnaHiBbsTitle) {
      this.qnaHiBbsTitle = qnaHiBbsTitle;
   }
   public String getQnaHiBbsContent() {
      return qnaHiBbsContent;
   }
   public void setQnaHiBbsContent(String qnaHiBbsContent) {
      this.qnaHiBbsContent = qnaHiBbsContent;
   }
   public int getQnaHiBbsReadCnt() {
      return qnaHiBbsReadCnt;
   }
   public void setQnaHiBbsReadCnt(int qnaHiBbsReadCnt) {
      this.qnaHiBbsReadCnt = qnaHiBbsReadCnt;
   }
   public String getRegDate() {
      return regDate;
   }
   
   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }
   public long getQnaHiBbsParent() {
      return qnaHiBbsParent;
   }
   public void setQnaHiBbsParent(long qnaHiBbsParent) {
      this.qnaHiBbsParent = qnaHiBbsParent;
   }


   

}