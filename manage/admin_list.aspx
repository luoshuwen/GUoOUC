<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master" AutoEventWireup="true" CodeFile="admin_list.aspx.cs" Inherits="admin_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
    <h6><img src="images/13_13.jpg" /></h6>
        <div class="clear"></div>
        <img class="aaaaa" src="images/19_21.png"/>
        <div class="realtitle" >              
        </div>     
        <div class="clear"></div>
        <asp:Repeater ID="Repeater1" runat="server" 
            onitemdatabound="Repeater1_ItemDataBound" 
        onitemcommand="Repeater1_ItemCommand">
         <HeaderTemplate>
         <ul class="table">
            <li>编号</li>
            <li>名字</li>
            <li></li>
            <li></li>
            <li></li>
            <li>操作</li>
            <li>&nbsp;</li>
            </ul>
          </HeaderTemplate>          
           <ItemTemplate>
             <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("user_id") %>' />
           <ul class="table">
            <li><%#Eval("user_id") %></li>
            <li><%#Eval("user_name") %></li>
            <li></li>
            <li></li>
            <li></li>
            <li><a href="repassword.aspx?uid=<%#Eval("user_id")%>">修改密码</a></li>
            <li>
             
                <asp:Button ID="Button2" runat="server" Text="删除" CommandName="delete" />
              
                </li>
                </ul>
        </ItemTemplate>
            <AlternatingItemTemplate>
             <tr bgcolor="#e8e8e8">
               <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("user_id") %>' />
           <ul class="table">
            <li><%#Eval("user_id") %></li>
            <li><%#Eval("user_name") %></li>
            <li></li>
            <li></li>
            <li></li>
            <li><a href="repassword.aspx?uid=<%#Eval("user_id")%>">修改密码</a></li>
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

