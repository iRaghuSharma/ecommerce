<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <br />
            <br />
            <h2>Add Size</h2>
            <hr />

            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Size Name"></asp:Label>
                <div class="col-md-3">

                    <asp:TextBox ID="txtSize" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Size Name" ControlToValidate="txtSize" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Brand"></asp:Label>
                <div class="col-md-3">

                    <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" runat="server" CssClass="text-danger" ErrorMessage="Please Select Brand " ControlToValidate="ddlBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
                <div class="col-md-3">

                    <asp:DropDownList ID="ddlCatID" CssClass="form-control" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlCatID_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCatID" runat="server" CssClass="text-danger" ErrorMessage="Please Select Category" ControlToValidate="ddlCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="Sub Category"></asp:Label>
                <div class="col-md-3">

                    <asp:DropDownList ID="ddlSubCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCat" runat="server" CssClass="text-danger" ErrorMessage="Please Select Sub Category" ControlToValidate="ddlSubCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
                <div class="col-md-3">

                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" CssClass="text-danger" ErrorMessage="Please Select Gender" ControlToValidate="ddlGender" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>




            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAddSize" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddSize_Click" />
                    <asp:Label ID="lblAlert" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

        </div>


        <h1>Sizes</h1>
        <hr />
        <div class="panel panel-default">

            <div class="panel-heading">All Sizes</div>
            <asp:Repeater ID="rptrSize" runat="server">

                <HeaderTemplate>

                    <table class="table">
                        <thead>
                            <tr>
                                <th># </th>
                                <th>Size</th>
                                <th>Brand </th>
                                <th>Category </th>
                                <th>Sub Category </th>
                                <th>Gender </th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>

                    <tr>
                        <td><%# Eval("SizeID") %> </td>
                        <td><%# Eval("SizeName") %> </td>
                        <td><%# Eval("Name") %> </td>
                        <td><%# Eval("CatName") %> </td>
                        <td><%# Eval("SubCatName") %> </td>
                        <td><%# Eval("GenderName") %> </td>
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

