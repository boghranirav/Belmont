<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>Register</h2></div>
            </div>
        </div>
    </section>

    <section class="contact-section sp-one">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 contact-column">
                    <div class="contact-form-area">
                        <h3>Registration Form</h3>
                        <hr style="height:2px;border:none;color:#333;background-color:#333;" />
                        <form runat="server" name="contact_form" class="default-form" action="#" method="post">
                            <div class="row">
                                <div style="width: 50%; float: left;border-color:black;">

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h3>Personal Information</h3>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label>First Name</label>
                                        <asp:TextBox runat="server" ID="txtfname" placeholder="Your First Name *" required="" />
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label>Last Name</label>
                                        <asp:TextBox runat="server" ID="txtlname" placeholder="Your Last Name *" required="" />
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Mobile Number</label>
                                        <asp:TextBox runat="server" ID="txtMobile" placeholder="Your Mobile Number *" required="" />
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Email Id</label>
                                        <asp:TextBox runat="server" ID="txtEmail" placeholder="Your Email Id*" required="" OnTextChanged="txtEmail_TextChanged" />
                                        <asp:Label Text="" ID="lblEmail_V" runat="server" ForeColor="Red"></asp:Label>
                                    </div>

                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label>Password</label>
                                        <asp:TextBox runat="server" ID="txtPassword" placeholder="Your Password" required="" TextMode="Password"></asp:TextBox>
                                    </div>

                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label>Re-Enter Password</label>
                                        <asp:TextBox runat="server" ID="txtRePassword" placeholder="Your Password" required="" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator runat="server" ID="CompareValidator1" ControlToCompare="txtRePassword" ControlToValidate="txtPassword" ErrorMessage="Both Password Does Not Match." Display="Dynamic" ForeColor="#f3f2f2"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div style="width: 50%; float:right;">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h3>Company Information</h3>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Company Name</label>
                                        <asp:TextBox runat="server" ID="txtCompanyName" placeholder="Your Company Name *" required="" />
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Company Address </label>
                                        <asp:TextBox runat="server" ID="txtCompanyAddressL1" placeholder="Company Address Line 1 *" required="" />
                                        <asp:TextBox runat="server" ID="txtCompanyAddressL2" placeholder="Company Address Line 2 *" required="" />
                                        <asp:TextBox runat="server" ID="txtCompanyAddressL3" placeholder="Company Address Line 3 *" required="" />
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Company Phone</label>
                                        <asp:TextBox runat="server" ID="txtCompanyPhone" placeholder="Company Phone *" required="" />
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

