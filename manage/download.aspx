<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master" AutoEventWireup="true" CodeFile="download.aspx.cs" Inherits="manage_after_download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <form id="form1" runat="server">
        <h6><img src="images/13_13.jpg" /></h6>
        <div class="clear"></div>
        <img class="aaaaa" src="images/19_21.png" />
        <div class="clear"></div>
             <asp:Repeater ID="Repeater1" runat="server" 
            onitemdatabound="Repeater1_ItemDataBound">
            <HeaderTemplate>
              <ul class="table">
            <li>编号</li>
            <li>标题</li>
            <li>发布时间</li>
            <li>发布者</li>
            <li>操作</li>
            <li>&nbsp;</li>
            <li></li>
        </ul>
            </HeaderTemplate>
                   <ItemTemplate>
             <ul class="table border">
             <li> <%#Eval("file_id") %></li>
             <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%#Eval("file_pass") %>'><%#Eval("file_name").ToString().Length > 12 ?"..."+ Eval("file_name").ToString().Substring(Eval("file_name").ToString().Length-12,12 ) : Eval("file_name").ToString()%></asp:HyperLink></li>
            <li><%#Eval("file_time") %></li>
            <li>   <%#Eval("file_author") %></li>
            <li><a href='filedelete.aspx?fid=<%#Eval("file_id")%>'>删除</a></li>
            <li></li>
            <li></li>
                        </ul>             
            </ItemTemplate>
      
            <FooterTemplate>
           <ul class="table border">
            <td colspan="2" style="font-size:12pt;color:#0099ff; background-color:#e6feda;"><li>共<asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>页</li>  <li>当前为第<asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>页</li>
            <li><asp:HyperLink ID="hlfir" runat="server" Text="首页"></asp:HyperLink></li>
            <li><asp:HyperLink ID="hlp" runat="server" Text="上一页"></asp:HyperLink></li>
            <li><asp:HyperLink ID="hln" runat="server" Text="下一页"></asp:HyperLink></li>
            <li><asp:HyperLink ID="hlla" runat="server" Text="尾页"></asp:HyperLink></li>
            <li></li>
            </ul>
            </FooterTemplate>
        </asp:Repeater>
         <ul class="table border">
        <asp:Label ID="Label9" runat="server" Text="上传资源（仅限于txt、doc、rar、xls或zip格式）："></asp:Label>
            &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="上传" />
            <asp:Label ID="Label10" runat="server"></asp:Label>
            </ul>
        <h6><img src="images/99_39.jpg" /></h6>
        </form>
</asp:Content>
