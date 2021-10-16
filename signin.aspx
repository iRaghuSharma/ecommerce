<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

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
                        <li><a href="signup.aspx">Sign up</a></li>
                        <li class="active"><a href="signin.aspx">Sign in</a></li>
                    </ul>

                </div>


            </div>

        </div>
</div>
        <!------- Sign IN For Start ----->
        <div class="container">
            <div class="form-horizontal">
                <br /> <br />
                <h2>Login Form</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="User Name"></asp:Label>
                    <div class="col-md-3">

                        <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" CssClass="text-danger" ErrorMessage="Please Enter User Name" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Password"></asp:Label>
                    <div class="col-md-3">

                        <asp:TextBox ID="txtpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Password" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Remember Me"></asp:Label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnLogin" CssClass="btn btn-success" runat="server" Text="Login &raquo;" OnClick="btnLogin_Click" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/signup.aspx">Sign up</asp:HyperLink>
                    </div>
                </div>

                <!-----------Forgot Password ------------->

                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:HyperLink ID="linkForgotPass" runat="server" NavigateUrl="~/forgotPassword.aspx">Forgot Password?</asp:HyperLink>
                    </div>
                </div>

                <!-----------Forgot Password End------------->

                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblError" CssClass="text-danger" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
       </div>

        <!------- Sign IN For End ----->
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
