using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_complain : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Srole"] == null)
        {
            Response.Redirect("../LogOut.aspx");
        }
        if (!IsPostBack)
        {
            fillData();
        }
    }

    public void fillData()
    {
        DataTable dt = new DataTable();
        StringBuilder html = new StringBuilder();
        dt = dbCommon.DisplayDataQuery("select * from complain where order_id='"+Request.QueryString["cid"].ToString()+"'").Tables[0];

        foreach(DataRow dr in dt.Rows)
        {
            html.Append("<tr>");
            html.Append("<td>"+dr["order_id"].ToString()+"</td>");
            html.Append("<td>" + dr["description"].ToString() + "</td>");
            html.Append("</tr>");
        }
        displayData.InnerHtml = html.ToString();
    }
}