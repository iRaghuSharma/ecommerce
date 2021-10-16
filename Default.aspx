<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My E-Shopping Website</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous">   </script>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge, chrome=1" />
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

    </script>
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
                            <li class="active"><a href="Default.aspx">Home</a></li>
                            <li><a href="Default.aspx">About</a></li>
                            <li><a href="Default.aspx">Contact</a></li>
                            <li><a href="Default.aspx">Pricing</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                                <ul class="dropdown-menu" >
                                    <li><a href="Products.aspx">All Products</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Man</li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Shirts</a></li>
                                <li><a href="#">Pants</a></li>
                                <li><a href="#">Denims</a></li>

                                    <li class="dropdown-header">Man</li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Shirts</a></li>
                                <li><a href="#">Pants</a></li>
                                <li><a href="#">Denims</a></li>
                                </ul>
                            </li>
                            <button id="btnCart" class="btn btn-primary navbar-btn" type="button">Cart<span class="badge" id="pCount" runat="server">&nbsp;</span>

                            </button>
                            <li id="btnSignUP" runat="server"><a href="signup.aspx">Sign up</a></li>
                            <li id="btnSignIN" runat="server"><a href="signin.aspx">Sign in</a></li>
                             <asp:Button ID="btnLogOut" CssClass="btn btn-default navbar-btn" runat="server" Text="Log Out" OnClick="btnLogOut_Click" />
                        </ul>

                    </div>


                </div>

            </div>
            <!------image slider------->
            
            <div class="container">

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="imgSlider/slider1.png" style="width: 100%;" />
                        </div>

                        <div class="item">
                            <img src="imgSlider/slider2.png" style="width: 100%;" />
                        </div>

                        <div class="item">
                            <img src="imgSlider/slider4.png" style="width: 100%;" />
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>


            <!------image slider End------->

            <!------Middle Content Start------->
            <hr />
            <div class="container center">
                <div class="row">
                    <div class="col-lg-4">
                        <img class="img-circle" src="Product/mob1.jpg" alt="thumb" width="140" height="140" />
                        <h2>Mobiles</h2>
                        <p>
                            The realme C20 is a mobile phone that will keep you entertained and productive at the same time. Its 16.5 cm (6.5) Large HD+ Display ensures that you get an expansive view of movies, games, and even work-related docs for a more immersive experience. Thanks to the Helio G35 Powerful Processor, you can enjoy a high clock speed that will make it almost effortless for you to multitask and game. And, with the AI Selfie Camera, you can take stunning selfies that will be a hit on social media.
                        </p>
                        <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                    </div>

                    <div class="col-lg-4">
                        <img class="img-circle" src="Product/shoe1.jpg" alt="thumb" width="140" height="140" />
                        <h2>Shoes</h2>
                        <p>
                            The realme C20 is a mobile phone that will keep you entertained and productive at the same time. Its 16.5 cm (6.5) Large HD+ Display ensures that you get an expansive view of movies, games, and even work-related docs for a more immersive experience. Thanks to the Helio G35 Powerful Processor, you can enjoy a high clock speed that will make it almost effortless for you to multitask and game. And, with the AI Selfie Camera, you can take stunning selfies that will be a hit on social media.
                        </p>
                        <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                    </div>

                    <div class="col-lg-4">
                        <img class="img-circle" src="Product/v-shape-t-shirt.jpg" alt="thumb" width="140" height="140" />
                        <h2>T-Shirts</h2>
                        <p>
                            The realme C20 is a mobile phone that will keep you entertained and productive at the same time. Its 16.5 cm (6.5) Large HD+ Display ensures that you get an expansive view of movies, games, and even work-related docs for a more immersive experience. Thanks to the Helio G35 Powerful Processor, you can enjoy a high clock speed that will make it almost effortless for you to multitask and game. And, with the AI Selfie Camera, you can take stunning selfies that will be a hit on social media.
                        </p>
                        <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                    </div>
                </div>
            </div>




            <!------Middle Content End------->

            <footer>
                <div class="container">
                    <p class="pull-right"> <a href="#"> Back To Top</a></p>
                    <p>2020 &copy; My E-Shop &middot; <a href="Default.aspx">Home</a> &middot; <a href="Default.aspx">Contact</a> &middot; <a href="Default.aspx">About</a></p>
                </div>

            </footer>


        </div>
    </form>



</body>
</html>
