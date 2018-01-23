using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_Home_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = SqlHelper.ExecuteAdapter("select top 5 * from Table_article where article_class = '公告' Order by article_time DESC").DefaultView;
        Repeater1.DataBind();
        Repeater2.DataSource = SqlHelper.ExecuteAdapter("select top 5 * from Table_article where article_class != '公告' Order by article_time DESC").DefaultView;
        Repeater2.DataBind();
        Repeater3.DataSource = SqlHelper.ExecuteAdapter("select top 3 * from Table_image where image_pass!='' Order by image_time DESC").DefaultView;
        Repeater3.DataBind();
        HyperLink1.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='1'").ToString();//为了不破坏美工的样式 我等只能用如此戳的方式来一个一个传值！！请谅解
        HyperLink2.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='2'").ToString();
        HyperLink3.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='4'").ToString();
         HyperLink4.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='5'").ToString();
        HyperLink5.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='6'").ToString();
        HyperLink6.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='7'").ToString();
        HyperLink7.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='9'").ToString();
        HyperLink8.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='10'").ToString();
        HyperLink9.NavigateUrl = SqlHelper.ExecuteScalar("Select a_address From Table_a where a_id ='11'").ToString();

    }
}