using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = dbCommon.DisplayDataQuery("select top 1 * from about_us").Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                lblPhone.Text = dr["phone"].ToString();
                lblTime.InnerHtml = dr["timing"].ToString();
                break;
            }

            dt.Rows.Clear();

            StringBuilder html = new StringBuilder();
            dt = dbCommon.DisplayDataQuery("select * from service").Tables[0];
            foreach(DataRow dr in dt.Rows)
            {

                html.Append("<div class='col-md-4 col-sm-6 col-xs-12 service-column'>");
                html.Append("<div class='single-service-content'>");
                html.Append("<div class='single -item-hoverly'>");
                html.Append("<figure class='img -box'>");
                byte[] bytes;
                string base64String = "";
                try
                {
                    bytes = (byte[])dr["image_src"];
                    base64String = "data:image/png;base64,"+Convert.ToBase64String(bytes, 0, bytes.Length);
                }
                catch (Exception)
                {
                    bytes = null;
                }
                html.Append("<img src = '"+base64String +"' height='200px' width='200px' alt=''>");
                html.Append("<div class='overlay'>");
                html.Append("</div>");
                html.Append("</figure>");
                html.Append("<div class='lower-content'>");
                html.Append("<h3>"+dr["sname"].ToString()+"</h3 >");
                html.Append("<div class='text lh-24'>"+dr["description"].ToString()+"</div>");
                html.Append("</div>");
                html.Append("</div>");
                html.Append("</div>");
                html.Append("</div>");
            }

            displayService.InnerHtml = html.ToString();
        }
    }
}