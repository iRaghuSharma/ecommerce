using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class AddProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        ddlSubCategory.Enabled = false;
        ddlGender.Enabled = false;

        if (!IsPostBack) 
        {
            BindBrand();
            BindCategory();
            BindGender();

        }
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

    private void BindCategory()
    {
        con.Open();
        SqlCommand cmd2 = new SqlCommand("Select * from tblCategory", con);
        SqlDataAdapter sda1 = new SqlDataAdapter(cmd2);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        if (dt1.Rows.Count != 0)
        {
            ddlCategory.DataSource = dt1;
            ddlCategory.DataTextField = "CatName";
            ddlCategory.DataValueField = "CatID";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
        cmd.Parameters.AddWithValue("@PPrice",txtPrice.Text);
        cmd.Parameters.AddWithValue("@PSelPrice", txtSellPrice.Text);
        cmd.Parameters.AddWithValue("@PbrandID", ddlBrand.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@PCategoryID",ddlCategory.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@PSubCatID", ddlSubCategory.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@PGenderID", ddlGender.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
        cmd.Parameters.AddWithValue("@PProductDetails", txtPDetails.Text);
        cmd.Parameters.AddWithValue("@PMaterialCare", txtMatCare.Text);
        if (cbFD.Checked == true)
        {
            cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
        }
        else {
            cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
        }

        if (cb30Return.Checked==true)
        {
            cmd.Parameters.AddWithValue("@30DayReturn", 1.ToString());
        }
        else
        {
            cmd.Parameters.AddWithValue("@30DayReturn", 0.ToString());
        }

        if (cbCOD.Checked == true)
        {
            cmd.Parameters.AddWithValue("@COD", 1.ToString());
        }
        else
        {
            cmd.Parameters.AddWithValue("@COD", 0.ToString());
        }
        con.Open();
        Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

        // Insert Size Qunatity

        
        for (int i = 0; i < cblSize.Items.Count; i++)
        {
            if (cblSize.Items[i].Selected == true)
            {
                Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                int Quantity = Convert.ToInt32(txtQty.Text);
                SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQty values ('" + PID + "','" + SizeID + "','" + Quantity + "')", con);
                cmd2.ExecuteNonQuery();
            }
        }

        // Insert and upload images

        if(fuImg01.HasFile)
        {
            string SavePath = Server.MapPath("~/images/ProductImages/") + PID;
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
            fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);
            SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values ('" + PID + "','" + txtProductName.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
            cmd3.ExecuteNonQuery();
        }

        // Insert and upload images

        if (fuImg02.HasFile)
        {
            string SavePath = Server.MapPath("~/images/ProductImages/") + PID;
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
            fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);
            SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values ('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
            cmd4.ExecuteNonQuery();
        }

        // Insert and upload images

        if (fuImg03.HasFile)
        {
            string SavePath = Server.MapPath("~/images/ProductImages/") + PID;
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
            fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);
            SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values ('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
            cmd5.ExecuteNonQuery();
        }

        // Insert and upload images

        if (fuImg04.HasFile)
        {
            string SavePath = Server.MapPath("~/images/ProductImages/") + PID;
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
            fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);
            SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values ('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
            cmd6.ExecuteNonQuery();
        }

        // Insert and upload images

        if (fuImg05.HasFile)
        {
            string SavePath = Server.MapPath("~/images/ProductImages/") + PID;
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string Extention = Path.GetExtension(fuImg05.PostedFile.FileName);
            fuImg05.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "05" + Extention);
            SqlCommand cmd7 = new SqlCommand("insert into tblProductImages values ('" + PID + "','" + txtProductName.Text.ToString().Trim() + "05" + "','" + Extention + "')", con);
            cmd7.ExecuteNonQuery();
        }
        clr();

    }


    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubCategory.Enabled = true;
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
        con.Open();
        SqlCommand cmd3 = new SqlCommand("Select * from tblSubCategory where MainCatID = '" + ddlCategory.SelectedItem.Value + "' ", con);
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd3);
        DataTable dt2 = new DataTable();
        sda2.Fill(dt2);
        if (dt2.Rows.Count != 0)
        {
            ddlSubCategory.DataSource = dt2;
            ddlSubCategory.DataTextField = "SubCatName";
            ddlSubCategory.DataValueField = "SubCatID";
            ddlSubCategory.DataBind();
            ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));


        }
        else { }

        if (ddlCategory.SelectedIndex != 0)
        {
            ddlSubCategory.Enabled = true;
        }
        else
        {
            ddlSubCategory.Enabled = false;
        }

        
        con.Close();
    }

    private void BindGender()
    {
        
        con.Open();
        SqlCommand cmd4 = new SqlCommand("Select * from tblGender", con);
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



    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSubCategory.SelectedIndex != 0)
        {
            ddlGender.Enabled = true;
        }
        else
        {
            ddlGender.Enabled = false;

        }
        
    }
    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd3 = new SqlCommand("Select * from tblSizes where BrandID = '" + ddlBrand.SelectedItem.Value + "' and CategoryID='" + ddlCategory.SelectedItem.Value + "' and SubCategoryID='" + ddlSubCategory.SelectedItem.Value + "' and GenderID='" + ddlGender.SelectedItem.Value + "' ", con);
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd3);
        DataTable dt2 = new DataTable();
        sda2.Fill(dt2);
        if (dt2.Rows.Count != 0)
        {
            cblSize.DataSource = dt2;
            cblSize.DataTextField = "SizeName";
            cblSize.DataValueField = "SizeID";
            cblSize.DataBind();
            
        }
    }

    private void clr()
    {
        txtProductName.Text=string.Empty;
        txtPrice.Text=string.Empty;
        txtSellPrice.Text=string.Empty;
        ddlBrand.Items.Clear();
        ddlCategory.Items.Clear();
        ddlSubCategory.Items.Clear();
        ddlGender.Items.Clear();
        cblSize.SelectedIndex = -1;
        txtQty.Text = string.Empty;
        txtDescription.Text=string.Empty;
        txtPDetails.Text=string.Empty;
        txtMatCare.Text=string.Empty;
        cbFD.Checked=false;
        cbCOD.Checked=false;
        cb30Return.Checked=false;
        
    }
}