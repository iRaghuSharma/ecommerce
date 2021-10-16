using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddBrand : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        lblAlert.Visible = false;
        if(!IsPostBack)
        {
            BindBrandRepeater();
        }
    }

    private void BindBrandRepeater()
    {
        using (SqlCommand cmd1 = new SqlCommand("select * from tblBrands ", con)) 
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptrBrands.DataSource = dt;
                rptrBrands.DataBind();
                               
            }
        }
    }

    protected void btnAddBrand_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblBrands values('" + txtBrandname.Text + "')", con);
        int i = cmd.ExecuteNonQuery();

        if (i != 0)
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Brand Added Successfully...";
            lblAlert.ForeColor = System.Drawing.Color.Green;
            txtBrandname.Text = string.Empty;
            txtBrandname.Focus();
        }
        else {
            lblAlert.Visible = true;
            lblAlert.Text = "Something Not Well ! Try Again...";
            lblAlert.ForeColor = System.Drawing.Color.Red;
        }
        BindBrandRepeater();
        con.Close();
        
    }
}