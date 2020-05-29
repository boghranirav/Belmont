using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class past_order : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Srole"] == null)
        {
            Response.Redirect("logout.aspx");
        }
        if (!IsPostBack)
        {
            fillTable();
            
            if (Request.QueryString.AllKeys.Contains("did"))
            {
                bool i = dbCommon.boolInsertData("delete from order_details where order_id='"+Request.QueryString["did"].ToString()+"'");
                if (i == true)
                {
                    if (dbCommon.boolInsertData("delete from orderMst where order_id='" + Request.QueryString["did"].ToString() + "' ") == true)
                    {
                        Response.Redirect("past_order.aspx");
                    }
                }
            }

            
        }
    }

    public void fillTable()
    {
        string sqlStr = "select a.order_id,a.login_id,b.fname,b.lname,a.pick_up_date,a.date_time,a.amount,a.totalqty " +
                        " from orderMst a, login b where a.login_id = b.login_id and a.company_id='"+Session["Scompany_id"].ToString()+"' order by order_id desc";
        DataTable dt = new DataTable();
        StringBuilder html = new StringBuilder();
        dt=dbCommon.DisplayDataQuery(sqlStr).Tables[0];
        foreach(DataRow dr in dt.Rows)
        {
            html.Append("<tr class='row100 body'>");
            html.Append("<td class='cell100 column1'>" + dr["fname"].ToString()+" " + dr["lname"].ToString()+"<td>");
            html.Append("<td class='cell100 column2'>" + dr["date_time"].ToString()+"<td>");
            html.Append("<td class='cell100 column3'>" + dr["pick_up_date"].ToString()+"<td>");
            html.Append("<td class='cell100 column4'>" + dr["totalQty"].ToString()+"<td>");
            html.Append("<td class='cell100 column5'>" + dr["amount"].ToString() + "<td>");
            html.Append("<td class='cell100 column6'><a href='complain.aspx?cid="+dr["order_id"]+"' color='red'>Complain</a><td>");
            html.Append("<td class='cell100 column7'><a href='new_order.aspx?uid=" + dr["order_id"] + "' color='red'>View</a><td>");
            html.Append("<td class='cell100 column8'><a href='past_order.aspx?did=" + dr["order_id"] + "' color='red'>Delete</a><td>");
            html.Append("</tr>");
        }
        displayData.InnerHtml = html.ToString();
    }
}