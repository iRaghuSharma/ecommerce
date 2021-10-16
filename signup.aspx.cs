using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



public partial class signup : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }
    protected void txtsignup_Click(object sender, EventArgs e)
    {
        //emailAlreadyExists();

        if (isformvalid())
        {
            
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into signup values('" + txtusername.Text + "', '" + txtPass.Text + "','" + txtname.Text + "', '" + txtEmail.Text + "','User')", con);
            cmd.ExecuteNonQuery();
            
            Response.Write("<script> alert('Resgistered Successfully...')</script>");
          
            
            Label1.Visible = true;
            Label1.Text = "Record Saved Successfully.";
            Label1.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("~/signin.aspx");
            clr();
            
        }
        else {
            Response.Write("<script> alert('Resgistration Failed...')</script>");
            Label1.Visible = true;
            Label1.Text = "All Fields Are Mendatory.";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }

    private bool isformvalid()
    {
        if(txtusername.Text=="")
        {
            Response.Write("<script> alert('User Name Not Valid...')</script>");
            txtusername.Focus();
            return false;
            
        }
        else if(txtPass.Text!=txtCnfPass.Text)
        {
            Response.Write("<script> alert('Confirm Password Not Match...')</script>");
            txtPass.Focus();
            return false;
        }
        else if(txtEmail.Text=="")
        {
            Response.Write("<script> alert('Email Not Valid')</script>");
            txtEmail.Focus();
            return false;
        }
        else if(txtname.Text=="")
        {
            Response.Write("<script> alert('Name Not Valid')</script>");
            txtname.Focus();
            return false;
        }
        return true;

    }

    //private bool emailAlreadyExists()
    //{
        
        //Boolean emailIdExists = false;
        //string mycon = "Data Source=DESKTOP-J9P1JJJ\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True";
        //string myquerey = "select * from signup where email ='" + txtEmail.Text + "' ";
        //SqlConnection con1 = new SqlConnection(mycon);
        //SqlCommand cmd1 = new SqlCommand();
        //cmd1.CommandText = myquerey;
        //cmd1.Connection = con1;
        //SqlDataAdapter sda = new SqlDataAdapter();
        //sda.SelectCommand = cmd1;
        //DataSet ds = new DataSet();
        //sda.Fill(ds);
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    emailIdExists = true;
        //    Response.Write("<script> alert('Email id Already Exists..')</script>");
        //}
        //else { 
        //}
        //con.Close();
        //return emailIdExists;
//---------------------------------------------------------------------------------------------
        //con.Open();
        //Boolean emailIdExists = false;
        //SqlCommand cmd1 = new SqlCommand( "select * from signup where email = '" + txtEmail.Text + "' ", con);
        //SqlDataAdapter sda = new SqlDataAdapter(cmd1);
        //DataSet ds = new DataSet();
        //sda.Fill(ds);
        //if (ds.Tables[0].Rows.Count != 0)
        //{
        //    emailIdExists = true;
        //    txtEmail.Text = "Email Already is Already Exists.";
        //}
        //else {
            
        //}
        //con.Close();
        //return emailIdExists;

 //----------------------------------------------------------------------------------------
        //con.Open();

        //string querey = "select * from signup where email ='" + txtEmail.Text + "'";

        //SqlCommand cmd1 = new SqlCommand(querey, con);

        //SqlDataReader dr = cmd1.ExecuteReader();

        //bool found = dr.Read();
        //con.Close();
        //if (found)
        //{

        //    Response.Write("<Script> alert('Email id already Exists...') </script>");
        //    return false;
        //}

        //else
        //{

        //}
        
        //return true;
        
  // }
    private void clr()
    {
        txtname.Text=string.Empty;
        txtusername.Text=string.Empty;
        txtPass.Text=string.Empty;
        txtEmail.Text=string.Empty;
        txtCnfPass.Text=string.Empty;
    }

    
}