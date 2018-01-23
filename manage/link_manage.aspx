<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master" AutoEventWireup="true" CodeFile="link_manage.aspx.cs" Inherits="manage_after_link_manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h6><img src="images/13_13.jpg" /></h6>
        <div class="clear"></div>
        <div class="realcontent">
          <form id="form1" runat="server">
            <span>海大首页:</span>
            <asp:TextBox ID="TextBox1"
               runat="server" CssClass='input'></asp:TextBox>           
            <br />
            <span> 海大青年:</span>
              <asp:TextBox ID="TextBox2"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 图书馆:</span>
              <asp:TextBox ID="TextBox3"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 助学在线:</span>
              <asp:TextBox ID="TextBox4"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 就业信息:</span>
              <asp:TextBox ID="TextBox5"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 智能卡:</span>
              <asp:TextBox ID="TextBox6"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 网络中心:</span>
              <asp:TextBox ID="TextBox7"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 人人:</span>
              <asp:TextBox ID="TextBox8"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
              <span> 新浪:</span>
              <asp:TextBox ID="TextBox9"
               runat="server" CssClass='input'></asp:TextBox> 
            <br />
             <asp:Button ID="Button2" runat="server" onclick="Button1_Click" CssClass='output give' />           
        </form>
           </div>
        <h6><img src="images/99_39.jpg" /></h6>
</asp:Content>


