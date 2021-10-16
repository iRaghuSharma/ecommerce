<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <h2>Add Brand</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Brand Name"></asp:Label>
                    <div class="col-md-3">

                        <asp:TextBox ID="txtBrandname" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Brand Name" ControlToValidate="txtBrandname" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

               
                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddBrand_Click" />
                        <asp:Label ID="lblAlert" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

             </div>


         <h1>Brands</h1>
        <hr />
        <div class="panel panel-default">

            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="rptrBrands" runat="server">

                <HeaderTemplate>

                    <table class="table">
                <thead>
                    <tr>
                        <th> # </th>
                        <th>Brand </th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                </HeaderTemplate>

                <ItemTemplate>

                            <tr>
                        <td><%# Eval("BrandID") %> </td>
                        <td><%# Eval("Name") %> </td>
                        <td>Edit</td>

                    </tr>

                </ItemTemplate>

                <FooterTemplate>
                    </tbody>

            </table>
                </FooterTemplate>

            </asp:Repeater>

        </div>

    </div>

</asp:Content>

