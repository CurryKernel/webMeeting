<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript">
        function checkName1() {
            //获取页面输入的用户名
            var userId = document.getElementById("userId").value;
            //1.创建AJAX对象
            var xhr = new XMLHttpRequest();
            //2.新建请求 (请求方式 请求地址 是否同步)
            var name_reg = /^\d{3,5}$/; //正则表达式
            xhr.open("post", "${pageContext.request.contextPath}/UserServlet.do", true);
            //3.请求头
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            //4.请求体
            xhr.send("method=validateName&userId="+userId);
            //5.前后台交互验证
            if (userId.length == 0 || !name_reg.test(userId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("userId").focus();
            }
            // document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
            else {
                xhr.onreadystatechange = function () {
                    //正常交互
                    if (xhr.status == 200 && xhr.readyState == 4) {
                        //得到返回结果,并利用结果判断用户名是否可用
                        var result = xhr.responseText;
                        //返回true,可用
                        if ("true" == result) {
                            //判用户名是否为空
                            if (userId == null || userId == "") {
                                //name_Span.style.color = "red";
                                //name_Span.innerHTML = "用户名不可为空";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名不可为空</em>";
                                document.getElementById("userId").focus();
                            } else {
                                //name_Span.style.color = "green";
                                //name_Span.innerHTML = "用户名可用";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名可用</em>";
                            }
                        } else {  //返回false,用户名不可用
                            //name_Span.style.color = "red";
                            //name_Span.innerHTML = "用户名不可用";
                            document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名已被注册</em>";
                            document.getElementById("userId").focus();
                        }
                    }
                }
            }
        }
        function checkName4() {
            //获取页面输入的用户名
            var organizeId = document.getElementById("organizeId").value;
            //1.创建AJAX对象
            var xhr = new XMLHttpRequest();
            //2.新建请求 (请求方式 请求地址 是否同步)
            var name_reg = /^\d{3,5}$/; //正则表达式
            xhr.open("post", "${pageContext.request.contextPath}/OrganizeServlet.do", true);
            //3.请求头
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            //4.请求体
            xhr.send("method=validateName&organizeId="+organizeId);
            //5.前后台交互验证
            if (organizeId.length == 0 || !name_reg.test(organizeId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("organizeId").focus();
            }
            // document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
            else {
                xhr.onreadystatechange = function () {
                    //正常交互
                    if (xhr.status == 200 && xhr.readyState == 4) {
                        //得到返回结果,并利用结果判断用户名是否可用
                        var result = xhr.responseText;
                        //返回true,可用
                        if ("true" == result) {
                            //判用户名是否为空
                            if (organizeId == null || organizeId == "") {
                                //name_Span.style.color = "red";
                                //name_Span.innerHTML = "用户名不可为空";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名不可为空</em>";
                                document.getElementById("organizeId").focus();
                            } else {
                                //name_Span.style.color = "green";
                                //name_Span.innerHTML = "用户名可用";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名可用</em>";
                            }
                        } else {  //返回false,用户名不可用
                            //name_Span.style.color = "red";
                            //name_Span.innerHTML = "用户名不可用";
                            document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名已被注册</em>";
                            document.getElementById("organizeId").focus();
                        }
                    }
                }
            }
        }
        function checkName2() {
            var driverId = document.getElementById("driverId").value;
            var xhr = new XMLHttpRequest();
            var name_reg = /^\d{3,5}$/; //正则表达式
            xhr.open("post", "${pageContext.request.contextPath}/DriverServlet.do", true);
            //3.请求头
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            //4.请求体
            xhr.send("method=validateName&driverId="+driverId);
            if (driverId.length == 0 || !name_reg.test(driverId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("driverId").focus();
            }
            else {
                // document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
                xhr.onreadystatechange = function () {
                    //正常交互
                    if (xhr.status == 200 && xhr.readyState == 4) {
                        //得到返回结果,并利用结果判断用户名是否可用
                        var result = xhr.responseText;
                        //返回true,可用
                        if ("true" == result) {
                            //判用户名是否为空
                            if (driverId == null || driverId == "") {
                                //name_Span.style.color = "red";
                                //name_Span.innerHTML = "用户名不可为空";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名不可为空</em>";
                                document.getElementById("driverId").focus();
                            } else {
                                //name_Span.style.color = "green";
                                //name_Span.innerHTML = "用户名可用";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名可用</em>";
                            }
                        } else {  //返回false,用户名不可用
                            //name_Span.style.color = "red";
                            //name_Span.innerHTML = "用户名不可用";
                            document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名已被注册</em>";
                            document.getElementById("driverId").focus();
                        }
                    }
                }
            }
        }
        function checkName3() {
            var hotelId = document.getElementById("hotelId").value;
            var xhr = new XMLHttpRequest();
            var name_reg = /^\d{3,5}$/; //正则表达式
            xhr.open("post", "${pageContext.request.contextPath}/HotelServlet.do", true);
            //3.请求头
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            //4.请求体
            xhr.send("method=validateName&hotelId="+hotelId);
            if (hotelId.length == 0 || !name_reg.test(hotelId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("hotelId").focus();
            } else {
                //document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
                xhr.onreadystatechange = function () {
                    //正常交互
                    if (xhr.status == 200 && xhr.readyState == 4) {
                        //得到返回结果,并利用结果判断用户名是否可用
                        var result = xhr.responseText;
                        //返回true,可用
                        if ("true" == result) {
                            //判用户名是否为空
                            if (hotelId == null || hotelId == "") {
                                //name_Span.style.color = "red";
                                //name_Span.innerHTML = "用户名不可为空";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名不可为空</em>";
                                document.getElementById("hotelId").focus();
                            } else {
                                //name_Span.style.color = "green";
                                //name_Span.innerHTML = "用户名可用";
                                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名可用</em>";
                            }
                        } else {  //返回false,用户名不可用
                            //name_Span.style.color = "red";
                            //name_Span.innerHTML = "用户名不可用";
                            document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名已被注册</em>";
                            document.getElementById("hotelId").focus();
                        }
                    }
                }
            }
        }
        function checkName5() {
            var adminId = document.getElementById("adminId").value;
            var name_reg = /^\d{3,5}$/; //正则表达式
            if (adminId.length == 0 || !name_reg.test(adminId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("adminId").focus();
            }
            else
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
        }
        function checkName6(){
            var userId = document.getElementById("userId").value;
            var name_reg = /^\d{3,5}$/; //正则表达式
            if (userId.length == 0 || !name_reg.test(userId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("userId").focus();
            }
            else
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
        }
        function checkName7(){
            var organizeId = document.getElementById("organizeId").value;
            var name_reg = /^\d{3,5}$/; //正则表达式
            if (organizeId.length == 0 || !name_reg.test(organizeId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("organizeId").focus();
            }
            else
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
        }
        function checkName8(){
            var driverId = document.getElementById("driverId").value;
            var name_reg = /^\d{3,5}$/; //正则表达式
            if (driverId.length == 0 || !name_reg.test(driverId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("driverId").focus();
            }
            else
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
        }
        function checkName9(){
            var hotelId = document.getElementById("hotelId").value;
            var name_reg = /^\d{3,5}$/; //正则表达式
            if (hotelId.length == 0 || !name_reg.test(hotelId)) {
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个数字组成</em>";
                document.getElementById("hotelId").focus();
            }
            else
                document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个数字组成</em>";
        }
        function checkPassword() {
            var password = document.getElementById("password").value;
            if (password.length<8 || password.lenth>12) {
                document.getElementById("password_Span").innerHTML = "<em style = 'color:#EF0000'>请输入8-12位密码</em>";
                document.getElementById("password").focus();
            } else
                document.getElementById("password_Span").innerHTML = "<em style = 'color:#008000'>请输入8-12位密码</em>";
            var pwdRept = document.getElementById("pwdRept").value;
            if (pwdRept != password) {
                document.getElementById("pwdRept_Span").innerHTML = "<em style = 'color:#EF0000'>两次密码不一致</em>";
                document.getElementById("pwdRept").focus();
            }
            else
                document.getElementById("pwdRept_Span").innerHTML = "<em style = 'color:#008000'>两次密码不一致</em>";
        }
        function checkEmail() {
            var email = document.getElementById("email").value;
            var pattern = /^[a-zA-Z0-9#_\^\$\.\+\-\?\=\!\|\:\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            if (email.length == 0 || !pattern.test(email)) {
                document.getElementById("email_Span").innerHTML = "<em style = 'color:#EF0000'>格式示例:xxxxxxxx@163.com</em>";
                document.getElementById("email").focus();
            }
            else
                document.getElementById("email_Span").innerHTML = "<em style = 'color:#008000'>格式示例:xxxxxxxx@163.com</em>";
        }
        function checkPhone() {
            var phone = document.getElementById("phone").value;
            var phone_reg = /^1[3|4|5|7|8]\d{9}$/; //正则表达式
            if (phone.length == 0 || !phone_reg.test(phone)) {
                document.getElementById("phone_Span").innerHTML = "<em style = 'color:#EF0000'>格式示例:13800154200</em>";
                document.getElementById("phone").focus();
            } else
                document.getElementById("phone_Span").innerHTML = "<em style = 'color:#008000'>格式示例:13800154200</em>";
        }
        function checkUserName() {
            var name = document.getElementById("userName").value;
            var true_reg = /^[\u4e00-\u9fa5]{2,5}$/;
            if (!true_reg.test(name)) {
                document.getElementById("userName_Span").innerHTML = "<em style = 'color:#EF0000'>由2-5个中文组成</em>";
                document.getElementById("userName").focus();
            }
            else
                document.getElementById("userName_Span").innerHTML = "<em style = 'color:#008000'>由2-5个中文组成</em>";
        }
        function checkOrganizeName(){
            var name = document.getElementById("organizeName").value;
            var true_reg = /^[\u4e00-\u9fa5]{2,5}$/;
            if (!true_reg.test(name)) {
                document.getElementById("organizeName_Span").innerHTML = "<em style = 'color:#EF0000'>由2-5个中文组成</em>";
                document.getElementById("organizeName").focus();
            }
            else
                document.getElementById("organizeName_Span").innerHTML = "<em style = 'color:#008000'>由2-5个中文组成</em>";
        }
        function checkDepartment(){
            var name = document.getElementById("department").value;
            var true_reg = /^[\u4e00-\u9fa5]{2,10}$/;
            if (!true_reg.test(name)) {
                document.getElementById("department_Span").innerHTML = "<em style = 'color:#EF0000'>由2-10个中文组成</em>";
                document.getElementById("department").focus();
            }
            else
                document.getElementById("department_Span").innerHTML = "<em style = 'color:#008000'>由2-10个中文组成</em>";
        }
        function checkDescription(){
            var name = document.getElementById("description").value;
            var true_reg = /^[\u4e00-\u9fa5]{2,10}$/;
            if (!true_reg.test(name)) {
                document.getElementById("description_Span").innerHTML = "<em style = 'color:#EF0000'>由2-10个中文组成</em>";
                document.getElementById("description").focus();
            }
            else
                document.getElementById("description_Span").innerHTML = "<em style = 'color:#008000'>由2-10个中文组成</em>";
        }
    </script>
</head>
<body onload="initAJAX()">

<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>登录</h2>
                        <p>柳庭风静人眠昼，昼眠人静风庭柳.</p>
                        <button class="btn_login" onClick="cambiar_login()">登录</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>注册</h2>
                        <p>独上高楼，望尽天涯路.</p>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">注册</button>
                    </div>
                </div>
            </div>
            <div class="cont_back_info">
                <div class="cont_img_back_grey"> <img src="img/po.jpg" alt="" /> </div>
            </div>
            <div class="cont_forms" >
                <div class="cont_img_back_"> <img src="img/po.jpg" alt="" /> </div>
                <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
                    <h2>LOGIN</h2>
                    <br>
                    <h5 style="color:deeppink"><p style="font-family:'新宋体','楷体';">温馨提示：请先选择您的身份以便注册~</p></h5>
                    <br>
                    <div>
                        超级管理员<input name="selected" id="Admin1" type="radio" onclick="adminLogin()">
                        <br>
                        <br>
                        参加者<input name="selected" id="User1" type="radio" onclick="userLogin()">
                        组织者<input name="selected" id="Organizer1" type="radio" onclick="organizeLogin()">
                        车队司机<input name="selected" id="Driver1" type="radio" onclick="driverLogin()">
                        酒店管理员<input name="selected" id="Hotel1" type="radio" onclick="hotelLogin()">
                    </div>
                    <div id="loginPart">
                        <br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="用户名"  name="id"/>
                        <br><br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="password" placeholder="密码" name="password"/>
                        <br><br><br>
                        <button style="width:150px;height:40px;border-radius:18px;" class="btn_login" onclick="test_login()">LOGIN</button>
                    </div>
                </div>
                <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                    <h2>注册</h2>
                    <div>
                        参加者<input name="select" id="User" type="radio" onclick="meetingJoiner()">
                        组织者<input name="select" id="Organizer" type="radio" onclick="meetingController()">
                        车队司机<input name="select" id="Driver" type="radio" onclick="carDriver()">
                        酒店管理员<input name="select" id="Hotel" type="radio" onclick="hotelController()">
                    </div>
                    <div id="info">
                        <h5 style="color:deeppink"><p style="font-family:'新宋体','楷体';">温馨提示：请先选择您的身份以便注册~</p></h5>
                        <br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="用户名"  name="id"/>
                        <br><br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="姓名"  name="id"/>
                        <br><br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="密码"  name="id"/>
                        <br><br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="确认密码"  name="id"/>
                        <br><br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="手机号码"  name="id"/>
                        <br><br>
                        <input style="width:300px;height:40px;border-radius:18px;" type="text" placeholder="备注"  name="id"/>
                        <br><br><br>
                        <button style="width:150px;height:40px;border-radius:18px;" class="btn_login" onclick="test_login()">SUBMIT</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/index.js">

</script>
</body>
<script language="JavaScript">
    function meetingJoiner(){
        var listHtml = "<form action = \"${pageContext.request.contextPath}/RegistServlet\" method=\"post\">\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px;\" type=\"text\" id=\"userId\" name=\"userId\" placeholder=\"参加者用户名\" onblur=\"checkName1()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"userName\" name=\"userName\" placeholder=\"姓名\" onblur=\"checkUserName()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"userName_Span\"><p style=\"font-family:'新宋体','楷体';\">由2-5个中文组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"pwdRept\" placeholder=\"确认密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"pwdRept_Span\"><p style=\"font-family:'新宋体','楷体';\">两次密码不一致</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" maxlength=\"11\" id=\"phone\" name=\"phone\" placeholder=\"手机号码\" onblur=\"checkPhone()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"phone_Span\"><p style=\"font-family:'新宋体','楷体';\">格式示例:13800154200</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"email\" id=\"email\" name=\"email\" placeholder=\"邮箱\" onblur=\"checkEmail()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"email_Span\"><p style=\"font-family:'新宋体','楷体';\">格式示例:xxxxxxxx@163.com</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"department\" name=\"department\" placeholder=\"备注\" onblur=\"checkDepartment()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"department_Span\"><p style=\"font-family:'新宋体','楷体';\">由2-10个中文组成</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"注册\"></tr>\n" +  // onblur="check()", onclick="check()"
            "</div>\n"+
            "</form>";
        document.getElementById("info").innerHTML=listHtml;
    }
    function meetingController(){
        var listHtml = "<form action = \"${pageContext.request.contextPath}/RegistOrganizeServlet\" method=\"post\" >\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"organizeId\" name=\"organizeId\" placeholder=\"组织者用户名\" onblur=\"checkName4()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"organizeName\" name=\"organizeName\" placeholder=\"姓名\" onblur=\"checkOrganizeName()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"organizeName_Span\"><p style=\"font-family:'新宋体','楷体';\">由2-5个中文组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"pwdRept\" placeholder=\"确认密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"pwdRept_Span\"><p style=\"font-family:'新宋体','楷体';\">两次密码不一致</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" maxlength=\"11\" id=\"phone\" name=\"phone\" placeholder=\"手机号码\" onblur=\"checkPhone()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"phone_Span\"><p style=\"font-family:'新宋体','楷体';\">格式示例:13800154200</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"email\" id=\"email\" placeholder=\"邮箱\" name=\"email\" onblur=\"checkEmail()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"email_Span\"><p style=\"font-family:'新宋体','楷体';\">格式示例:xxxxxxxx@163.com</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"department\" placeholder=\"备注\" name=\"department\" onblur=\"checkDepartment()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"department_Span\"><p style=\"font-family:'新宋体','楷体';\">由2-10个中文组成</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"注册\"></tr>\n" +
            "</div>\n"+
            "</form>";
        document.getElementById("info").innerHTML=listHtml;
    }
    function carDriver(){
        var listHtml = "<form action = \"${pageContext.request.contextPath}/RegistDriverServlet\" method=\"post\" >\n" +       //onSubmit="checkForm2()"
            "<br>\n" + "<br>\n" + "<br>\n" + "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"driverId\" name=\"driverId\" placeholder=\"司机用户名\" onblur=\"checkName2()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"pwdRept\" placeholder=\"确认密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"pwdRept_Span\"><p style=\"font-family:'新宋体','楷体';\">两次密码不一致</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" maxlength=\"11\" id=\"phone\" name=\"phone\" placeholder=\"手机号码\" onblur=\"checkPhone()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"phone_Span\"><p style=\"font-family:'新宋体','楷体';\">格式示例:13800154200</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"description\" name=\"description\" placeholder=\"备注\" onblur=\"checkDescription()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"description_Span\"><p style=\"font-family:'新宋体','楷体';\">自我描述（由2-10个中文组成）</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"注册\"></tr>\n" +
            "</div>\n"+
            "</form>";
        document.getElementById("info").innerHTML=listHtml;
    }
    function hotelController(){
        var listHtml = "<form action = \"${pageContext.request.contextPath}/RegistHotelServlet\" method=\"post\" >\n" +       //onSubmit="checkForm3()"
            "<br>\n" + "<br>\n" + "<br>\n" + "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"hotelId\" name=\"hotelId\" placeholder=\"酒店管理者用户名\" onblur=\"checkName3()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"pwdRept\" placeholder=\"确认密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"pwdRept_Span\"><p style=\"font-family:'新宋体','楷体';\">两次密码不一致</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"text\" id=\"description\" name=\"description\" placeholder=\"备注\" onblur=\"checkDescription()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"description_Span\"><p style=\"font-family:'新宋体','楷体';\">自我描述（由2-10个中文组成）</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"注册\"></tr>\n" +
            "</div>\n"+
            "</form>";
        document.getElementById("info").innerHTML=listHtml;
    }

    function adminLogin(){
        var listHtml="<form action = \"${pageContext.request.contextPath}/AdminLoginServlet\" method=\"post\">\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px;\" type=\"text\" id=\"adminId\" name=\"AdminId\" placeholder=\"超级管理员用户名\" onblur=\"checkName5()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"登录\"></tr>\n" +  // onblur="check()", onclick="check()"
            "</div>\n"+
            "</form>";
        document.getElementById("loginPart").innerHTML=listHtml;
    }
    function userLogin(){
        var listHtml="<form action = \"${pageContext.request.contextPath}/UserLoginServlet\" method=\"post\">\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px;\" type=\"text\" id=\"userId\" name=\"userId\" placeholder=\"会务参加者用户名\" onblur=\"checkName6()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"登录\"></tr>\n" +  // onblur="check()", onclick="check()"
            "</div>\n"+
            "</form>";
        document.getElementById("loginPart").innerHTML=listHtml;
    }
    function organizeLogin(){
        var listHtml="<form action = \"${pageContext.request.contextPath}/OrganizeLoginServlet\" method=\"post\">\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px;\" type=\"text\" id=\"organizeId\" name=\"userId\" placeholder=\"会务组织者用户名\" onblur=\"checkName7()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"登录\"></tr>\n" +  // onblur="check()", onclick="check()"
            "</div>\n"+
            "</form>";
        document.getElementById("loginPart").innerHTML=listHtml;
    }
    function driverLogin(){
        var listHtml="<form action = \"${pageContext.request.contextPath}/DriverLoginServlet\" method=\"post\">\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px;\" type=\"text\" id=\"driverId\" name=\"driverId\" placeholder=\"司机用户名\" onblur=\"checkName8()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"登录\"></tr>\n" +  // onblur="check()", onclick="check()"
            "</div>\n"+
            "</form>";
        document.getElementById("loginPart").innerHTML=listHtml;
    }
    function hotelLogin(){
        var listHtml="<form action = \"${pageContext.request.contextPath}/HotelLoginServlet\" method=\"post\">\n" +       //onSubmit="checkForm1()"
            "<br>\n" +
            "<div>\n"+
            "<tr><input style=\"width:300px;height:40px;border-radius:18px;\" type=\"text\" id=\"hotelId\" name=\"hotelId\" placeholder=\"酒店用户名\" onblur=\"checkName9()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">用户名由3-5位数字组成</p></span></tr>\n" +
            "<tr><input style=\"width:300px;height:40px;border-radius:18px\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"密码\" onblur=\"checkPassword()\" /></tr>\n" +
            "<br>\n" +
            "<tr><span id=\"password_Span\"><p style=\"font-family:'新宋体','楷体';\">请输入8-12位密码</p></span></tr>\n" +
            "<br>\n" +
            "<tr><input style=\"width:150px;height:40px;border-radius:18px\" type=\"submit\" class=\"btn_sign_up\" value=\"登录\"></tr>\n" +  // onblur="check()", onclick="check()"
            "</div>\n"+
            "</form>";
        document.getElementById("loginPart").innerHTML=listHtml;
    }

    function test_login(){
        window.alert("请选择您的身份以便登录/注册！");
    }
</script>
<script>

    //取出传回来的参数error并与yes比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='yes'){
        alert("用户名或密码错误！登录失败!");
    }
</script>
<%--<script>--%>
<%--    window.onload=meetingJoiner();--%>
<%--</script>--%>
</html>