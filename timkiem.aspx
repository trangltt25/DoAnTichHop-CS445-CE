<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timkiem.aspx.cs" Inherits="timkiem.timkiem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
      <title>Tìm kiếm Menu</title>
    <style>
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }
        .result-box {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #f9f9f9;
        }
        .title { font-weight: bold; color: #007bff; font-size: 18px; }
        .price { color: red; font-weight: bold; }
        .choose-btn {
            margin-top: 10px;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            background-color: #28a745;
            color: #fff;
            cursor: pointer;
        }
        .choose-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 style="text-align:center;">Tìm kiếm Menu</h2>

            <asp:TextBox ID="txtSearch" runat="server" Width="300px"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="🔍 Tìm" OnClick="btnSearch_Click" />

            <div class="result-box" runat="server" id="resultBox" visible="false">
                <span id="resultName" runat="server" class="title"></span><br />
                <span id="resultDescription" runat="server"></span><br />
                <span id="resultPrice" runat="server" class="price"></span><br />

                <!-- Nút chọn -->
                <asp:Button ID="btnSelect" runat="server" Text="Chọn" CssClass="choose-btn" OnClick="btnSelect_Click" />
            </div>
        </div>
    </form>
</body>
</html>
