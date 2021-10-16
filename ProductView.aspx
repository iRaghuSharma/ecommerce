<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
    <div style="padding-top:50px;">
        <div class="col-md-5">
            <div style="max-width:480px;" class="thumbnail">
                <%--For Product Image Slider--%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
      <li data-target="#carousel-example-generic" data-slide-to="4"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

      <asp:repeater ID="rptrImage" runat="server">
          <ItemTemplate>
    <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
      <img src="images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'">
      
    </div>
             </ItemTemplate>
    </asp:repeater>


  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
            
            <%-- Product Image Slider end--%>
            </div>

        </div>
        <div class="col-md-5">
            <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound" OnItemCommand="rptrProductDetails_ItemCommand">
            <ItemTemplate>
            <div class="divDet1">
            <h1 class="proNameView"><%#Eval("PName") %></h1>
            <div class="proPrice"> Rs.
                        <span class="proOgPrice"><%# Eval ("PPrice") %></span>
                        <%# Eval("PSelPrice") %>
                        <span class="proPriceDiscount"><%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> Off</span>

                    </div>
            <p class="proPriceView">Rs.<%#Eval("PSelPrice") %></p>
        </div>

            <div>
                <h5 class="h5size">SIZE</h5>
                <div>
                    <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="S" Text="S"></asp:ListItem>
                        <asp:ListItem Value="M" Text="M"></asp:ListItem>
                        <asp:ListItem Value="L" Text="L"></asp:ListItem>
                        <asp:ListItem Value="XL" Text="XL"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="divDet1">
                <asp:Button ID="btnAddToCart" Class="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddToCart_Click1" />
                <asp:Label ID="lblError" CssClass="text-danger" runat="server"></asp:Label>
            </div>

            <div class="divDet1">
                <h5 class="h5size">Description</h5>
                <p><%# ("PDescription") %></p>
                <h5 class="h5size">Product Details</h5>

                <p><%# ("PProductDetails") %></p>
            
            <h5 class="h5size">Material and Care</h5>
                <p><%# ("PMaterialCare") %></p>
                </div>
                <div class="h5size">
                    <p><%# ((int)Eval("FreeDelivery")==1)? "Free Delivery":"" %></p>
                    <p><%# ((int)Eval("30DayReturn")==1)? "30 Days Return":"" %></p>
                    <p><%# ((int)Eval("COD")==1)? "Cash On Delivery":"" %></p>
                
            </div>
                <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PCategoryID") %>' />
                <asp:HiddenField ID="hfSubCatID" runat="server" Value='<%# Eval("PSubCatID") %>' />
                <asp:HiddenField ID="hfGenderID" runat="server" Value='<%# Eval("PGenderID") %>' />
                <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("PBrandID") %>' />

                </ItemTemplate>
        </asp:Repeater>
                    </div>
        
    </div>



</asp:Content>

