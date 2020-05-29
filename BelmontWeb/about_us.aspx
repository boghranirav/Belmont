<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="about_us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>About Us</h2></div>
            </div>
        </div>
    </section>

        <section class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-8 col-xs-12">
                    <div class="img-box-one"><figure><img src="images/about/1.jpg" alt=""></figure></div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="img-box-two"><figure><img src="images/about/2.jpg" alt=""></figure></div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="about-content">
                        <h3><asp:Label runat="server" ID="lblTitle" /></h3>
                        <div class="text">
                            <p><label id="displayDesc" runat="server"></label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

