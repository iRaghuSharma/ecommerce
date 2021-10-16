using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindProductCart();
        }
    }

    private void BindProductCart()
    {
        if (Request.Cookies["CartPID"] != null)
        {

            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');

            if (CookieDataArray.Length > 0)
            {
                h4Items.InnerText = "My Cart(" + CookieDataArray.Length + " items)";
                DataTable dt = new DataTable();
                Int64 CartTotal = 0;
                Int64 Total = 0;

                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string SizeID = CookieDataArray[i].ToString().Split('-')[1];
                    SqlCommand cmd2 = new SqlCommand("select A.*, dbo.getSizeName(" + SizeID + ") as SizeNamee, " + SizeID + " as SizeIDD,SizeData.Name.SizeData,Extention from tblProducts A cross apply(select top 1, B.Name,Extention from tblProductImages B where B.PID = A.PID) SizeData where A.PID ='" + PID + "'", con);

                    cmd2.CommandType = CommandType.Text;
                    SqlDataAdapter sda = new SqlDataAdapter(cmd2);
                    sda.Fill(dt);

                    CartTotal += Convert.ToInt64(dt.Rows[i]["PPrice"]);
                    Total += Convert.ToInt64(dt.Rows[i]["PSelPrice"]);

                }

                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();

                spanCartTotal.InnerText = CartTotal.ToString();
                spanTotal.InnerText = "Rs." + Total.ToString();
                spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();
            }



        }
    }
    
    protected void btnRemoveCart_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        Button btn = (Button)(sender);
        string PIDSIZE = btn.CommandArgument;
        List<string> CookiePIDList = CookiePID.Split(',').Select(I => I.Trim()).Where(I => I != string.Empty).ToList();
        CookiePIDList.Remove(PIDSIZE);
        string CookiePIDUpdated = string.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);
        }
        else 
        { 
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("~/Cart.aspx");
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Payment.aspx");
    }
}