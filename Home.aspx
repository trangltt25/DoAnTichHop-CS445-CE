<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QuanLyQuanNetWebForm.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Trang chủ</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h3>👋 Xin chào <asp:Label ID="lblTenKhach" runat="server"></asp:Label>!</h3>
        <p>Chào mừng bạn đến với hệ thống quản lý quán net. Hãy khám phá các chức năng bên trái để bắt đầu.</p>
    </div>
    <div class="card">
        <h4>📢 Thông báo mới</h4>
        <ul>
            <li>Khuyến mãi nạp thẻ 100k tặng 20%.</li>
            <li>Sự kiện thi đấu game vào cuối tuần.</li>
            <li>Khách VIP được tặng nước uống miễn phí.</li>
        </ul>
    </div>

    <div class="card">
        <h4>⚡ Chức năng nhanh</h4>
        <div style="display:flex; flex-wrap:wrap; gap:15px;">
            <a href="TimKiem.aspx" style="flex:1 1 150px; text-align:center; padding:15px; background:#1abc9c; color:white; border-radius:10px; text-decoration:none; transition:0.3s;">🔍 Tìm kiếm</a>
            <a href="DichVu.aspx" style="flex:1 1 150px; text-align:center; padding:15px; background:#16a085; color:white; border-radius:10px; text-decoration:none; transition:0.3s;">📋 Xem dịch vụ</a>
            <a href="DatHang.aspx" style="flex:1 1 150px; text-align:center; padding:15px; background:#27ae60; color:white; border-radius:10px; text-decoration:none; transition:0.3s;">🛒 Đặt đơn hàng</a>
            <a href="ThanhToan.aspx" style="flex:1 1 150px; text-align:center; padding:15px; background:#2ecc71; color:white; border-radius:10px; text-decoration:none; transition:0.3s;">💳 Thanh toán</a>
            <a href="ChatAI.aspx" style="flex:1 1 150px; text-align:center; padding:15px; background:#3498db; color:white; border-radius:10px; text-decoration:none; transition:0.3s;">🤖 Chat AI</a>
        </div>
    </div>
</asp:Content>
