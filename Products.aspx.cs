using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindProductRptr();
        }
    }

    private void BindProductRptr()
    {
        using (SqlCommand cmd1 = new SqlCommand("procBindAllProducts", con))
        {
            cmd1.CommandType = CommandType.StoredProcedure;
            using (SqlDataAdapter sda1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                rptrProducts.DataSource = dt1;
                rptrProducts.DataBind();

            }
        }
    }
}