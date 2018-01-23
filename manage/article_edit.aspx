<%@ Page Title="" Language="C#" MasterPageFile="~/manage/later_common.master"
    AutoEventWireup="true" CodeFile="article_edit.aspx.cs" Inherits="manage_after_article_edit" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../ckfinder/ckfinder.js"></script>
    <script src="jquery.js"></script>
    <script type="text/javascript">

        function BrowseServer() {
            var finder = new CKFinder();
            finder.basePath = '../ckfinder/'; //此路径为CKFinder的安装路径，默认为 (default = "/ckfinder/").
            finder.selectActionFunction = SetFileField; //当选中图片时执行的函数
            finder.popup();//调用窗口       
        }
        //文件选中时执行
        //fileUrl所选中文件的路径
        function SetFileField(fileUrl) {
            $("#ContentPlaceHolder1_xFilePath").val(fileUrl);
            //document.getElementById('xFilePath').value = fileUrl;
            $("#ContentPlaceHolder1_imgNews").attr("src", "" + fileUrl + "");
            
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <h6>
            <img src="images/13_13.jpg" /></h6>
        <div class="clear"></div>
        <img class="aaaaa" src="images/19_21.png" />
        <div class="realtitle">
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass='ds'>
                <asp:ListItem>公告</asp:ListItem>
                <asp:ListItem>新闻聚焦</asp:ListItem>
                <asp:ListItem>招生信息</asp:ListItem>
                <asp:ListItem>招聘信息</asp:ListItem>
                <asp:ListItem>权益之声</asp:ListItem>
            </asp:DropDownList>
            标题:
         <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"
             CssClass="input"></asp:TextBox>
            副标题:
           <asp:TextBox ID="TextBox2" runat="server" MaxLength="50"
               CssClass="input"></asp:TextBox>
            发布者:
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="ckk">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <CKEditor:CKEditorControl ID="CKEditor1" runat="server" CssClass="input2"></CKEditor:CKEditorControl>

            <div class="realcontent">
                <img src="" id="imgNews" runat="server" />
                <input type="text" id="xFilePath" runat="server" readonly="readonly" />
                <input id="Button2" type="button" value="浏览服务器" onclick="BrowseServer()" runat="server" />
                <asp:Button ID="Button3" runat="server" Text="取消" onclick="Button3_Click" />
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button2_Click" CssClass="output" />
            </div>
        </div>

        <h6>
            <img src="images/99_39.jpg" /></h6>
    </form>
</asp:Content>

