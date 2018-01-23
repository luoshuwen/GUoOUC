using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class manage_after_add_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string name;
            if (Session["idname"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
               if (Session["idname"].ToString().Length < 5)
                {
                    Response.Write(@"<script language='javascript'>alert('您无此权限！');
                                 window.location.href='article_manage.aspx'</script>");
                }
                else
                {
                    name = Session["idname"].ToString().Substring(0, 5);
                    if (name != "admin")
                    {
                        Response.Write(@"<script language='javascript'>alert('您无此权限！');
                                 window.location.href='article_manage.aspx'</script>");
                    }

                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        object name = SqlHelper.ExecuteScalar("Select user_password From Table_user where user_name ='" + TextBox1.Text + "'");
        if (name != null)
        {
            Response.Write(@"<script language='javascript'>alert('该管理员已存在！');
                                 window.location.href='add_admin.aspx'</script>");
        }
        else
        {
            string a = TextBox2.Text;
            string b = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(a, "MD5");
            int result = SqlHelper.ExecuteNonQuery("insert into Table_user (user_name,user_password) values ('" + TextBox1.Text + "','" + b + "')");
            Response.Write(@"<script language='javascript'>alert('添加成功！');
                                 window.location.href='article_manage.aspx'</script>");
        }
    }
}