<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <h2>Add Sub Category</h2>
                <hr />

                <div class="form-group">
                    <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Main Category ID"></asp:Label>
                    <div class="col-md-3">

                        <asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass="text-danger" ErrorMessage="Please Select Category" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Sub Category Name"></asp:Label>
                    <div class="col-md-3">

                        <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Sub Category Name" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

               
                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddSubCategory" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddSubCategory_Click" />
                        <asp:Label ID="lblAlert" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

             </div>

    <h1>Sub Category</h1>
        <hr />
        <div class="panel panel-default">

            <div class="panel-heading">All Sub-Categories</div>
            <asp:Repeater ID="rptrSubCategory" runat="server">

                <HeaderTemplate>

                    <table class="table">
                <thead>
                    <tr>
                        <th> # </th>
                        <th>Sub-Categories </th>
                        <th>Main Category </th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                </HeaderTemplate>

                <ItemTemplate>

                            <tr>
                        <td><%# Eval("SubCatID") %> </td>
                        <td><%# Eval("SubCatName") %> </td>
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

