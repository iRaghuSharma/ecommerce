using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class AddSize : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        lblAlert.Visible = false;
        ddlSubCatID.Enabled = false;
        if (!IsPostBack)
        {
            BindBrand();
            BindCat();
            
            BindGender();
            BindSizeRptr();
        }
    }

    private void BindSizeRptr()
    {
        using (SqlCommand cmd5 = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategory B on B.CatID = A.CategoryID inner join tblBrands C on C.BrandID =A.BrandID inner join tblSubCategory D on D.SubCatID =A.SubCategoryID inner join tblGender E on E.GenderID = A.GenderID ", con))
        {
            using (SqlDataAdapter sda4 = new SqlDataAdapter(cmd5))
            {
                DataTable dt = new DataTable();
                sda4.Fill(dt);
                rptrSize.DataSource = dt;
                rptrSize.DataBind();

            }
        }
    }


    protected void btnAddSize_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblSizes(SizeName, BrandID, CategoryID, SubCategoryID, GenderID ) values('" + txtSize.Text + "', '" + ddlBrand.SelectedItem.Value + "', '"+ddlCatID.SelectedItem.Value+"', '"+ddlSubCatID.SelectedItem.Value+"','"+ddlGender.SelectedItem.Value+"')", con);
        int i = cmd.ExecuteNonQuery();

        if (i != 0)
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Size Added Successfully...";
            lblAlert.ForeColor = System.Drawing.Color.Green;

            txtSize.Text = string.Empty;

            ddlBrand.ClearSelection();
            //ddlBrand.Items.FindByValue("0").Selected = true;

            ddlCatID.ClearSelection();
            //ddlCatID.Items.FindByValue("0").Selected = true;

            ddlSubCatID.ClearSelection();
            ddlSubCatID.Items.FindByValue("0").Selected = true;

            ddlGender.ClearSelection();
            ddlGender.Items.FindByValue("0").Selected = true;
            txtSize.Focus();
        }
        else
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Something Not Well ! Try Again...";
            lblAlert.ForeColor = System.Drawing.Color.Red;
        }
        BindSizeRptr();
        con.Close();
    }

    private void BindBrand()
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from tblBrands", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd1);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            ddlBrand.DataSource = dt;
            ddlBrand.DataTextField = "Name";
            ddlBrand.DataValueField = "BrandID";
            ddlBrand.DataBind();
            ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        con.Close();
    }

    private void BindCat()
    {
        con.Open();
        SqlCommand cmd2 = new SqlCommand("Select * from tblCategory", con);
        SqlDataAdapter sda1 = new SqlDataAdapter(cmd2);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        if (dt1.Rows.Count != 0)
        {
            ddlCatID.DataSource = dt1;
            ddlCatID.DataTextField = "CatName";
            ddlCatID.DataValueField = "CatID";
            ddlCatID.DataBind();
            ddlCatID.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        con.Close();
    }

    
    private void BindGender()
    {
        con.Open();
        SqlCommand cmd4 = new SqlCommand("Select * from tblGender with (nolock)", con);
        SqlDataAdapter sda3 = new SqlDataAdapter(cmd4);
        DataTable dt3 = new DataTable();
        sda3.Fill(dt3);
        if (dt3.Rows.Count != 0)
        {
            ddlGender.DataSource = dt3;
            ddlGender.DataTextField = "GenderName";
            ddlGender.DataValueField = "GenderID";
            ddlGender.DataBind();
            ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        con.Close();
        
    }


    protected void ddlCatID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubCatID.Enabled = true;
        int MainCategoryID = Convert.ToInt32(ddlCatID.SelectedItem.Value);
        con.Open();
        SqlCommand cmd3 = new SqlCommand("Select * from tblSubCategory where MainCatID = '" + ddlCatID.SelectedItem.Value + "' ", con);
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd3);
        DataTable dt2 = new DataTable();
        sda2.Fill(dt2);
        if (dt2.Rows.Count != 0)
        {
            ddlSubCatID.DataSource = dt2;
            ddlSubCatID.DataTextField = "SubCatName";
            ddlSubCatID.DataValueField = "SubCatID";
            ddlSubCatID.DataBind();
            ddlSubCatID.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        con.Close();
    }
    
}