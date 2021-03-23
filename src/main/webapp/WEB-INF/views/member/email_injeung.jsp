<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
</head>
<body>
 
<table border="2" width="300" height="300" align= "center">

<center>
<br>
<br>
<br>
<br>
<br>
<br>
<span style="color: black; font-weight: bold; font-size:x-large">인증번호를 입력하세요.</span> 
      <br> 
      <br>    

        
            <tr style="text-align:center;">        
                <td>
                
                    
                    <form action="/member/join_injeung.do${dice}" method="post">                
                        <div style="color:black">
                            인증번호 : <input type="number" name="email_injeung"
                                placeholder="인증번호를 입력하세요.">
                        </div>                                        
                      <input type="hidden" id="tomail" name="tomail" value="${tomail}" />
                        <br>
                        <br>
                      <button class="btn btn-outline-warning" type="submit" name="submit">인증번호 전송</button>
                    </form>
                  </td>
                </tr>
</center>
</table>

 
</body>
</html>