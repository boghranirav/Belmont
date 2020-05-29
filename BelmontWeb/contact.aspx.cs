using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt=dbCommon.DisplayDataQuery("select * from about_us").Tables[0];
            foreach(DataRow dr in dt.Rows)
            {
                lblAddress.InnerHtml = dr["address_l1"].ToString() + "<br />" + dr["address_l2"].ToString() + "<br />" + dr["address_l3"].ToString();
                lblMail.InnerText = dr["email"].ToString();
                lblPhone.InnerText = dr["phone"].ToString();
            }
        }
    }
}