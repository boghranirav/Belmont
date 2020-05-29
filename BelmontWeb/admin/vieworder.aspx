<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMst1.master" AutoEventWireup="true" CodeFile="vieworder.aspx.cs" Inherits="admin_vieworder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
    <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-inverse">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            </div>
                            <h4 class="panel-title">View Order</h4>
                        </div>
                        <div class="panel-body panel-form">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Company Name</label>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="txtCompany" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Company Address</label>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="txtAddr1" class="form-control" />
                                    <asp:Label runat="server" ID="txtAddr2" class="form-control" />
                                    <asp:Label runat="server" ID="txtAddr3" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Total Quantity</label>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="txtQuentity" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Total Amount</label>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="txtAmount" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Pick Up date</label>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="txtPickUp" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Order Date</label>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="txtOrder" class="form-control" />
                                </div>
                            </div>

                        </div>
                    </div>
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
                                            <th>Item Name</th>
                                            <th>Item Type</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
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

