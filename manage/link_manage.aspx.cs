using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_after_link_manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox1.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='1'").ToString();//为了不破坏美工的样式 我等只能用如此戳的方式来一个一个传值！！请谅解
            TextBox2.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='2'").ToString();
            TextBox3.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='4'").ToString();
            TextBox4.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='5'").ToString();
            TextBox5.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='6'").ToString();
            TextBox6.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='7'").ToString();
            TextBox7.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='9'").ToString();
            TextBox8.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='10'").ToString();
            TextBox9.Text = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='11'").ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)  //修改友情链接网址
    {
        int result1 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox1.Text + "' where a_id ='1'");
        int result2 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox2.Text + "' where a_id ='2'");
        int result3 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox3.Text + "' where a_id ='4'");
        int result4 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox4.Text + "' where a_id ='5'");
        int result5 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox5.Text + "' where a_id ='6'");
        int result6 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox6.Text + "' where a_id ='7'");
        int result7 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox7.Text + "' where a_id ='9'");
        int result8 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox8.Text + "' where a_id ='10'");
        int result9 = SqlHelper.ExecuteNonQuery("update Table_a set a_address ='" + TextBox9.Text + "' where a_id ='11'");
        Response.Write(@"<script language='javascript'>alert('修改成功！');
                                 window.location.href='link_manage.aspx'</script>");
    }
}