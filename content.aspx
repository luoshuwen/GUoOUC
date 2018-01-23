<%@ Page Title="" Language="C#" MasterPageFile="Common.master" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="manage_content" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/content.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<div class=" contentPage">
    <div style="width:800; margin:0 auto;">
        <div class="listTitle"> <img src="css/images/12_03.png" /><span><asp:Label
            ID="Label1" runat="server" Text="Label"></asp:Label></span> </div>
    </div>


    <div class="realcontent">
     <h1>
         <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h1>
        <h2>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h2>
        <p> <asp:Literal ID="Literal1" runat="server"></asp:Literal> </p>
       
    </div>
</div>


</asp:Content>

