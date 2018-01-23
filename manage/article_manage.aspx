<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master" AutoEventWireup="true" CodeFile="article_manage.aspx.cs" Inherits="manage_after_article_manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <h6><img src="images/13_13.jpg" /></h6>
        <div class="clear"></div>
        <img class="aaaaa" src="images/19_21.png" />
        <div class="realtitle" >
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" CssClass='ds'>
            <asp:ListItem>全部</asp:ListItem>
            <asp:ListItem>标题</asp:ListItem>
            <asp:ListItem>分类</asp:ListItem>
            <asp:ListItem>发布者</asp:ListItem>
            <asp:ListItem>内容</asp:ListItem>
        </asp:DropDownList>
           <asp:DropDownList ID="DropDownList2" runat="server" Visible="False" CssClass='ds'>
         <asp:ListItem>联系我们</asp:ListItem>
          <asp:ListItem>部门简介</asp:ListItem>
           <asp:ListItem>规章制度</asp:ListItem>
           <asp:ListItem>新闻聚焦</asp:ListItem>
         <asp:ListItem>新闻聚焦</asp:ListItem>
            <asp:ListItem Selected="True">硕博天空</asp:ListItem>
            <asp:ListItem>招聘信息</asp:ListItem>
            <asp:ListItem>公告</asp:ListItem>
            <asp:ListItem>权益之声</asp:ListItem>
        </asp:DropDownList> 
          <a href="article_edit.aspx">发布文章</a>
        <asp:TextBox ID="TextBox1" runat="server" CssClass='konw'></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" 
                CssClass='fund' /> 
              
        </div>     
        <div class="clear"></div>
        <asp:Repeater ID="Repeater1" runat="server" 
            onitemdatabound="Repeater1_ItemDataBound" 
        onitemcommand="Repeater1_ItemCommand1">
         <HeaderTemplate>
         <ul class="table">
            <li>编号</li>
            <li>标题</li>
            <li>分类</li>
            <li>发布时间</li>
            <li>发布者</li>
            <li>操作</li>
            <li>&nbsp;</li>
            </ul>
          </HeaderTemplate>          
           <ItemTemplate>
             <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("article_id") %>' />
           <ul class="table">
            <li><%#Eval("article_id") %></li>
            <li><a href="article_edit.aspx?id=<%#Eval("article_id")%>"><%#Eval("article_title").ToString().Length > 10 ? Eval("article_title").ToString().Substring(0, 10) + "..." : Eval("article_title").ToString()%></a></li>
            <li><%#Eval("article_class") %></li>
            <li><%#Eval("article_time") %></li>
            <li> <%#Eval("article_author") %></li>
            <li><a href="article_edit.aspx?id=<%#Eval("article_id")%>">修改</a></li>
            <li>
             
                <asp:Button ID="Button2" runat="server" Text="删除" CommandName="delete" />
              
                </li>
                </ul>
        </ItemTemplate>
            <AlternatingItemTemplate>
             <tr bgcolor="#e8e8e8">
             <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("article_id") %>' />
             <ul class="table">
            <li><%#Eval("article_id") %></li>
             <li><a href="article_edit.aspx?id=<%#Eval("article_id")%>"><%#Eval("article_title").ToString().Length > 10 ? Eval("article_title").ToString().Substring(0, 10) + "..." : Eval("article_title").ToString()%></a></li>
            <li><%#Eval("article_class") %></li>
            <li><%#Eval("article_time") %></li>
            <li> <%#Eval("article_author") %></li>
            <li><a href="article_edit.aspx?id=<%#Eval("article_id")%>">修改</a></li>
            <li>
             
                <asp:Button ID="Button2" runat="server" Text="删除" CommandName="delete" />
                
                  
                
            </li>
            </ul>
          </AlternatingItemTemplate>        
            <FooterTemplate>
             <ul class="table">
        <td colspan="2" style="font-size:12pt;color:black; background-color:white;">
        <li>共<asp:Label ID="lblpc" runat="server" Text="Label"></asp:Label>页</li>
        <li>当前为第<asp:Label ID="lblp" runat="server" Text="Label"></asp:Label>页</li>
        <li><asp:HyperLink ID="hlfir" runat="server" Text="首页"></asp:HyperLink>
        <asp:HyperLink ID="hlp" runat="server" Text="上一页"></asp:HyperLink></li>
        <li><asp:HyperLink ID="hln" runat="server" Text="下一页"></asp:HyperLink>
        <asp:HyperLink ID="hlla" runat="server" Text="尾页"></asp:HyperLink></li>
        <li> 跳至第</li>
        <li><asp:DropDownList ID="ddlp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlp_SelectedIndexChanged"></asp:DropDownList>页</li>        
         </ul>
             </FooterTemplate>                  
        </asp:Repeater>
        <h6><img src="images/99_39.jpg" /></h6>
         </form>
</asp:Content>



