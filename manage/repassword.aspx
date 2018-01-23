﻿<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master" AutoEventWireup="true" CodeFile="repassword.aspx.cs" Inherits="manage_repassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h6>
        <img src="images/13_13.jpg" /></h6>
    <div class="clear"></div>
    <div class="realcontent">
        <form id="form1" runat="server">
            <span>密码:</span>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" MaxLength="16" ValidationGroup="valid" CssClass='input'></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="TextBox2" ErrorMessage="该项不能为空" ForeColor="Red"
                ValidationGroup="valid"></asp:RequiredFieldValidator>           
            <br />
            <span>确认密码:</span>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" MaxLength="16" ValidationGroup="valid" CssClass='input'></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="TextBox3" ErrorMessage="该项不能为空" ForeColor="Red"
                ValidationGroup="valid"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click"
                ValidationGroup="valid" CssClass='output give' />
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToCompare="TextBox2" ControlToValidate="TextBox3"
                ErrorMessage="两次输入的密码不一致" ForeColor="#FF3300" ValidationGroup="valid"
                ValueToCompare="valid"></asp:CompareValidator>
        </form>
    </div>
    <h6>
        <img src="images/99_39.jpg" /></h6>
</asp:Content>

