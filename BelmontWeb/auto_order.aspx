<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="auto_order.aspx.cs" Inherits="auto_order" %>

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
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title">
                    <h2>Auto Order</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="contact-section sp-one">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 contact-column">
                    <div class="contact-form-area">
                        <h3>Set up auto order</h3>
                        <hr style="height: 2px; border: none; color: #333; background-color: #333;" />
                        <form runat="server" name="contact_form" class="default-form" method="post">
                            <div class="row">
                                <div style="width: 100%; border-color: black;">
                                    <div class="col-md-3 col-sm-6 col-xs-12">
                                        <label>Set auto order</label>
                                        <asp:DropDownList ID="cmbAutoOrder" runat="server"  CssClass="mydropdownlist">
                                            <asp:ListItem Value="select">Select</asp:ListItem>
                                            <asp:ListItem Value="yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="no">No</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="*Select Stauts" ControlToValidate="cmbAutoOrder" InitialValue="select" ></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-xs-12">
                                        <label>Place auto order after days</label>
                                        <asp:TextBox runat="server" ID="txtDays" TextMode="Number" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*Enter Days" ControlToValidate="txtDays" ></asp:RequiredFieldValidator>
                                    </div>
                                    <div  class="col-md-3 col-sm-6 col-xs-12">
                                        <label>Start From Day</label>
                                        <asp:TextBox runat="server" ID="txtDate" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="*Select Date" ControlToValidate="txtDate" ></asp:RequiredFieldValidator>
                                    </div>

                                    <div  class="col-md-12 col-sm-6 col-xs-12">
                                        <label>Company Name</label>
                                        <asp:TextBox runat="server" ID="txtCompanyName" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="*Enter Company Name" ControlToValidate="txtCompanyName" ></asp:RequiredFieldValidator>
                                    </div>

                                    <div  class="col-md-6 col-sm-6 col-xs-12">
                                        <label>Address Line 1</label>
                                        <asp:TextBox runat="server" ID="txtAddress1" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="*Enter Company Address" ControlToValidate="txtAddress1" ></asp:RequiredFieldValidator>
                                    </div>

                                    <div  class="col-md-6 col-sm-6 col-xs-12">
                                        <label>Address Line 2</label>
                                        <asp:TextBox runat="server" ID="txtAddress2" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="*Enter Company Address" ControlToValidate="txtAddress2" ></asp:RequiredFieldValidator>
                                    </div>

                                    <div  class="col-md-6 col-sm-6 col-xs-12">
                                        <label>Address Line 3</label>
                                        <asp:TextBox runat="server" ID="txtAddress3" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="*Enter Company Address" ControlToValidate="txtAddress3" ></asp:RequiredFieldValidator>
                                    </div>

                                    <div  class="col-md-6 col-sm-6 col-xs-12">
                                        <label>Contact</label>
                                        <asp:TextBox runat="server" ID="txtContact" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="*Enter Contact Number" ControlToValidate="txtContact" ></asp:RequiredFieldValidator>
                                    </div>
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

