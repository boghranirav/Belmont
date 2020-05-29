<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>Contact Us</h2></div>
            </div>
        </div>
    </section>

    <section class="contact-section sp-one">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-6 col-xs-12 contact-column">
                    <div class="contact-info">
                        <div class="single-item">
                        <h3>Address</h3>
                            <div class="info-box">
                                <div class="icon-box"><i class="fa fa-map-marker"></i></div>
                                <div class="text"><label runat="server" id="lblAddress"></label></div>
                            </div>
                        </div>
                        <div class="single-item">
                            <h3>Phone</h3>
                            <div class="info-box">
                                <div class="icon-box"><i class="fa fa-phone"></i></div>
                                <div class="text"><label runat="server" id="lblPhone"></label></div>
                            </div>
                        </div>
                        <div class="single-item">
                            <h3>Mail</h3>
                            <div class="info-box">
                                <div class="icon-box"><i class="fa fa-envelope"></i></div>
                                <div class="text"><label id="lblMail" runat="server"></label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

