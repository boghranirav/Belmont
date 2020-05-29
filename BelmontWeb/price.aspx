<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="price.aspx.cs" Inherits="price" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="page-title centred">
        <div class="container">
            <div class="content-box">
                <div class="title"><h2>price</h2></div>
            </div>
        </div>
    </section>

    <section class="price-list-section centred">
        <div class="container">
            <div class="price-content" >
                <div class='price-list price-list-three' runat="server" id="displayPrice">
                </div>
            </div>
        </div>
    </section>
</asp:Content>

