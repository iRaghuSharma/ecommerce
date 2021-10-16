<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <h2>Add Category</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category Name"></asp:Label>
                    <div class="col-md-3">

                        <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Category Name" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

               
                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddCategory" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddCategory_Click" />
                        <asp:Label ID="lblAlert" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

             </div>

     <h1>Category</h1>
        <hr />
        <div class="panel panel-default">

            <div class="panel-heading">All Category</div>
            <asp:Repeater ID="rptrCategory" runat="server">

                <HeaderTemplate>

                    <table class="table">
                <thead>
                    <tr>
                        <th> # </th>
                        <th>Category </th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                </HeaderTemplate>

                <ItemTemplate>

                            <tr>
                        <td><%# Eval("CatID") %> </td>
                        <td><%# Eval("CatName") %> </td>
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

