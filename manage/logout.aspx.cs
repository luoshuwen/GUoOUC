using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_after_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IDictionaryEnumerator CacheEnum = HttpRuntime.Cache.GetEnumerator();
        while (CacheEnum.MoveNext())
        {
            Cache.Remove(CacheEnum.Key.ToString());
        }
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}