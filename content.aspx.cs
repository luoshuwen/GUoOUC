using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id1 = Request["id"];
            Label1.Text = SqlHelper.ExecuteScalar("Select article_class From Table_article where article_id ='" + id1 + "'").ToString();
            Label2.Text = SqlHelper.ExecuteScalar("Select article_title From Table_article where article_id ='" + id1 + "'").ToString();
            Label3.Text = SqlHelper.ExecuteScalar("Select article_subtitle From Table_article where article_id ='" + id1 + "'").ToString();
            Literal1.Text = SqlHelper.ExecuteScalar("Select article_content From Table_article where article_id ='" + id1 + "'").ToString();
        }
    }
}