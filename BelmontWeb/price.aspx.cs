using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class price : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt=dbCommon.DisplayDataQuery("select * from Item").Tables[0];
            StringBuilder html = new StringBuilder();
            foreach(DataRow dr in dt.Rows)
            {
                html.Append("<div class='single-price'>");
                html.Append("<div class='view-content'>");
                byte[] bytes;
                string base64String = "";
                try
                {
                    bytes = (byte[])dr["photo_src"];
                    base64String = "data:image/png;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                }
                catch (Exception)
                {
                    bytes = null;
                }
                html.Append("<div class='icon-box'><img src='"+base64String+"' height='100px' width='100px' alt=''></div>");
                html.Append("<div class='name'><h4>"+dr["item_name"].ToString()+"</h4></div>");
                html.Append("</div>");
                html.Append("<div class='hidden-content'>");
                html.Append("<div class='name'><h4>" + dr["item_name"].ToString() + "</h4></div>");
                html.Append("<div class='icon-box'><i class='flaticon-dress'></i></div>");
                html.Append("<div class='price'>Price : "+ dr["price"].ToString() + "<br /> For "+dr["item_type"].ToString()+"</div>");
                html.Append("</div>");
                html.Append("</div>");
            }
            displayPrice.InnerHtml=html.ToString();
        }
    }
}