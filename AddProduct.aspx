<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <br /><br /> 
            <h2>Add Product</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Product Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Sell Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSellPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="Brand"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label6" CssClass="col-md-2 control-label" runat="server" Text="Sub Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label12" CssClass="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged"></asp:DropDownList>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label7" CssClass="col-md-2 control-label" runat="server" Text="Size"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBoxList ID="cblSize" CssClass="form-control" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label20" CssClass="col-md-2 control-label" runat="server" Text="Quantity"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtQty" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label8" CssClass="col-md-2 control-label" runat="server" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label9" CssClass="col-md-2 control-label" runat="server" Text="Product Details"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPDetails" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>


            <div class="form-group">
                <asp:Label ID="Label11" CssClass="col-md-2 control-label" runat="server" Text="Materials and Care"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtMatCare" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label13" CssClass="col-md-2 control-label" runat="server" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label10" CssClass="col-md-2 control-label" runat="server" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label14" CssClass="col-md-2 control-label" runat="server" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg03" CssClass="form-control" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label15" CssClass="col-md-2 control-label" runat="server" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg04" CssClass="form-control" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label16" CssClass="col-md-2 control-label" runat="server" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg05" CssClass="form-control" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label17" CssClass="col-md-2 control-label" runat="server" Text="Free Delivery"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="cbFD" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label18" CssClass="col-md-2 control-label" runat="server" Text="30 Days Return"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="cb30Return" runat="server" />
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label19" CssClass="col-md-2 control-label" runat="server" Text="Cash On Delivery"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="cbCOD" runat="server" />
                </div>

            </div>

            <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Add Product" OnClick="btnAdd_Click" />
                        
                    </div>
                </div>

        </div>


    </div>




</asp:Content>

