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
<span style="color: black; font-weight: bold; font-size:x-large">이메일 인증 (이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</span> 
<br> <br>    

 
            <tr style="text-align:center;">        
                 <td>
                    <br>
                    <form action="auth.do" method="post">
                        <div style="color:black">
                            이메일 : <input type="email" id="e_mail" name="e_mail"
                                placeholder="이메일을 입력하세요.">
                        </div>                                                    
                        <br>
                        <br>
                        <button class="btn btn-outline-warning" type="submit" name="submit">이메일 인증 받기 (이메일 보내기)</button>
                   </form>                 
                  </td>
              </tr>

</center>
</table>
</body>
</html>