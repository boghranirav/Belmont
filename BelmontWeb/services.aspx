<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>Services</h2></div>
            </div>
        </div>
    </section>

  <section class="service-section centred">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12 service-column">
                    <div class="single-service-content">
                        <div class="single-item-hoverly">
                            <figure class="img-box">
                                <img src="images/service/1.png" alt="">
                                <div class="overlay">
                                    <a href="service-details.html" class="btn-one btn-bg">Read More</a>
                                </div>
                            </figure>
                            <div class="lower-content">
                                <h3><a href="service-details.html">Drapery</a></h3>
                                <div class="text lh-24">Dupioni silk is centuries old and has always remained a favorite as it offers the intricately woven silk yarns of varying thickness.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="service-btn"><a href="#">Load More</a></div>
        </div>
    </section>

</asp:Content>

