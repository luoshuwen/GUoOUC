using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class manage_repassword : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)  //确认
    {
        string id1 = Request["uid"];
        object password = SqlHelper.ExecuteScalar("Select user_password From Table_user where user_id ='" + id1 + "'");
        int result = SqlHelper.ExecuteNonQuery("update Table_user set user_password ='" + System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text, "MD5") + "'where user_id ='" + id1 + "' ");
            if (result == 1)
            {
                Response.Write(@"<script language='javascript'>alert('修改成功！');
                                 window.location.href='article_manage.aspx'</script>");
            }
            else
                Response.Write("<script>alert('修改失败');</script>");
        
    }
}