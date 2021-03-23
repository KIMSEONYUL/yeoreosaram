package com.icia.web.model;

import java.io.Serializable;

public class PlanMake implements Serializable {

   private static final long serialVersionUID = 1L;
   
   private long pNoSeq;
   private long pNoSeq2;
   private String userId2;
   private String pTitle;
   private String regDate2;
   private String pStart;
   private String pEnd;
   
   
   
   //생성자
   public PlanMake()
   {
      pNoSeq=0;
      pNoSeq2=0;
      userId2="";
      pTitle="";
      regDate2="";
      pStart="";
      pEnd="";
   }
   
   public long getpNoSeq2() {
      return pNoSeq2;
   }

   public void setpNoSeq2(long pNoSeq2) {
      this.pNoSeq2 = pNoSeq2;
   }
   
public long getpNoSeq() {
   return pNoSeq;
}

public String getUserId2() {
   return userId2;
}

public String getpTitle() {
   return pTitle;
}

public String getRegDate2() {
   return regDate2;
}

public String getpStart() {
   return pStart;
}

public String getpEnd() {
   return pEnd;
}

public void setpNoSeq(long pNoSeq) {
   this.pNoSeq = pNoSeq;
}

public void setUserId2(String userId2) {
   this.userId2 = userId2;
}

public void setpTitle(String pTitle) {
   this.pTitle = pTitle;
}

public void setRegDate2(String regDate2) {
   this.regDate2 = regDate2;
}

public void setpStart(String pStart) {
   this.pStart = pStart;
}

public void setpEnd(String pEnd) {
   this.pEnd = pEnd;
}

   

   
}