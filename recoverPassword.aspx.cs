using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class recoverPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    string GUIDvalue;
    int uid;
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        GUIDvalue = Request.QueryString["id"];
        if (GUIDvalue != null)
        {
            SqlCommand cmd = new SqlCommand("select * from ForgotPass where id=@id", con);
            
            cmd.Parameters.AddWithValue("@id", GUIDvalue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            
            sda.Fill(dt);
            if(dt.Rows.Count!=0)
            {
                uid = Convert.ToInt32(dt.Rows[0][1]); 
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Your Password Reset link is Expired or Invalid.... Try Again";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
           
           
        }
        else {
            Response.Redirect("~/Default.aspx");
         }

        if(!IsPostBack)
        {
            if(dt.Rows.Count!=0)
            {
                txtConfirmPass.Visible=true;
                txtNewPass.Visible=true;
                lblNewPassword.Visible=true;
                lblConfirmPass.Visible=true;
                btnResetPass.Visible=true;
            }

            else
            {
             
            }
        
        }
        con.Close();
    }
    protected void btnResetPass_Click(object sender, EventArgs e)
    {
       if(txtNewPass.Text!="" && txtConfirmPass.Text!="" && txtNewPass.Text == txtConfirmPass.Text)
       {
        con.Open();
        SqlCommand cmd1 = new SqlCommand(" update signup set password=@p where uid = @uid", con);
        cmd1.Parameters.AddWithValue("@p", txtNewPass.Text);
        cmd1.Parameters.AddWithValue("@uid", uid);
        cmd1.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand(" delete from ForgotPass where uid = '"+uid+"'", con);
        cmd2.ExecuteNonQuery();

        Response.Write("<script> alert('Password Reset Successfully...')</script>");
        Response.Redirect("~/signin.aspx");
       }
    }
}