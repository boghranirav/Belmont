using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about_us : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = dbCommon.DisplayDataQuery("select * from about_us").Tables[0];

            foreach(DataRow dr in dt.Rows)
            {
                displayDesc.InnerHtml = dr["description"].ToString();
            }
        }
    }
}