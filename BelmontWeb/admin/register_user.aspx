<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMst1.master" AutoEventWireup="true" CodeFile="register_user.aspx.cs" Inherits="admin_register_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <script type="text/javascript">
    function deletefunction(id1, uid) { //This function call on text change.     
        if (confirm("Are you sure you want to delete?")) {
            $.ajax({
                type: "POST",
                url: "register_user.aspx/Deleteregister_user", // this for calling the web method function in cs code.  
                data: '{eid: "' + id1 + '"}', // user name or email value  
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response);
                }
            });
        }
    }
    // function OnSuccess  
    function OnSuccess(response) {
        switch (response.d) {
            case "1":

                break;
            case "true":
                $.ajax({
                    type: 'POST',
                    url: 'register_user.aspx',
                    success: function () {
                        setTimeout(function () {
                            location.reload();
                        }, 500);
                    }
                });
                break;
            case "false":

                break;
        }
    }
</script>
    <script type="text/javascript">
         function previewFile() {
             
        var preview = document.querySelector('#<%=displayImg.ClientID %>');
        var file = document.querySelector('#<%=imgCategoryImage.ClientID %>').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    </script>
    <form class="form-horizontal form-bordered" runat="server">
        <div class="row">
            <!-- begin col-6 -->
            <div class="col-md-9">
                <!-- begin panel -->
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                        </div>
                        <h4 class="panel-title">User Detail</h4>
                    </div>
                    <div class="panel-body panel-form">

                        <div class="form-group">
                            <label class="col-md-3 control-label">User Name</label>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="txtFName" class="form-control" placeholder="First Name" />
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtFName" ErrorMessage="* Enter First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" ID="txtLName" class="form-control" placeholder="Last Name" />
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtLName" ErrorMessage="* Enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Select Designation</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="cmbItemtype" runat="server" class="form-control">
                                    <asp:ListItem Value="select">Select</asp:ListItem>
                                    <asp:ListItem Value="hotel">Hotel</asp:ListItem>
                                    <asp:ListItem Value="restaurant">Restaurant</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator2" ControlToValidate="cmbItemtype" ErrorMessage="* Select Item Type" InitialValue="select" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Email-Id</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="txtEmail" class="form-control" placeholder="Enter Email Id" OnTextChanged="txtEmail_TextChanged" />
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator4" ControlToValidate="txtEmail" ErrorMessage="* Enter Email Id" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblDErrorMsg" runat="server" class="form-control" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-md-3 control-label">Address</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="txtAddress" class="form-control" TextMode="MultiLine" placeholder="Enter address" />
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator4" ControlToValidate="txtAddress" ErrorMessage="* Enter address" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3">Profile Image :</label>
                            <div class="col-md-8">
                                <input type="file" runat="server" id="imgCategoryImage" onchange="previewFile()" name="imgCategoryImage" class="form-control" tabindex="1" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Submit</label>
                            <div class="col-md-8">
                                <asp:Button runat="server" Text="Submit" ID="btnSubmit" CssClass="btn btn-sm btn-success" OnClick="btnSubmit_Click" ></asp:Button>
                                <asp:Button runat="server" Text="Cancel" ID="btnCancel" CssClass="btn btn-sm btn-success" OnClick="btnCancel_Click" Visible="false" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3" id="div_image" runat="server">
                <!-- begin panel -->
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                        </div>
                        <h4 class="panel-title">Profile Image</h4>
                    </div>
                    <div class="panel-body panel-form">
                        <div class="col-md-12 col-sm-12">
                            <asp:Image ID="displayImg" runat="server" Height="200px" Width="200px" AlternateText="Item Image" />
                        </div>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>

        <div class="row">
			    <!-- begin col-12 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                    <div class="panel panel-inverse">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">View Orders</h4>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Image</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody runat="server" id="displayData">                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-12 -->
            </div>
    </form>
</asp:Content>

