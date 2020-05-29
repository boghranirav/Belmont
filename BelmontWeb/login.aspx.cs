using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sql = "";

        sql = "select login_id,role,fname,lname,company_id from Login where email='" + txtemail.Text.ToString().Trim() + "' and Password='" + dbCommon.HashId(txtpassword.Text.ToString()) + "' ";

        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery(sql).Tables[0];
        if (dt.Rows.Count <= 0)
        {
            lblLogin.Visible = true;
            lblLogin.Text = "Invalid Login Id or Password.";
            Response.Write("<script>");
            Response.Write("alert('Invalid Id or Password. Please try again.');");
            Response.Write("</script>");
        }
        else
        {
            foreach (DataRow dr in dt.Rows)
            {
                        lblLogin.Visible = false;
                        Session["Slogin_id"] = dr["login_id"].ToString();
                        Session["Srole"] = dr["role"].ToString();
                        Session["Sname"] = dr["fname"].ToString() +" "+ dr["lname"].ToString();
                        Session["Scompany_id"] = dr["company_id"].ToString();
                        switch (dr["role"].ToString())
                        {
                            case "user":
                                Response.Redirect("index.aspx");
                                break;
                            case "admin":
                                Response.Redirect("admin/order.aspx");
                                break;
                        }
                        break;

            }
        }
    }
}