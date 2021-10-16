<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
    <h3>Welcome to view all products</h3>

    <div class="row" style ="padding-top:50px;">
        <asp:Repeater ID="rptrProducts" runat="server">
        <ItemTemplate>
        <div class="col-sm-3 col-md-3">
            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
            <div class="thumbnail">
                <img src="images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention")%>" alt="<%# Eval("Name") %>" />
                <div class="caption">
                    <div class="proBrand"><%# Eval ("BrandName") %></div>
                    <div class="proName"><%# Eval ("PName") %></div>
                    <div class="proPrice"> 
                        <span class="proOgPrice"><%# Eval ("PPrice") %></span>
                        <%# Eval("PSelPrice") %>
                        <span class="proPriceDiscount"><%# Eval("DiscAmount") %> Off</span>

                    </div>

                </div>

            </div>

        </div>
            </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

