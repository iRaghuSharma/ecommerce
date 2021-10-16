<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddGender.aspx.cs" Inherits="AddGender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <h2>Add Gender</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
                    <div class="col-md-3">

                        <asp:TextBox ID="txtGender" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" CssClass="text-danger" ErrorMessage="Please Fill Gender" ControlToValidate="txtGender" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

               
                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddGender" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddGender_Click" />
                        <asp:Label ID="lblAlert" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

             </div>

         <h1>Gender</h1>
        <hr />
        <div class="panel panel-default">

            <div class="panel-heading">All Gender</div>
            <asp:Repeater ID="rptrGender" runat="server">

                <HeaderTemplate>

                    <table class="table">
                <thead>
                    <tr>
                        <th> # </th>
                        <th>Gender </th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                </HeaderTemplate>

                <ItemTemplate>

                            <tr>
                        <td><%# Eval("GenderID") %> </td>
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

