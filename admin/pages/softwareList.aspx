﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="softwareList.aspx.cs" Inherits="admin_pages_softwareList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/css/normalize.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <div class="container">
            <div class="row" style="padding:15px">
                <div class="input-group custom-search-form col-xs-4 col-xs-offset-8">
                    <asp:TextBox ID="SearchTextBox" runat="server" type="text" class="form-control" placeholder="Search..."></asp:TextBox>
                    <span class="input-group-btn">
                    <asp:LinkButton class="btn btn-default btn-md" ID="SearchBtn" runat="server" OnClick="SearchBtn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </div>
            <div class="table-responsive">
                <asp:DataList ID="DataList1" runat="server" class="table table-striped table-hover" OnDeleteCommand="DataList1_DeleteCommand">
                    <HeaderTemplate>
                        <th>序号</th>
                        <th>名称</th>
                        <th>版本</th>
                        <th>运行环境</th>
                        <th>授权方式</th>
                        <th>分类</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>操作</th>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"ID") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"Name") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"Edition") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"RunningEnvironment") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"AuthorizationWay") %>
                        </td>
                        <td></td>
                        <td>
                            <%# ReturnState((int) DataBinder.Eval(Container.DataItem,"State")) %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"DownloadNum") %>
                        </td>
                        <td><a class="btn btn-link btn-xs" href="softwareEdit.aspx?softwareid=<%# DataBinder.Eval(Container.DataItem,"ID ") %>">编辑</a>/
                            <asp:Button ID="btnDelete" CssClass="btn btn-link btn-xs" runat="server" CommandName="delete" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                OnLoad="Delete_LoadBtn" />
                        </td>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <ul class="pager">
                <li>
                    <asp:LinkButton ID="LinkBtnPrevPage" Text="上一页" CommandName="prev" OnCommand="Page_OnClick" runat="server" />
                </li>
                <li>
                    <asp:LinkButton ID="LinkBtnNextPage" Text="下一页" CommandName="next" OnCommand="Page_OnClick" runat="server" />
                </li>
                共有
                <asp:Label ID="LableRecordCount" runat="server" />条记录 当前为
                <asp:Label ID="LableCurrentPage" runat="server" />/
                <asp:Label ID="LablePageCount" runat="server" />页
            </ul>
        </div>
    </form>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>

</html>