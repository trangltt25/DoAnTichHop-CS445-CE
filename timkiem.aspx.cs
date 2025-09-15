using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace timkiem
{
    public partial class timkiem : System.Web.UI.Page
    {
        string connect = @"C:\Users\admin\OneDrive\Documents\Đồ án tích hợp\Code\TimKiem_XemTT\timkiem\timkiem\App_Data\QLQuanNet.mdf";

        private static Dictionary<string, Tuple<string, string>> menu = new Dictionary<string, Tuple<string, string>>()
{
    { "Sting", Tuple.Create("Nước tăng lực hương dâu, uống mát lạnh", "10,000 VNĐ") },
    { "Coca-Cola", Tuple.Create("Nước ngọt có gas, giải khát sảng khoái", "12,000 VNĐ") },
    { "Pepsi", Tuple.Create("Nước ngọt có gas vị cola, chai 330ml", "11,000 VNĐ") },
    { "Mì", Tuple.Create("Mì tôm trứng xúc xích", "20,000 VNĐ") },
    { "Cơm", Tuple.Create("Cơm gà chiên giòn", "35,000 VNĐ") }
};

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();

            if (menu.ContainsKey(keyword))
            {
                var item = menu[keyword];
                resultName.InnerText = keyword;
                resultDescription.InnerText = item.MoTa;
                resultPrice.InnerText = item.Gia;
                resultBox.Visible = true;
            }
            else
            {
                resultName.InnerText = "Không tìm thấy!";
                resultDescription.InnerText = "";
                resultPrice.InnerText = "";
                resultBox.Visible = true;
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string tenMon = resultName.InnerText;
            string mota = resultDescription.InnerText;
            string gia = resultPrice.InnerText;

            // Hiển thị thông báo chọn món
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Bạn đã chọn: " + tenMon + " - " + mota + " - " + gia + "');", true);
        }
    }
}
