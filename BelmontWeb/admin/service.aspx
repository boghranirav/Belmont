<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMst1.master" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="admin_service" %>

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
                url: "service.aspx/Deleteservice", // this for calling the web method function in cs code.  
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
                    url: 'service.aspx',
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
            <div class="col-md-6">
                <!-- begin panel -->
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                        </div>
                        <h4 class="panel-title">Service</h4>
                    </div>
                    <div class="panel-body panel-form">

                        <div class="form-group">
                            <label class="col-md-3 control-label">Service Title</label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txttitle" class="form-control" placeholder="Service Title" OnTextChanged="txttitle_TextChanged" />
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txttitle" ErrorMessage="* Enter Title" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*Invalid Title" ControlToValidate="txttitle" ValidationExpression="^[a-zA-Z0-9 .()-,_]+$" Display="Dynamic" ForeColor="Red" />
                                <asp:Label ID="lblDErrorMsg" runat="server" ForeColor="Red" class="form-control" Visible="false" ></asp:Label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Description</label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txtDescription" class="form-control" placeholder="Description" TextMode="MultiLine" Height="100px" />
                                <asp:RequiredFieldValidator runat="server" CssClass="RequiredFieldValidator1" ControlToValidate="txtDescription" ErrorMessage="* Enter Description" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3">Service Image :</label>
                            <div class="col-md-9">
                                <input type="file" runat="server" id="imgCategoryImage" onchange="previewFile()" name="imgCategoryImage" class="form-control" tabindex="1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Submit</label>
                            <div class="col-md-9">
                                <asp:Button runat="server" Text="Submit" ID="btnSubmit" CssClass="btn btn-sm btn-success" OnClick="btnSubmit_Click"></asp:Button>
                                <asp:Button runat="server" Text="Cancel" Visible="false"  ID="btnCancel" CssClass="btn btn-sm btn-danger" OnClick="btnCancel_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end panel -->
            </div>


            <div class="col-md-6">
                <!-- begin panel -->
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                        </div>
                        <h4 class="panel-title">Service</h4>
                    </div>
                    <div class="panel-body panel-form">
                        <div class="col-md-12 col-sm-12">
                            <asp:Image ID="displayImg" runat="server" Height="350px" Width="350px" AlternateText="Category Image" />
                        </div>
                    </div>
                </div>
                <!-- end panel -->
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
                            <h4 class="panel-title">View Service</h4>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody runat="server" id ="displayData">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-12 -->
            </div>
        </div>
    </form>

</asp:Content>

