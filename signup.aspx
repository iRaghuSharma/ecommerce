<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
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
                            <li class="active"><a href="signup.aspx">Sign up</a></li>
                            <li><a href="signin.aspx">Sign in</a></li>
                        </ul>

                    </div>


                </div>

            </div>
    </div>

<!------ Sign Up Page------>
        <div class="center-page">
            <label class="col-xs-11">User Name :</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter Your Name"></asp:TextBox>
            </div>
            <br />
             <label class="col-xs-11">New Password :</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create Your Password"></asp:TextBox>
               </div> <br />
                 <label class="col-xs-11">Confirm Password :</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtCnfPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Repeat Password"></asp:TextBox>
              </div>  <br />
                 <label class="col-xs-11">Full Name :</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter Your Full Name"></asp:TextBox>
              </div>  <br />
                 <label class="col-xs-11">E-Mail :</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Email"></asp:TextBox>
            </div>
            <label class="col-xs-11"></label>
            <div class="col-xs-11">
            <asp:Button ID="txtsignup" runat="server" CssClass="btn btn-success"  Text="Sign UP" OnClick="txtsignup_Click" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
                    </div>
        
        </div>


        <!------ Sign Up Page End------>


        <footer class="footer-pos">
                <div class="container">
                    <p class="pull-right"> <a href="#"> Back To Top</a></p>
                    <p>2020 &copy; My E-Shop &middot; <a href="Default.aspx">Home</a> &middot; <a href="Default.aspx">Contact</a> &middot; <a href="Default.aspx">About</a></p>
                </div>

            </footer>
    </form>
</body>
</html>
