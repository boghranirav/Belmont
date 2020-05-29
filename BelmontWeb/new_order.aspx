<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="new_order.aspx.cs" Inherits="new_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
<style>
body
{
font-family: Arial;
font-size: 20px;
}

.mydropdownlist
{
color: #fff;
font-size: 20px;
padding: 5px 10px;
border-radius: 5px;
background-color: #cc2a41;
font-weight: bold;
}

.mydropdownlist1
{
color: #000000;
font-size: 20px;
padding: 5px 10px;
border-radius: 5px 12px;
background-color: #292929;
font-weight: bold;
}

.GridViewStyle
{
    font-family: Arial, Sans-Serif;
    font-size:small;
    table-layout: auto;
    border-collapse: collapse;
    border: #1d1d1d 5px solid;
}
/*Header and Pager styles*/
.HeaderStyle, .PagerStyle /*Common Styles*/
{
    background-image: url(Images/HeaderGlassBlack.jpg);
    background-position:center;
    background-repeat:repeat-x;
    background-color:#1d1d1d;
}
.HeaderStyle th
{
    padding: 5px;
    color: #ffffff;
}
.HeaderStyle a
{
    text-decoration:none;
    color:#1d1d1d;
    display:block;
    text-align:left;
    font-weight:normal;
}
.PagerStyle table
{
    text-align:center;
    margin:auto;
}
.PagerStyle table td
{
    border:0px;
    padding:5px;
}
.PagerStyle td
{
    border-top: #1d1d1d 3px solid;
}
.PagerStyle a
{
    color:#ffffff;
    text-decoration:none;
    padding:2px 10px 2px 10px;
    border-top:solid 1px #777777;
    border-right:solid 1px #333333;
    border-bottom:solid 1px #333333;
    border-left:solid 1px #777777;
}
.PagerStyle span
{
    font-weight:bold;
    color:#FFFFFF;
    text-decoration:none;
    padding:2px 10px 2px 10px;
}
/*RowStyles*/
.RowStyle td, .AltRowStyle td, .SelectedRowStyle td, .EditRowStyle td /*Common Styles*/
{
    padding: 5px;
    border-right: solid 1px #1d1d1d;
}
.RowStyle td
{
    background-color: #af7b7b;
}
.AltRowStyle td
{
    background-color: #c14646;
}
.SelectedRowStyle td
{
    background-color: #ffff66;
}
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>New Order</h2></div>
            </div>
        </div>
    </section>

    <section class="contact-section sp-one">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 contact-column">
                    <div class="contact-form-area">
                        <h3>Place New Order &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a href="past_order.aspx">Past Order</a></h3>
                        <hr style="height: 2px; border: none; color: #333; background-color: #333;" />
                        <form runat="server" name="contact_form" class="default-form" method="post">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <div class="row">
                                <div style="width: 100%; border-color: black;">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="cmbItem" EventName="SelectedIndexChanged" />
                                           
                                        </Triggers>
                                        <ContentTemplate>

                                            <div class="col-md-12 col-sm-6 col-xs-12">
                                                <label>Select Linen For</label>
                                                <asp:DropDownList ID="cmbItem" runat="server" CssClass="mydropdownlist" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="cmbItem_SelectedIndexChanged">
                                                    <asp:ListItem Value="select">Select Linen For</asp:ListItem>
                                                    <asp:ListItem Value="all">All</asp:ListItem>
                                                    <asp:ListItem Value="hotel">Hotel</asp:ListItem>
                                                    <asp:ListItem Value="restaurant">Restaurant</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-md-12">
                                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                    DataKeyNames="item_Id" CssClass="GridViewStyle" Width="100%" >
                                                    <Columns>
                                                        <asp:BoundField DataField="item_Id" HeaderText="Key"  />
                                                        <asp:BoundField DataField="item_name" HeaderText="Item Name" HeaderStyle-Width="15%" />
                                                        <asp:BoundField DataField="item_type" HeaderText="Item Type" HeaderStyle-Width="10%" />
                                                        <asp:BoundField DataField="description" HeaderText="Description" HeaderStyle-Width="40%" />
                                                        <asp:BoundField DataField="price" HeaderText="Price" HeaderStyle-Width="10%" />
                                                        <asp:TemplateField HeaderText="Photo" HeaderStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <div class="col-md-1 col-sm-1">
                                                                    <asp:Image ID="imgDisplay" runat="server" ImageUrl='<%# Eval("photo_src") %>' Height="100px" Width="100px" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Enter Quantity" HeaderStyle-Width="15%">
                                                            <ItemTemplate>
                                                                <div class="col-md-1 col-sm-1">
                                                                    <asp:TextBox ID="TextBoxS" runat="server" Width="3cm" TextMode="Number" MaxLength="4" AutoPostBack="true" OnTextChanged="TextBoxS_TextChanged" Text='<%# Eval("qty") %>' />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle CssClass="RowStyle" />
                                                    <EmptyDataRowStyle CssClass="EmptyRowStyle" />
                                                    <PagerStyle CssClass="PagerStyle" />
                                                    <SelectedRowStyle CssClass="SelectedRowStyle" />
                                                    <HeaderStyle CssClass="HeaderStyle" />
                                                    <EditRowStyle CssClass="EditRowStyle" />
                                                    <AlternatingRowStyle CssClass="AltRowStyle" />
                                                </asp:GridView>
                                            </div>

                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <label>Pick Up Date</label>
                                                <asp:TextBox runat="server" ID="txtPickUpDate" TextMode="DateTimeLocal"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPickUpDate" ErrorMessage="Please select date." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <label>Total Amount</label>
                                                <asp:TextBox runat="server" ID="txtTotAmount" Enabled="false" ></asp:TextBox>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <label>Total Quantity</label>
                                                <asp:TextBox runat="server" ID="txtTotQty" Enabled="false" ></asp:TextBox>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="contact-btn">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="250px" OnClick="btnSubmit_Click" /> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

