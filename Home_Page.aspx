<%@ Page Title="" Language="C#" MasterPageFile="Common.master" AutoEventWireup="true"
    CodeFile="Home_Page.aspx.cs" Inherits="manage_Home_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/sl.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.focus("#focus001");
            $.focus("#focus002");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="banner">
        <div class="focus" id="focus001">
            <ul>
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <li><a href="content.aspx?id=<%# Eval("image_articleid") %>" target="_blank">
                            <img src='<%# Eval("image_pass") %>' /></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="left">
            <h1>
                新闻公告</h1>
            <ul class="news">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <li><a href="content.aspx?id=<%#Eval("article_id")%>">
                            <%#Eval("article_title").ToString().Length >18? Eval("article_title").ToString().Substring(0, 18) + "...":Eval("article_title").ToString()%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="left">
            <br />
            <br />
            <br />
            <ul>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <li><a href="content.aspx?id=<%#Eval("article_id")%>">【<%#Eval("article_class") %>】
                            <%#Eval("article_title").ToString().Length > 18 ? Eval("article_title").ToString().Substring(0, 18) + "..." : Eval("article_title").ToString()%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="usually">
            <h1>
                常用链接</h1>
            <img  src="css/images/444_24.jpg" />
            <p>
                <asp:HyperLink ID="HyperLink1" runat="server">海大首页</asp:HyperLink><img src="css/images/4_11.gif" />
                <asp:HyperLink ID="HyperLink2" runat="server">海大青年</asp:HyperLink><img src="css/images/4_11.gif" />
                <asp:HyperLink ID="HyperLink3" runat="server">图书馆</asp:HyperLink><br />
                <asp:HyperLink ID="HyperLink4" runat="server">助学在线</asp:HyperLink><img src="css/images/4_11.gif" />
                <asp:HyperLink ID="HyperLink5" runat="server">就业信息</asp:HyperLink><img src="css/images/4_11.gif" />
                <asp:HyperLink ID="HyperLink6" runat="server">智能卡</asp:HyperLink><br />
                <a id="long" href="http://www2.ouc.edu.cn/grs/">研究生教育中心</a><img src="css/images/4_11.gif" /><img
                    src="css/images/4_11.gif" />
                <asp:HyperLink ID="HyperLink7" runat="server">网络中心</asp:HyperLink>
            </p>
            <img src="css/images/444_24.jpg" /><br />
            <h1 class="short">
                新媒体阵地</h1>
            <asp:HyperLink ID="HyperLink8" runat="server"><img src="css/images/icon_64x64.png"/></asp:HyperLink>
            <asp:HyperLink ID="HyperLink9" runat="server"><img src="css/images/Renren_Logo.png" /></asp:HyperLink>
        </div>
    </div>
</asp:Content>
