
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyQuanNetWebForm
{
    public partial class Home : Page
    {
        protected global::System.Web.UI.WebControls.Label lblTenKhach;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string tenDangNhap = Session["TenDangNhap"].ToString();

            if (lblTenKhach != null)
            {
                lblTenKhach.Text = tenDangNhap;
            }

            if (Master != null)
            {
                Label lblWelcome = Master.FindControl("lblWelcome") as Label;
                if (lblWelcome != null)
                {
                    lblWelcome.Text = "Xin chào, " + tenDangNhap;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
