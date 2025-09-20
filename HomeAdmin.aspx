<%@ Page Title="Trang chủ Admin" Language="C#" MasterPageFile="~/Admin/SiteAdmin.master"
    AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="QuanLyQuanNetWebForm.Admin.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Trang chủ Admin</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h3>📊 Thống kê nhanh</h3>
        <p>Tổng số mô hình máy: <asp:Label ID="lblTongMay" runat="server" /></p>
        <p>Tổng số đơn hàng: <asp:Label ID="lblTongDonHang" runat="server" /></p>
        <p>Tổng số nhân viên: <asp:Label ID="lblTongNhanVien" runat="server" /></p>
        <p>Tổng số khách hàng: <asp:Label ID="lblTongKhachHang" runat="server" /></p>
        <p>Doanh thu hôm nay: <asp:Label ID="lblDoanhThu" runat="server" /></p>
    </div>
</asp:Content>
