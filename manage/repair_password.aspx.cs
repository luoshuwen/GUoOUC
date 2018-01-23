using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class manage_after_repair_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["idname"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)  //确认
    {
        string id1 = Session["id"].ToString();
        object password = SqlHelper.ExecuteScalar("Select user_password From Table_user where user_id ='" + id1 + "'");
        if (System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox1.Text, "MD5") != password.ToString())
        {
            Response.Write(@"<script language='javascript'>alert('密码错误！');
                                 window.location.href='repair_password.aspx'</script>");
        }
        else
        {
            int result = SqlHelper.ExecuteNonQuery("update Table_user set user_password ='" + System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text, "MD5") + "'where user_id ='" + id1 + "' ");
            if (result == 1)
            {
                IDictionaryEnumerator CacheEnum = HttpRuntime.Cache.GetEnumerator();
                while (CacheEnum.MoveNext())
                {
                    Cache.Remove(CacheEnum.Key.ToString());
                }
                Session.Clear();
                Response.Write(@"<script language='javascript'>alert('修改成功！');
                                 window.location.href='Login.aspx'</script>");
            }
            else
                Response.Write("<script>alert('修改失败');</script>");
        }
    }
}