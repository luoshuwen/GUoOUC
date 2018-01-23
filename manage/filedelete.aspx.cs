using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class filedelete : System.Web.UI.Page
{
    string fid;
    protected void Page_Load(object sender, EventArgs e)
    {
        fid = this.Request["fid"].ToString();
        string filepass = SqlHelper.ExecuteScalar("select file_pass from Table_file where file_id="+fid).ToString();
        System.IO.File.Delete(Server.MapPath(filepass));
        int i = SqlHelper.ExecuteNonQuery("delete from Table_file where file_id = '" + fid + "'");
        //editor1.InnerText = SqlHelper.ExecuteScalar("select articlecontent from Table_article where articlenumber = '" + aid + "'").ToString();
        Response.Redirect("download.aspx");
    }
}