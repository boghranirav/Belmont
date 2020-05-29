<%@ Page Title="" Language="C#" MasterPageFile="~/UserSideMst1.master" AutoEventWireup="true" CodeFile="complain.aspx.cs" Inherits="complain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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
                        <h3>Complain</h3>
                        <hr style="height: 2px; border: none; color: #333; background-color: #333;" />
                        <form runat="server" name="contact_form" class="default-form" method="post">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <div class="row">
                                <div style="width: 100%; border-color: black;">
                                    <div class="col-md-12 col-sm-6 col-xs-12">
                                        <label>Write Complaint</label>
                                        <asp:TextBox runat="server" ID="txtComplaint" TextMode="MultiLine" Rows="6"></asp:TextBox>
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

