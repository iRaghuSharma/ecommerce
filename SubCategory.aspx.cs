using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SubCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        lblAlert.Visible = false;
        if(!IsPostBack)
        {
            BindMainCat();
            BindSubCatRptr();
        }
    }

    private void BindSubCatRptr()
    {
        using (SqlCommand cmd2 = new SqlCommand("select A.*, B.* from tblSubCategory A inner join tblCategory B on B.CatID = A.MainCatID", con))
        {
            using (SqlDataAdapter sda1 = new SqlDataAdapter(cmd2))
            {
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                rptrSubCategory.DataSource = dt1;
                rptrSubCategory.DataBind();

            }
        }
    }

    
    protected void btnAddSubCategory_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblSubCategory(SubCatName, MainCatID) values('" + txtSubCategory.Text + "', '"+ddlMainCatID.SelectedItem.Value+"')", con);
        int i = cmd.ExecuteNonQuery();

        if (i != 0)
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Sub Category Added Successfully...";
            lblAlert.ForeColor = System.Drawing.Color.Green;
            txtSubCategory.Text = string.Empty;
            ddlMainCatID.ClearSelection();
            ddlMainCatID.Items.FindByValue("0").Selected = true;
            txtSubCategory.Focus();
        }
        else
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Something Not Well ! Try Again...";
            lblAlert.ForeColor = System.Drawing.Color.Red;
        }
        BindSubCatRptr();
        con.Close();
    }

    private void BindMainCat()
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from tblCategory", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd1);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if(dt.Rows.Count != 0 )
        {
            ddlMainCatID.DataSource = dt;
            ddlMainCatID.DataTextField="CatName";
            ddlMainCatID.DataValueField = "CatID";
            ddlMainCatID.DataBind();
            ddlMainCatID.Items.Insert(0,new ListItem ("-Select-","0"));
        }
              
        con.Close();
    }
}