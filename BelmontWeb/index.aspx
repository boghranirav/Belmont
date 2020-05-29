<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
  

    <!-- service-section -->
    <section class="service-section centred">
        <div class="container">
            <div class="sec-title">Our <span>Services</span></div>
            <div class="row" runat="server" id="displayService">
                
            </div>
            <div class="service-btn"><a href="#">Load More</a></div>
        </div>
    </section>
    <!-- service-section end -->


    <!-- help-section -->
    <section class="help-section centred">
        <div class="container">
            <div class="three-column-carousel ">
                <div class="single-help-content first-column" style="height:200px;">
                    <div class="top-content">
                        <div class="icon-box"><i class="fa fa-clock-o"></i></div>
                        <h3>Trading hours</h3>
                    </div>
                    <div class="bottom-content text-left">
                        <div class="text"<label runat="server" id="lblTime"></label></div>
                    </div>
                </div>
                <div class="single-help-content second-column" style="height:200px;">
                    <div class="top-content"><h3>Call us</h3></div>
                    <div class="text">Any time during business hours if you want to get your clothes cleaned,quickly</div>
                    <div class="call"><asp:Label runat="server" ID="lblPhone"></asp:Label></div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

