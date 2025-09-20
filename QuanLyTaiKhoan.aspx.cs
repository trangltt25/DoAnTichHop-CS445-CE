
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyQuanNetWebForm.Admin
{
    public partial class QuanLyTaiKhoan : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["QuanNetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTaiKhoan();
            }
        }

        private void LoadTaiKhoan(string vaiTroFilter = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM TaiKhoan WHERE (@role='' OR VaiTro=@role)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@role", vaiTroFilter);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvTaiKhoan.DataSource = dt;
                gvTaiKhoan.DataBind();
            }
        }

        protected void ddlFilterRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadTaiKhoan(ddlFilterRole.SelectedValue);
        }

        protected void gvTaiKhoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTaiKhoan.EditIndex = e.NewEditIndex;
            LoadTaiKhoan(ddlFilterRole.SelectedValue);
        }

        protected void gvTaiKhoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvTaiKhoan.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvTaiKhoan.DataKeys[e.RowIndex].Value);
            string vaiTro = ((DropDownList)row.FindControl("ddlVaiTro")).SelectedValue;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "UPDATE TaiKhoan SET VaiTro=@vaiTro WHERE TaiKhoanID=@id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@vaiTro", vaiTro);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvTaiKhoan.EditIndex = -1;
            LoadTaiKhoan(ddlFilterRole.SelectedValue);
        }

        protected void gvTaiKhoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTaiKhoan.EditIndex = -1;
            LoadTaiKhoan(ddlFilterRole.SelectedValue);
        }

        protected void gvTaiKhoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvTaiKhoan.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM TaiKhoan WHERE IdTaiKhoan=@id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadTaiKhoan(ddlFilterRole.SelectedValue);
        }

        protected void btnUpdateRoles_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvTaiKhoan.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                if (chk != null && chk.Checked)
                {
                    int id = Convert.ToInt32(gvTaiKhoan.DataKeys[row.RowIndex].Value);
                    DropDownList ddl = (DropDownList)row.FindControl("ddlVaiTroUpdate"); // DropDownList ẩn trong ItemTemplate
                    string vaiTro = ddl.SelectedValue;

                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string sql = "UPDATE TaiKhoan SET VaiTro=@vaiTro WHERE TaiKhoanID=@id";
                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@vaiTro", vaiTro);
                        cmd.Parameters.AddWithValue("@id", id);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            LoadTaiKhoan(ddlFilterRole.SelectedValue);
            lblMessage.Text = "Cập nhật phân quyền thành công!";
        }
        protected void gvTaiKhoan_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlVaiTroUpdate");
                if (ddl != null)
                {
                    string vaiTro = DataBinder.Eval(e.Row.DataItem, "VaiTro").ToString();
                    ddl.SelectedValue = vaiTro;
                }
            }
        }   
    }
}
