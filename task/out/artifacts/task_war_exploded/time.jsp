<%--
  Created by IntelliJ IDEA.
  User: 柯淇文
  Date: 2020/12/3
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息已经提交</title>
    <style>
        p{
            text-align: center;
        }
        span{
            color: red;
        }
    </style>
</head>
<body>
<p>
    <span id="time">5</span>秒之后，自动关闭...
</p>
<script>
    // 定义一个方法，修改span
    window.alert("您的信息已经提交，同一信息不需要再次预约或者加入啦 (๑•́ωก̀๑) 稍等片刻后台会即刻更新");
    var second=6;
    var time= document.getElementById("time");
    function showtime(){
        second--;
        if(second<=0){
            close();
        }
        time.innerHTML=second+"";
    }
    setInterval(showtime,1000);
</script>
</body>
</html>
