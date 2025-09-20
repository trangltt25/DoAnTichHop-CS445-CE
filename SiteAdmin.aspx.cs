using System;
using System.Web.UI;

namespace QuanLyQuanNetWebForm
{
    public partial class SiteAdmin : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TenDangNhap"] == null || (Session["VaiTro"] as string != "Admin"))
                {
                    Response.Redirect("../Login.aspx"); // Trở về trang Login nếu không phải Admin
                }
                lblAdminWelcome.Text = "Xin chào, " + (Session["TenDangNhap"] as string ?? "Admin");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            Response.Redirect("../Login.aspx");
        }
    }
}
