
using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace QuanLyQuanNetWebForm
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();
            string email = txtEmail.Text.Trim();

            string connStr = WebConfigurationManager.ConnectionStrings["QuanNetConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string checkSql = "SELECT COUNT(*) FROM TaiKhoan WHERE TenDangNhap=@user";
                SqlCommand checkCmd = new SqlCommand(checkSql, conn);
                checkCmd.Parameters.AddWithValue("@user", username);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Tên đăng nhập đã tồn tại!";
                }
                else
                {
                    string sql = "INSERT INTO TaiKhoan (TenDangNhap, MatKhau, VaiTro) VALUES (@user, @pass, 'KhachHang')";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@user", username);
                    cmd.Parameters.AddWithValue("@pass", password);
                    cmd.ExecuteNonQuery();

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Đăng ký thành công! Hãy đăng nhập.";
                }
            }
        }
    }
}
