using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Drawing;
using System.Web.Security;


public partial class login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ChangeCode_Click(object sender, EventArgs e)
    {
    }
    protected void LoginCmd_Click(object sender, EventArgs e)
    {
        string code = txtcode.Text;
        if (Request.Cookies["CheckCode"].Value == code)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnStr"].ConnectionString);
            con.Open();
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(userpass.Text, "MD5");
            string sqlsel = "select count(*) from Table_user where user_name ='" + username.Text + "' and user_password = '" + pass + "'";
            SqlCommand com = new SqlCommand(sqlsel, con);
            com.Parameters.Add(new SqlParameter("name", SqlDbType.VarChar, 20));
            com.Parameters["name"].Value = username.Text;
            com.Parameters.Add(new SqlParameter("pass", SqlDbType.VarChar, 50));
            com.Parameters["pass"].Value = pass;
            if (Convert.ToInt32(com.ExecuteScalar()) > 0)
            {
                string str_Key = username.Text + "_" + userpass.Text;
                string str_User = Convert.ToString(Cache[str_Key]);
                if (str_User == null || str_User == string.Empty)
                {
                    TimeSpan SessTimeOut = new TimeSpan(0, 0, HttpContext.Current.Session.Timeout, 0, 0);
                    HttpContext.Current.Cache.Insert(str_Key, str_Key, null, DateTime.MaxValue, SessTimeOut, System.Web.Caching.CacheItemPriority.NotRemovable, null);
                    Session["UserSession"] = str_Key;
                    Session["idname"] = username.Text;
                    Response.Redirect("article_manage.aspx?admin_name=" + username.Text);
                }
                else
                {
                    this.Label3.Text = "抱歉，您已登录";
                    userpass.Text = "请输入密码";
                }
                //Session["UserSession"] = username.Text;

            }
            else
            {
                Label3.Text = "用户名或密码错误";
                 userpass.Text = "请输入密码";
            }
        }
        else
        {
            Label3.Text = "验证码输入错误";
             userpass.Text = "请输入密码";
        }

    }
}