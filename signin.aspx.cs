using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class signin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["Uname"] != null && Request.Cookies["Upass"] != null)
            { 
                txtUsername.Text=Request.Cookies["Uname"].Value;
                txtpass.Text = Request.Cookies["Upass"].Value;
                CheckBox1.Checked = true;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from signup where userName=@userName and password =@password", con);
        cmd.Parameters.AddWithValue("@userName", txtUsername.Text);
        cmd.Parameters.AddWithValue("@password", txtpass.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            if (CheckBox1.Checked)
            {
                Response.Cookies["Uname"].Value = txtUsername.Text;
                Response.Cookies["Upass"].Value = txtpass.Text;
                Response.Cookies["Uname"].Expires = DateTime.Now.AddYears(2);
                Response.Cookies["Upass"].Expires = DateTime.Now.AddYears(2);
            }
            else
            {
                Response.Cookies["Uname"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Upass"].Expires = DateTime.Now.AddDays(-1);
            }

            string Utype;
            Utype = dt.Rows[0][5].ToString().Trim();

            if (Utype == "User")
            {
                Session["Username"] = txtUsername.Text;
                Response.Redirect("~/UserHome.aspx");
            }

            if (Utype == "Admin")
            {
                Session["Username"] = txtUsername.Text;
                Response.Redirect("~/AdminHome.aspx");
            }

            else
            {
                lblError.Text = "Invalid Username Or Password.";
            }

            con.Close();

            clr();
        }
    }

    private void clr()
    {
        txtUsername.Text = string.Empty;
        txtpass.Text = string.Empty;
        txtUsername.Focus();
    }
}