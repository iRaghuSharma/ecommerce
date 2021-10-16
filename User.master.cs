using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Username"] != null)
        {
            //lblSuccess.Text = "Login Success, Welcome " + Session["Username"].ToString();
            btnLogOut.Visible = true;
            btnLogin.Visible = false;
        }
        else
        {
            //Response.Redirect("~/signin.aspx");
            btnLogOut.Visible = false;
            btnLogin.Visible = true;
            Response.Redirect("~/Default.aspx");
        }
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {

    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Default.aspx");
        Session["Username"] = null;
    }
    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }
}
