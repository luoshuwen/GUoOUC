<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master" AutoEventWireup="true" CodeFile="add_admin.aspx.cs" Inherits="manage_after_add_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h6><img src="images/13_13.jpg" /></h6>
        <div class="clear"></div>
        <div class="realcontent">
        <form id="form1" runat="server">
            <span>新管理员:</span>
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="16" ValidationGroup="valid" CssClass='input'></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="该项不能为空" ControlToValidate="TextBox1" ForeColor="Red" 
            ValidationGroup="valid"></asp:RequiredFieldValidator>
            <br />
            <span> 密码:</span>
             <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" MaxLength="16" 
                       ValidationGroup="valid" CssClass='input'></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="该项不能为空" ControlToValidate="TextBox2" ForeColor="Red" 
            ValidationGroup="valid" Height="24px"></asp:RequiredFieldValidator>            
            <br />
            <span> 确认密码:</span>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" MaxLength="16" 
                        ValidationGroup="valid" CssClass='input'></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="该项不能为空" ControlToValidate="TextBox3" ForeColor="Red" 
            ValidationGroup="valid"></asp:RequiredFieldValidator>         
            <br />
             <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            ValidationGroup="valid" CssClass='output give'/>
    &nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
            ErrorMessage="两次输入密码不一致" ForeColor="Red" ValidationGroup="valid" 
            ValueToCompare="valid"></asp:CompareValidator> 
            </form>        
        </div>
        <h6><img src="images/99_39.jpg" /></h6>
        
</asp:Content>
