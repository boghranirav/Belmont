<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>Login</h2></div>
            </div>
        </div>
    </section>

    <section class="contact-section sp-one">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-8 col-xs-12 contact-column">
                    <div class="contact-form-area">
                        <h3>Login Form</h3>
                        <form runat="server" name="contact_form" class="default-form" >
                            <div class="row">
                                <div class="col-md-12 col-sm-6 col-xs-12">
                                    <label>Email Id</label>
                                    <asp:TextBox runat="server" ID="txtemail" placeholder="Your Email Id *" required="" />
                                </div>
                                <div class="col-md-12 col-sm-6 col-xs-12">
                                    <label>Password</label>
                                    <asp:TextBox runat="server"  TextMode="Password" ID="txtpassword" placeholder="Your Password *" required="" />
                                </div>

                                <div class="col-md-12 col-sm-6 col-xs-12">
                                    <asp:Label runat="server" ID="lblLogin" ForeColor="Red"></asp:Label>
                                  </div>
                            </div>
                            <div class="contact-btn">
                                <asp:Button  ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

