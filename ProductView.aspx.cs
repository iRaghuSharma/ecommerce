using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;

public partial class ProductView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null)
            if (!IsPostBack)
            {

                //BindProductImage();
                BindProductDetails();
                BindProductImage2();
                BindProductImage();
            }
            else {
                //Response.Redirect("~/Products.aspx");
            }
    }


    protected string GetActiveImgClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";

        }
    }

    private void BindProductImage()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlCommand cmd1 = new SqlCommand("select * from tblProductImages where PID ='" + PID + "'", con))
        {
            cmd1.CommandType = CommandType.Text;
            using (SqlDataAdapter sda1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                rptrImage.DataSource = dt1;
                rptrImage.DataBind();

            }
        }
    }

    private void BindProductImage2()
    {
        //Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

        //SqlCommand cmd = new SqlCommand("SP_BindProductImages", con)
        //{
        //    CommandType = CommandType.StoredProcedure
        //};
        //cmd.Parameters.AddWithValue("@PID", PID);
        //using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //{
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);
        //    rptrImage.DataSource = dt;
        //    rptrImage.DataBind();
        //}
    }

    private void BindProductDetails()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlCommand cmd2 = new SqlCommand("select * from tblProducts where PID ='" + PID + "'", con))
        {
            cmd2.CommandType = CommandType.Text;
            using (SqlDataAdapter sda2 = new SqlDataAdapter(cmd2))
            {
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                rptrProductDetails.DataSource = dt2;
                rptrProductDetails.DataBind();

            }
        }
    }

    //private void BindProductDetails()
    //{
    //    Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
    //    {
    //        SqlCommand cmd = new SqlCommand("SP_BindProductDetails", con)
    //        {
    //            CommandType = CommandType.StoredProcedure
    //        };
    //        cmd.Parameters.AddWithValue("@PID", PID);
    //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //        {
    //            DataTable dt = new DataTable();
    //            sda.Fill(dt);
    //            rptrProductDetails.DataSource = dt;
    //            rptrProductDetails.DataBind();
    //            Session["CartPID"] = Convert.ToInt32(dt.Rows[0]["PID"].ToString());
    //            Session["myPName"] = dt.Rows[0]["PName"].ToString();
    //            Session["myPPrice"] = dt.Rows[0]["PPrice"].ToString();
    //            Session["myPSelPrice"] = dt.Rows[0]["PSelPrice"].ToString();
    //        }

    //    }
    //}

    protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
            string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;
            string SubCatID = (e.Item.FindControl("hfSubCatID") as HiddenField).Value;
            string GenderID = (e.Item.FindControl("hfGenderID") as HiddenField).Value;

            RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;

            SqlCommand cmd = new SqlCommand("select * from tblSizes where BrandID='" + BrandID + "' and CategoryID=" + CatID + " and SubCategoryID=" + SubCatID + " and GenderID=" + GenderID + "", con);
                
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rblSize.DataSource = dt;
                        rblSize.DataTextField = "sizename";
                        rblSize.DataValueField = "sizeid";
                        rblSize.DataBind();
                    }
        }
    }


    protected void btnAddToCart_Click1(object sender, EventArgs e)
    {
        string SelectedSize = string.Empty;
        foreach (RepeaterItem item in rptrProductDetails.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                var rbList = item.FindControl("rblSize") as RadioButtonList;
                SelectedSize = rbList.SelectedValue;
                var lblError = item.FindControl("lblError") as Label;
                lblError.Text = "";
            }
        }

        if (SelectedSize != "")
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                CookiePID = CookiePID + "," + PID + "-" + SelectedSize;

                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = CookiePID;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            else
            {
                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedSize;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            //AddToCartProduction();
            Response.Redirect("ProductView.aspx?PID=" + PID);


        }
        else
        {
            foreach (RepeaterItem item in rptrProductDetails.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "Please select a size";
                }
            }

        }
    
    }
    protected void rptrProductDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}