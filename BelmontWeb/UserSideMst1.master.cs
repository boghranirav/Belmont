using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserSideMst1 : System.Web.UI.MasterPage
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {

        

        if (!IsPostBack)
        {
            if (HttpContext.Current.Session["Srole"] == null)
            {
             //   Response.Redirect("logout.aspx");
            }
            else if (Session["Srole"].ToString() != "user")
            {
               // Response.Redirect("logout.aspx", false);
            }
            else
            {
                lblUserInfo.Text = Session["Sname"].ToString();
                menuOrder.Visible = true;
                btnRegister.Visible = false;
                btnLogin.Visible = false;
                btnLogout.Visible = true;
            }
            DataTable dt = new DataTable();
            dt =dbCommon.DisplayDataQuery("select top 1 * from about_us").Tables[0];

            foreach(DataRow dr in dt.Rows)
            {
                lblEmail.Text = dr["email"].ToString();
                lblMobile.Text = dr["phone"].ToString();
                lblDescription.Text = dr["description2"].ToString();
                lblAddress.InnerHtml = dr["address_l1"].ToString() + "<br />" + dr["address_l2"].ToString() + "<br />" + dr["address_l3"].ToString();
                break;
            }
        }
    }
}
