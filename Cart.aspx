<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-top:50px;">
        
        <div class="col-md-9">
            <h4 class="proNameViewCart" runat="server" id="h4Items"></h4>
            <asp:Repeater ID="rptrCartProducts" runat="server">
                <ItemTemplate>

            <div class="media" style="border:1px solid black;">
                <div class="media-left">
                    <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                        <img src="images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>">
                    </a>
                </div>
                <div class="media-body">
                    <h4 class="media-heading proNameViewCart"><%#Eval ("PName") %></h4>
                    <p class="proPriceDiscountView"><%#Eval ("SizeNamee") %></p>
                    <span class="proPriceView"><%#Eval ("PSelPrice","{0:c}") %></span>
                    <span class="proOgPriceView"><%#Eval ("PPrice", "{0:00.0}") %></span>
                   <p>
                <asp:Button ID="btnRemoveCart" Class="RemoveButton1" runat="server" Text="REMOVE CART" OnClick="btnRemoveCart_Click" />
                    </p>           
                </div>
                
            </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col-md-3" runat="server" id="divAmountSect">
            <%--------------------------------------------%>
            <div>
                <h2>Price Details</h2>
                <label>Cart Total</label>
                <span class="pull-right priceGray" runat="server" id="spanCartTotal"></span>
                <div>
                    <label>Cart Discount</label>
                    <span class="pull-right priceGreen" runat="server" id="spanDiscount"></span>
                </div>
            </div>


            <%--------------------------------------------%>
            <div>
                <div class="proPriceView">
                    <label>Cart Total</label>
                    <span class="pull-right" runat="server" id="spanTotal"></span>
                </div>
                <div>
                    <asp:Button ID="btnBuy" Class="buyNowbtn" runat="server" Text="Buy Now" OnClick="btnBuy_Click" />
                </div>
            </div>


        </div>

    </div>

</asp:Content>

