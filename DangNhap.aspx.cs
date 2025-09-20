
using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace QuanLyQuanNetWebForm
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            string connStr = WebConfigurationManager.ConnectionStrings["QuanNetConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT VaiTro FROM TaiKhoan WHERE TenDangNhap=@user AND MatKhau=@pass";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@user", username);
                cmd.Parameters.AddWithValue("@pass", password);

                object role = cmd.ExecuteScalar();

                if (role != null)
                {
                    string vaitro = role.ToString();
                    lblMessage.Text = "Đăng nhập thành công. Vai trò: " + vaitro;

                    if (vaitro == "Admin")
                    {
                        Session["TenDangNhap"] = txtUser.Text;
                        Session["VaiTro"] = vaitro;
                        Response.Redirect("Admin/Home.aspx");
                    }
                    else if (vaitro == "NhanVien")
                    {
                        Session["TenDangNhap"] = txtUser.Text;
                        Session["VaiTro"] = vaitro;
                        Response.Redirect("NhanVien/Home.aspx");
                    }
                    else 
                    {
                        Session["TenDangNhap"] = txtUser.Text;
                        Session["VaiTro"] = "KhachHang";
                        Response.Redirect("Home.aspx");
                    }
                }

                else
                {
                    lblMessage.Text = "Sai tên đăng nhập hoặc mật khẩu!";
                }
            }
        }
    }
}
