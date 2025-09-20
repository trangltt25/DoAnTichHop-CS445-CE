<%@ Page Title="Quản lý tài khoản" Language="C#" MasterPageFile="~/Admin/SiteAdmin.master" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoan.aspx.cs" Inherits="QuanLyQuanNetWebForm.Admin.QuanLyTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Quản lý tài khoản Quán Net
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

    <asp:DropDownList ID="ddlFilterRole" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterRole_SelectedIndexChanged">
        <asp:ListItem Text="-- Tất cả --" Value=""></asp:ListItem>
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        <asp:ListItem Text="Nhân viên" Value="NhanVien"></asp:ListItem>
        <asp:ListItem Text="Khách hàng" Value="KhachHang"></asp:ListItem>
    </asp:DropDownList>

    <br /><br />

    <asp:GridView ID="gvTaiKhoan" runat="server" AutoGenerateColumns="False" DataKeyNames="TaiKhoanID"
    OnRowEditing="gvTaiKhoan_RowEditing"
    OnRowUpdating="gvTaiKhoan_RowUpdating"
    OnRowCancelingEdit="gvTaiKhoan_RowCancelingEdit"
    OnRowDeleting="gvTaiKhoan_RowDeleting"
    OnRowDataBound="gvTaiKhoan_RowDataBound"
    CssClass="table table-striped table-bordered">

    <Columns>
        <asp:TemplateField HeaderText="Chọn">
            <ItemTemplate>
                <asp:CheckBox ID="chkSelect" runat="server" />
                <asp:DropDownList ID="ddlVaiTroUpdate" runat="server" Visible="false">
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Nhân viên" Value="NhanVien"></asp:ListItem>
                    <asp:ListItem Text="Khách hàng" Value="KhachHang"></asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="TaiKhoanID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="TenDangNhap" HeaderText="Username" />

        <asp:TemplateField HeaderText="Vai trò">
            <ItemTemplate>
                <asp:Label ID="lblVaiTro" runat="server" Text='<%# Eval("VaiTro") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlVaiTro" runat="server">
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Nhân viên" Value="NhanVien"></asp:ListItem>
                    <asp:ListItem Text="Khách hàng" Value="KhachHang"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="NgayTao" HeaderText="Ngày tạo" DataFormatString="{0:dd/MM/yyyy}" />
        <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" />

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>



    <br />
    <asp:Button ID="btnUpdateRoles" runat="server" Text="Cập nhật phân quyền" CssClass="btn btn-success" OnClick="btnUpdateRoles_Click" />

</asp:Content>
