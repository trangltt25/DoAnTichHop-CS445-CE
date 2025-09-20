<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QuanLyQuanNetWebForm.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đăng ký</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .container {
            width: 400px;
            margin: auto;
            margin-top: 80px;
            padding: 20px;
            background: #f3f3f3;
            border-radius: 10px;
        }
        .container h2 {
            text-align: center;
        }
        .textbox {
            width: 100%;
            margin: 8px 0;
            padding: 10px;
        }
        .btn {
            width: 100%;
            background: red;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background: darkred;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Đăng ký</h2>
            <asp:TextBox ID="txtUser" CssClass="textbox" placeholder="Tên truy cập" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtUser" runat="server" ErrorMessage="*" ForeColor="Red" />

            <asp:TextBox ID="txtPass" CssClass="textbox" TextMode="Password" placeholder="Mật khẩu" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtPass" runat="server" ErrorMessage="*" ForeColor="Red" />

            <asp:TextBox ID="txtRePass" CssClass="textbox" TextMode="Password" placeholder="Nhập lại mật khẩu" runat="server"></asp:TextBox>
            <asp:CompareValidator ControlToValidate="txtRePass" ControlToCompare="txtPass" runat="server" ErrorMessage="Mật khẩu không khớp" ForeColor="Red" />

            <asp:TextBox ID="txtEmail" CssClass="textbox" placeholder="Email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" runat="server" ErrorMessage="*" ForeColor="Red" />

            <asp:DropDownList ID="ddlCountry" CssClass="textbox" runat="server">
                <asp:ListItem>Việt Nam (Việt Nam)</asp:ListItem>
                <asp:ListItem>Mỹ (USA)</asp:ListItem>
                <asp:ListItem>Nhật Bản (Japan)</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnRegister" CssClass="btn" Text="Đăng ký" runat="server" OnClick="btnRegister_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
