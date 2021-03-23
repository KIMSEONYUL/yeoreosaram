package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.common.util.FileUtil;
import com.icia.web.dao.HiBoardDao;
import com.icia.web.dao.QnaDao;
import com.icia.web.model.HiBoard;
import com.icia.web.model.HiBoardFile;
import com.icia.web.model.Qna;
import com.icia.web.model.QnaHiBoardFile;

@Service("qnaService")
public class QnaService {
   
   private static Logger logger = LoggerFactory.getLogger(QnaService.class);
   
   //파일 저장 디렉토리
      @Value("#{env['upload.save.dir']}")
      private String UPLOAD_SAVE_DIR;
      
      @Autowired
      private QnaDao qnaDao;
      
      //게시물 삭제(파일이 있는 경우 같이 삭제)
      @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
      public int qnaDelete(long qnaHiBbsSeq) throws Exception
      {
         int count = 0;
         
         Qna qna = qnaView(qnaHiBbsSeq);
         
         if(qna != null)
         {
            count = qnaDao.qnaDelete(qnaHiBbsSeq);
            
            if(count > 0)
            {
               QnaHiBoardFile qnaHiBoardFile = qna.getQnaHiBoardFile();
               
               if(qnaHiBoardFile != null) //첨부파일이 있다는 의미
               {
                  if(qnaDao.qnaHiBoardFileDelete(qnaHiBbsSeq) > 0)
                  {
                     logger.debug("=======================delete file : " + UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + qnaHiBoardFile.getQnaFileName());
                     FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + qnaHiBoardFile.getQnaFileName());
                     
                  }
               }
            }
         }
         
         return count;
      }
      
      //총 게시물 수
      public long qnaListCount(Qna qna)
      {
         long count = 0;
         
         try
         {
            count = qnaDao.qnaListCount(qna);
         }
         catch(Exception e)
         {
            logger.error("[QnaService] qnaListCount Exception", e);
         }
         
         return count;
      }
      
      @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
      public int qnaInsert(Qna qna) throws Exception
      {
         int count = qnaDao.qnaInsert(qna);
         
         //게시물 등록이 되었으면, 첨부파일이 있다면 첨부파일 등록
         if(count > 0 && qna.getQnaHiBoardFile() != null)
         {
            QnaHiBoardFile qnaHiBoardFile = qna.getQnaHiBoardFile();
            
            qnaHiBoardFile.setQnaHiBbsSeq(qna.getQnaHiBbsSeq());
            qnaHiBoardFile.setQnaFileSeq((short)1);
            
            qnaDao.qnaHiBoardFileInsert(qnaHiBoardFile);
         }
         
         return count;
      }
      
    //게시물 조회
      public Qna qnaSelect(long qnaHiBbsSeq)
      {
         Qna qna = null;
         
         try
         {
            qna = qnaDao.qnaSelect(qnaHiBbsSeq);
         }
         catch(Exception e)
         {
            logger.error("[QnaService] qnaSelect Exception", e);
         }
         
         return qna;
      }
      
      //게시물 보깅
      public Qna qnaView(long qnaHiBbsSeq)
      {
         Qna qna = null;
         
         try
         {
            qna = qnaDao.qnaSelect(qnaHiBbsSeq);
            
            if(qna != null)
            {
               //조회수 증가 처리
               qnaDao.qnaReadCntPlus(qnaHiBbsSeq);
               
               QnaHiBoardFile qnaHiBoardFile = qnaDao.qnaHiBoardFileSelect(qna.getQnaHiBbsSeq());
               
               if(qnaHiBoardFile != null)
               {
                  qna.setQnaHiBoardFile(qnaHiBoardFile);
               }
            }
         }
         catch(Exception e)
         {
            logger.error("[QnaService] qnaView Exception", e);
         }
         
         return qna;
      }
      
      @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
      public int qnaReplyInsert(Qna qna) throws Exception
      {
         qnaDao.qnaGroupOrderUpdate(qna);
         
         int count = qnaDao.qnaReplyInsert(qna);
         
         if(count > 0 && qna.getQnaHiBoardFile() != null)   //파일이 있을 경우
         {
            QnaHiBoardFile qnaHiBoardFile = qna.getQnaHiBoardFile();
            
            qnaHiBoardFile.setQnaHiBbsSeq(qna.getQnaHiBbsSeq());
            qnaHiBoardFile.setQnaFileSeq((short)1);
            
            qnaDao.qnaHiBoardFileInsert(qnaHiBoardFile);
         }
         
         return count;
      }
      
      //게시물 수정
      @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
      public int qnaUpdate(Qna qna) throws Exception
      {
         int count = qnaDao.qnaUpdate(qna);
         
         if(count > 0 && qna.getQnaHiBoardFile() != null)
         {
            QnaHiBoardFile delHiBoardFile = qnaDao.qnaHiBoardFileSelect(qna.getQnaHiBbsSeq());
            
            //기존 파일이 있으면 삭제
            if(delHiBoardFile != null)
            {
               logger.debug("delete file info" + UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + delHiBoardFile.getQnaFileName());
               FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + delHiBoardFile.getQnaFileName());  
               
               qnaDao.qnaHiBoardFileDelete(qna.getQnaHiBbsSeq());
            }
            QnaHiBoardFile qnaHiBoardFile = qna.getQnaHiBoardFile();
            
            qnaHiBoardFile.setQnaHiBbsSeq(qna.getQnaHiBbsSeq());
            qnaHiBoardFile.setQnaFileSeq((short)1);
            
            qnaDao.qnaHiBoardFileInsert(qna.getQnaHiBoardFile());
         }
         
         return count;
      }
      
      public int qnaAnswersCount(long qnaHiBbsSeq)
      {
         int count = 0;
         
         try
         {
            count = qnaDao.qnaAnswersCount(qnaHiBbsSeq);
         }
         catch(Exception e)
         {
            logger.error("[QnaService] qnaAnswersCount Exception", e);
         }
         
         return count;
      }
      
      //게시물 리스트
      public List<Qna> qnaList(Qna qna)
      {
         List<Qna> list = null;
         
         try
         {
            list = qnaDao.qnaList(qna);
         }
         catch(Exception e)
         {
            logger.error("[QnaService] qnaList Exception", e);
         }
         
         return  list;
      }
      

}