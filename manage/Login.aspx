<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="后台登录.css" rel="stylesheet" type="text/css">



</head>
<body>   
   <div class="center">
    <a class="left" href="#" target="_blank"> </a>
          <div class="right" >
          <form id="form1" runat="server">
           <asp:TextBox ID="username" runat="server" MaxLength="16" 
                  CssClass='input' value="请输入用户名" onfocus="if (value =='请输入用户名'){value ='';this.style.color='#333333';}" onblur="if (value ==''){value='请输入用户名';this.style.color='#8e8d8d';}"></asp:TextBox>

               <asp:TextBox ID="userpass" runat="server" MaxLength="16" CssClass='input' value="请输入密码" onfocus="if(this.value==defaultValue) {this.value='';this.type='password';this.style.color='#333333'}" onblur="if(!value) {value=defaultValue; this.type='text';this.style.color='#8e8d8d';}"></asp:TextBox>
                <asp:TextBox ID="txtcode" runat="server" MaxLength="5" CssClass='shortinput' value="验证码" onfocus="if (value =='验证码'){value ='';this.style.color='#333333'}" onblur="if (value ==''){value='验证码';this.style.color='#8e8d8d';}"></asp:TextBox>
              <asp:ImageButton ID="yzm" runat="server" ImageUrl="imagecode.aspx" CssClass='images'  />               
                    <asp:LinkButton ID="ChangeCode" runat="server" Text="看不清楚？换一个验证码" OnClick="ChangeCode_Click" CssClass='change' /> 
          <asp:Button ID="btnlog" runat="server" OnClick="LoginCmd_Click"  CssClass='ok' />
                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
             </form>
          </div>
          </div>
</body>
</html>
