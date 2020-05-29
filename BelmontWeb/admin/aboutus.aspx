<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMst1.master" AutoEventWireup="true" CodeFile="aboutus.aspx.cs" Inherits="admin_aboutus" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript" src="tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" >
        tinyMCE.init({
            // General options
            mode: "textareas",
            theme: "advanced",
            plugins: "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups",
           
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 59px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form class="form-horizontal form-bordered" runat="server">
    <div class="row">
                <!-- begin col-6 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                    <div class="panel panel-inverse">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            </div>
                            <h4 class="panel-title">About Us Detail</h4>
                        </div>
                        <div class="panel-body panel-form">
                            
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Phone</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtPhone" class="form-control" placeholder="Phone Number" />
                                        <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtPhone" ErrorMessage="* Enter Item Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtEmail" class="form-control" placeholder="Enter Email " />
                                        <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtEmail" ErrorMessage="* Enter Item Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Address Line 1</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtAddress1" class="form-control" placeholder="Address Line 1" />
                                        <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtAddress1" ErrorMessage="* Enter Address Line 1" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Address Line 2</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtAddress2" class="form-control" placeholder="Address Line 2" />
                                        <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtAddress2" ErrorMessage="* Enter Address Line 2" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Address Line 3</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtAddress3" class="form-control" placeholder="Address Line 3" />
                                        <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtAddress3" ErrorMessage="* Enter Address 3" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Title</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtTitle" class="form-control" placeholder="Title" />
                                        <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtTitle" ErrorMessage="* Enter Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Description One</label>
                                    <div class="col-md-9">
                    			    <asp:TextBox ID="txtDescriptionOne" runat="server" TextMode="MultiLine" Height="400px" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Description Two</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtDescTwo" class="form-control" placeholder="Description" TextMode="MultiLine" MaxLength="200" Height="100px" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Timing</label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="txtTiming" class="form-control" placeholder="Timing" TextMode="MultiLine" Height="100px" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Submit</label>
                                    <div class="col-md-9">
                                        <asp:button runat="server"  Text="Submit" ID="btnSubmit" CssClass="btn btn-sm btn-success" OnClick="btnSubmit_Click"></asp:button>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                    <!-- end panel -->
                </div>
                
            </div>
    </form>
</asp:Content>

