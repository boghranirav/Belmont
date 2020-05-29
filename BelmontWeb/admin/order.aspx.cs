using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_order : System.Web.UI.Page
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
        string sqlStr = "select a.order_id,a.login_id,b.fname,b.lname,a.pick_up_date,a.date_time,a.amount,a.totalqty,c.company_name,c.company_address_l1,c.company_address_l2,c.company_address_l3 " +
                        " from orderMst a, login b, company c where a.login_id = b.login_id  and c.company_id=b.company_id " + 
                        "  order by order_id desc";
        DataTable dt = new DataTable();
        StringBuilder html = new StringBuilder();
        dt = dbCommon.DisplayDataQuery(sqlStr).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            html.Append("<tr> ");
            html.Append("<td>" + dr["company_name"].ToString() + "</td>");
            html.Append("<td>" + dr["company_address_l1"].ToString() + "<br />"+ dr["company_address_l2"].ToString() +"<br />"+ dr["company_address_l3"].ToString() + "</td>");
            html.Append("<td>" + dr["fname"].ToString() + " " + dr["lname"].ToString() + "</td>");
            html.Append("<td>" + dr["date_time"].ToString() + "</td>");
            html.Append("<td>" + dr["pick_up_date"].ToString() + "</td>");
            html.Append("<td>" + dr["totalQty"].ToString() + "</td>");
            html.Append("<td>" + dr["amount"].ToString() + "</td>");
            html.Append("<td><a href='complain.aspx?cid=" + dr["order_id"] + "' color='red'>View complain</a></td>");
            html.Append("<td><a href='vieworder.aspx?uid=" + dr["order_id"] + "' color='red'>View Order</a></td>");
            html.Append("</tr>");
        }
        displayData.InnerHtml = html.ToString();
    }
}