using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddGender : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        lblAlert.Visible = false;

        if(!IsPostBack)
        {
            BindGenderRepeater();
        }
    }

    private void BindGenderRepeater()
    {
        using (SqlCommand cmd1 = new SqlCommand("select * from tblGender ", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptrGender.DataSource = dt;
                rptrGender.DataBind();

            }
        }
    }
    protected void btnAddGender_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tblGender values('" + txtGender.Text + "')", con);
        int i = cmd.ExecuteNonQuery();

        if (i != 0)
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Gender Added Successfully...";
            lblAlert.ForeColor = System.Drawing.Color.Green;
            txtGender.Text = string.Empty;
            txtGender.Focus();
        }
        else
        {
            lblAlert.Visible = true;
            lblAlert.Text = "Something Not Well ! Try Again...";
            lblAlert.ForeColor = System.Drawing.Color.Red;
        }
        BindGenderRepeater();
        con.Close();
    }
}