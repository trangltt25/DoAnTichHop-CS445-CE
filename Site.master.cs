using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyQuanNetWebForm
{
    public partial class Site : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                lblWelcome.Text = "Xin chào, " + Session["TenDangNhap"];
            }
            else
            {
                lblWelcome.Text = "Xin chào khách";
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            Response.Redirect("Login.aspx");
        }

    }
}
