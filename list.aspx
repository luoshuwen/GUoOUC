<%@ Page Title="" Language="C#" MasterPageFile="Common.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="manage_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="contentPage">
    <div style="width:800; margin:0 auto;">
        <div class="listTitle"> <img src="css/images/12_03.png" /><span><asp:Label
            ID="Label1" runat="server" Text="Label"></asp:Label></span> </div>
    </div>
    <div class="listCont">
                   <asp:Repeater ID="Repeater1" runat="server" onitemdatabound="Repeater1_ItemDataBound" 
            >
         <HeaderTemplate>
               
          </HeaderTemplate>

           <ItemTemplate>
                 <li>
                     <a href="content.aspx?id=<%#Eval("article_id")%>"><%#Eval("article_title").ToString().Length > 18 ? Eval("article_title").ToString().Substring(0, 18) + "..." : Eval("article_title").ToString()%></a> <span><%#Eval("article_time") %></span>  </li>
                  </ItemTemplate>

            <AlternatingItemTemplate>
             <td bgcolor="#e8e8e8">
                      <li><a href="content.aspx?id=<%#Eval("article_id")%>"><%#Eval("article_title").ToString().Length > 18 ? Eval("article_title").ToString().Substring(0, 18) + "..." : Eval("article_title").ToString()%></a><span><%#Eval("article_time") %></span></li>
          </AlternatingItemTemplate>
                      
           
        
            <FooterTemplate>
               
        <td colspan="2" style="font-size:12pt;color:black; background-color:white;">
        共<asp:Label ID="lblpc" runat="server" Text="Label"></asp:Label>页 当前为第
        <asp:Label ID="lblp" runat="server" Text="Label"></asp:Label>页
        <asp:HyperLink ID="hlfir" runat="server" Text="首页"></asp:HyperLink>
        <asp:HyperLink ID="hlp" runat="server" Text="上一页"></asp:HyperLink>
        <asp:HyperLink ID="hln" runat="server" Text="下一页"></asp:HyperLink>
        <asp:HyperLink ID="hlla" runat="server" Text="尾页"></asp:HyperLink>
            <asp:Label ID="Label2" runat="server" Text="跳转至"></asp:Label>
         <asp:DropDownList ID="ddlp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlp_SelectedIndexChanged">
         </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="页"></asp:Label>
        </td>
        </tr>
                </table>
             </FooterTemplate>                  
        </asp:Repeater>
    </div>
</div>


</asp:Content>

