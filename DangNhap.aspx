<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuanLyQuanNetWebForm.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đăng nhập - Quán Net</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://wallpapercave.com/wp/wp7420742.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .login-container {
            width: 350px;
            margin: 120px auto;
            padding: 30px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            box-shadow: 0px 0px 20px #ff0000;
            color: #fff;
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff3333;
        }
        .login-container label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        .login-container input[type=text], 
        .login-container input[type=password] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 5px;
            outline: none;
        }
        .login-container input[type=text]:focus, 
        .login-container input[type=password]:focus {
            border: 2px solid #ff3333;
        }
        .login-container .btn {
            width: 100%;
            background: #ff3333;
            border: none;
            padding: 10px;
            margin-top: 20px;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .login-container .btn:hover {
            background: darkred;
        }
        .register-link {
            text-align: center;
            margin-top: 15px;
        }
        .register-link a {
            color: #ff6666;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
        .message {
            text-align: center;
            margin-top: 10px;
            color: yellow;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Đăng nhập</h2>

            <label for="txtUser">Tên đăng nhập</label>
            <asp:TextBox ID="txtUser" runat="server" placeholder="Nhập tên đăng nhập"></asp:TextBox>

            <label for="txtPass">Mật khẩu</label>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Nhập mật khẩu"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Đăng nhập" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="register-link">
                <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="Register.aspx">Chưa có tài khoản? Đăng ký ngay</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
