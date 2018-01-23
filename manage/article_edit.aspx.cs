using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_after_article_edit : System.Web.UI.Page
{
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["idname"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
                _FileBrowser.BasePath = ResolveUrl("~/ckfinder/");
                _FileBrowser.SetupCKEditor(CKEditor1);
                Label1.Text = Session["idname"].ToString();
                if (Request["id"] != null)
                {
                    string id1 = Request["id"];
                    object item1 = SqlHelper.ExecuteScalar("Select article_title From Table_article where article_id ='" + id1 + "'");
                    TextBox1.Text = item1.ToString();
                    TextBox2.Text = SqlHelper.ExecuteScalar("Select article_subtitle From Table_article where article_id ='" + id1 + "'").ToString();
                    Label1.Text = SqlHelper.ExecuteScalar("Select article_author From Table_article where article_id ='" + id1 + "'").ToString();
                    DropDownList1.SelectedValue = SqlHelper.ExecuteScalar("Select article_class From Table_article where article_id ='" + id1 + "'").ToString();
                    CKEditor1.Text = SqlHelper.ExecuteScalar("Select article_content From Table_article where article_id ='" + id1 + "'").ToString();
                    xFilePath.Value = SqlHelper.ExecuteScalar("select image_pass from Table_image where image_articleid=" + id1).ToString();
                    imgNews.Src = SqlHelper.ExecuteScalar("select image_pass from Table_image where image_articleid=" + id1).ToString();
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e) //发表or修改
    {
        DateTime time1 = DateTime.Now;
        string id1 = Request["id"];
        if (TextBox1.Text == "")
        {
            Label2.Visible = true;
            Label2.Text = "标题不能为空";
        }
        else if (CKEditor1.Text == "")
        {
            Label2.Visible = true;
            Label2.Text = "内容不能为空";
        }
        else
        {
            if (id1 == null)
            {
                int result = SqlHelper.ExecuteNonQuery("insert into Table_article (article_title,article_subtitle,article_class,article_author,article_content,article_time) values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList1.Text + "','" + Label1.Text + "','" + CKEditor1.Text + "','" + time1 + "')");
                
                    string mid = SqlHelper.ExecuteScalar("select article_id from Table_article where article_time='" + time1 + "'").ToString();
                    result = SqlHelper.ExecuteNonQuery("insert into Table_image (image_articleid,image_location,image_pass)values(" + mid + ",'" + imgNews.Src + "','" + xFilePath.Value + "')");
              
                //Response.Redirect(Request.Url.ToString());
                    Response.Write(@"<script language='javascript'>alert('发表成功！');
                                 window.location.href='article_manage.aspx'</script>");
            }
            else
            {
                int result = SqlHelper.ExecuteNonQuery("update Table_article set article_title ='" + TextBox1.Text + "',article_subtitle ='" + TextBox2.Text + "',article_class = '" + DropDownList1.Text + "',article_author ='" + Label1.Text + "',article_content='" + CKEditor1.Text + "',article_time='" + time1 + "' where article_id ='" + id1 + "' ");
                string mid = SqlHelper.ExecuteScalar("select article_id from Table_article where article_time='" + time1 + "'").ToString();
                if (xFilePath.Value != null)
                {
                    string passes = SqlHelper.ExecuteScalar("select image_pass from Table_image where image_articleid=" + mid).ToString();
                    if (passes == null)
                    {
                        if (xFilePath != null)
                        {
                            result = SqlHelper.ExecuteNonQuery("insert into Table_image (image_articleid,image_location,image_pass)values(" + mid + ",'" + imgNews.Src + "','" + xFilePath.Value + "')");
                        }
                    }
                    else
                    {
                        result = SqlHelper.ExecuteNonQuery("update Table_image set image_pass='" + xFilePath.Value + "' where image_articleid=" + mid);

                    }
                }
                else
                {
                    string passes = SqlHelper.ExecuteScalar("select image_pass from Table_image where image_articleid =" + mid).ToString();
                    if (passes != null)
                    {
                        int i = SqlHelper.ExecuteNonQuery("delete from Table_image where image_articleid = content.aspx?id = " + mid);
                    }
                }
                Response.Write(@"<script language='javascript'>alert('修改成功！');
                                 window.location.href='article_manage.aspx'</script>");
            }
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        xFilePath.Value = "";
	imgNews.Src = "";
    }
}