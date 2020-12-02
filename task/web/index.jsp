<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>登录</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur.</p>
                        <button class="btn_login" onClick="cambiar_login()">登录</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>注册</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur.</p>
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
                    <input type="text" placeholder="Email"/>
                    <input type="password" placeholder="Password"/>
                    <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                </div>
                <div class="cont_form_sign_up"> <a href="" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                    <h2>注册</h2>
                    <form action = servlet_sigh_up method="post" onsubmit="">
                        <input type="text" name="userId" placeholder="账户"/>
                        <input type="text" name="userName" placeholder="用户名"/>
                        <input type="password" name="password" placeholder="密码"/>
                        <input type="password" name="confirmPassword" placeholder="确认密码"/>
                        <input type="text" name="phone" placeholder="手机"/>
                        <input type="text" name="department" placeholder="所属部门"/>
                        <input type="text" name="email" placeholder="邮箱"/>
                        <input type="submit" class="btn_sign_up" value="注册">
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/index.js"></script>
</body>
</html>