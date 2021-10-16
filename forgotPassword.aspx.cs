using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

public partial class forgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=Raghu\\RAGHU_SQL;Initial Catalog=myEshopDB;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        lblResetPassMsg.Visible = false;
    }
    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from signup where email = @email", con);
        cmd.Parameters.AddWithValue("@email", txtEmailID.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            string myGUID = Guid.NewGuid().ToString();
            int uid = Convert.ToInt32(dt.Rows[0][0]);
            SqlCommand cmd1 = new SqlCommand("insert into ForgotPass values('" + myGUID + "','" + uid + "', GETDATE())", con);
            cmd1.ExecuteNonQuery();

            //Send reset email link via Email

            string ToEmailAddress = dt.Rows[0][4].ToString();
            string Username = dt.Rows[0][1].ToString();
            string EmailBody = "Hi " + Username + ", <br/> <br/> <br/> Click the link below to reset your password <br/> <br/> http://localhost:49670/myE-shop/recoverPassword.aspx?id=" + myGUID;

            MailMessage PassRecMail = new MailMessage("rsharmapbt98@gmail.com", ToEmailAddress);
            PassRecMail.Body = EmailBody;
            PassRecMail.IsBodyHtml = true;
            PassRecMail.Subject = "Reset Password";

            //using (SmtpClient client = new SmtpClient())
            //{
            //    client.EnableSsl = true;
            //    client.UseDefaultCredentials = false;
            //    client.Credentials = new NetworkCredential("rsharmapbt98@gmail.com", "iasraghu");
            //    client.Host = "smtp.gmail.com";
            //    client.Port = 587;
            //    client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //    client.Send(PassRecMail);
            //}

            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            SMTP.Credentials = new NetworkCredential()
            {
                UserName = "rsharmapbt98@gmail.com",
                Password = "iasraghu"
            };
            SMTP.EnableSsl = true;
            SMTP.Send(PassRecMail);

            //-----------------End Send reset email link via Email

            lblResetPassMsg.Visible = true;
            lblResetPassMsg.Text = "Reset Link send ! Check Your Email for reset Password";
            lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
            txtEmailID.Text = string.Empty;
        }
        else {
            lblResetPassMsg.Visible = true;
            lblResetPassMsg.Text = "OOps! This Email does not Exist... Try Again";
            lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
            txtEmailID.Text = string.Empty;
        }
    }
}