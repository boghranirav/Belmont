using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_vieworder : System.Web.UI.Page
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

        dt = dbCommon.DisplayDataQuery("select a.amount,a.totalqty,a.pick_up_date,a.date_time,b.company_address_l1,b.company_address_l2,b.company_address_l3,b.company_name " +
                                        " from orderMst a, company b where a.company_id = b.company_id and order_id='"+Request.QueryString["uid"].ToString()+"'").Tables[0];

        foreach(DataRow dr in dt.Rows)
        {
            txtAddr1.Text = dr["company_address_l1"].ToString();
            txtAddr2.Text = dr["company_address_l2"].ToString();
            txtAddr3.Text = dr["company_address_l3"].ToString();
            txtCompany.Text= dr["company_name"].ToString();
            txtQuentity.Text = dr["totalqty"].ToString();
            txtAmount.Text = dr["amount"].ToString();
            txtPickUp.Text = dr["pick_up_date"].ToString();
            txtOrder.Text = dr["date_time"].ToString();
        }

        dt.Rows.Clear();


        string sqlStr="select c.item_id,c.item_name,c.item_type,b.quantity,b.price,c.description,c.photo_src " +
                  "  from OrderMst a, order_details b, item c " +
                  "  where a.order_id = b.order_id and c.item_id = b.item_id and a.order_id ='" + Request.QueryString["uid"].ToString() + "'";

        dt = dbCommon.DisplayDataQuery(sqlStr).Tables[0];

        foreach (DataRow dr in dt.Rows)
        {
            html.Append("<tr>");
            html.Append("<td>"+dr["item_name"].ToString()+"</td>");
            html.Append("<td>"+dr["item_type"].ToString()+"</td>");
            html.Append("<td>"+dr["price"].ToString()+"</td>");
            html.Append("<td>"+dr["Quantity"]+"</td>");
            html.Append("</tr>");
        }

        displayData.InnerHtml = html.ToString();
    }
}