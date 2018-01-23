﻿using System;
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

public partial class manage_before_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id1 = Request["id"];
            Label1.Text = id1;
            Repeater1.DataSource = pds();
            Repeater1.DataBind();
        }
    }
    private PagedDataSource pds()
    {
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = SqlHelper.ExecuteAdapter("select * from Table_file Order by file_time DESC").DefaultView;
        //pds.AllowCustomPaging = true;
        pds.AllowPaging = true;
        //pds.AllowServerPaging = true;
        pds.PageSize = 5;
        pds.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
        return pds;
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            DropDownList ddlp = (DropDownList)e.Item.FindControl("ddlp");

            HyperLink lpfirst = (HyperLink)e.Item.FindControl("hlfir");
            HyperLink lpprev = (HyperLink)e.Item.FindControl("hlp");
            HyperLink lpnext = (HyperLink)e.Item.FindControl("hln");
            HyperLink lplast = (HyperLink)e.Item.FindControl("hlla");

            pds().CurrentPageIndex = ddlp.SelectedIndex;

            int n = Convert.ToInt32(pds().PageCount);//n为分页数
            int i = Convert.ToInt32(pds().CurrentPageIndex);//i为当前页

            Label lblpc = (Label)e.Item.FindControl("lblpc");
            lblpc.Text = n.ToString();
            Label lblp = (Label)e.Item.FindControl("lblp");
            lblp.Text = Convert.ToString(pds().CurrentPageIndex + 1);

            if (!IsPostBack)
            {
                for (int j = 0; j < n; j++)
                {
                    ddlp.Items.Add(Convert.ToString(j + 1));
                }
            }

            if (i <= 0)
            {
                lpfirst.Enabled = false;
                lpprev.Enabled = false;
                lplast.Enabled = true;
                lpnext.Enabled = true;
            }
            else
            {
                lpprev.NavigateUrl = "?page=" + (i - 1);
            }
            if (i >= n - 1)
            {
                lpfirst.Enabled = true;
                lplast.Enabled = false;
                lpnext.Enabled = false;
                lpprev.Enabled = true;
            }
            else
            {
                lpnext.NavigateUrl = "?page=" + (i + 1);
            }

            lpfirst.NavigateUrl = "?page=0";//向本页传递参数page
            lplast.NavigateUrl = "?page=" + (n - 1);

            ddlp.SelectedIndex = Convert.ToInt32(pds().CurrentPageIndex);//更新下拉列表框中的当前选中页序号
        }
    }
    protected void ddlp_SelectedIndexChanged(object sender, EventArgs e)
    {//脚模板中的下拉列表框更改时激发
        DropDownList ddl = (DropDownList)this.Repeater1.Controls[this.Repeater1.Controls.Count - 1].FindControl("ddlp");
        string pg = Convert.ToString((Convert.ToInt32(((DropDownList)sender).SelectedValue) - 1));//获取列表框当前选中项
        Response.Redirect("list.aspx?page=" + pg);//页面转向
    }
}