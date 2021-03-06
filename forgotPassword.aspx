<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sign In</title>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge, chrome=1" />
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="nabvar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx"><span>
                        <img src="icon/logo.png" alt="My E-Shop" height="30" /></span>My E-Shop</a>

                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="Default.aspx">About</a></li>
                        <li><a href="Default.aspx">Contact</a></li>
                        <li><a href="Default.aspx">Pricing</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Man</li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#"></a>Shirts</li>
                                <li><a href="#"></a>Pants</li>
                                <li><a href="#"></a>Denims</li>

                                <li class="dropdown-header">Man</li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#"></a>Shirts</li>
                                <li><a href="#"></a>Pants</li>
                                <li><a href="#"></a>Denims</li>
                            </ul>
                        </li>
                        
                        <li><a href="signin.aspx">Sign in</a></li>
                    </ul>

                </div>


            </div>

        </div>

    </div>
        <br /><br /><br />
        <div class="container">
            <div class="form-horizontal">
                <h2>Recovery Password</h2>
                <hr />

                <h3>Please Enter your email address, we will send you the recovery link for your password.</h3>
                <div class="form-group">
                    <asp:Label ID="lblEmail" CssClass="col-md-2 control-label" runat="server" Text="Your Email Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtEmailID" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmailID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnResetPass" CssClass="btn btn-default" runat="server" Text="Reset Password" OnClick="btnResetPass_Click" />
                        <asp:Label ID="lblResetPassMsg" CssClass="text-danger" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>

        </div>

    </form>
      <!-------Footer Start ------>
        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back To Top</a></p>
                <p>2020 &copy; My E-Shop &middot; <a href="Default.aspx">Home</a> &middot; <a href="Default.aspx">Contact</a> &middot; <a href="Default.aspx">About</a></p>
            </div>

        </footer>
        <!------- Footer End------->
           
</body>
</html>
