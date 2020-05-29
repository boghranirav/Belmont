using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class complain : System.Web.UI.Page
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
            fillData();
        }
    }

    public void fillData()
    {
        if (Request.QueryString.AllKeys.Contains("cid"))
        {
            if (!Request.QueryString["cid"].ToString().All(char.IsDigit))
            {
                Response.Redirect("logout.aspx");
            }
            

            string id = Request.QueryString["cid"];

            ViewState["id"] = Request.QueryString["cid"];

            DataTable dt = new DataTable();
            dt = dbCommon.DisplayDataQuery("select * from complain where order_id='" + id + "'").Tables[0];

            if (dt.Rows.Count == 0) { }
            else
            {
                btnSubmit.Text = "Update";
                foreach (DataRow dr in dt.Rows)
                {
                    txtComplaint.Text = dr["description"].ToString();
                }
            }
        }
        else if (Request.QueryString.AllKeys.Length == 1)
        {
            Response.Redirect("Logout.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            int maxId = dbCommon.CheckDuplicateByQuery("select IsNUll(Max(complain_id),0)+1 from complain");
            string s = Session["Scompany_id"].ToString();
            bool i2 = dbCommon.boolInsertData("insert into complain(complain_id,login_id,order_id,description)" +
                                        " Values('" + maxId + "','" + Session["Slogin_id"].ToString() + "','" + Request.QueryString["cid"].ToString() + "', " +
                                        " '" + txtComplaint.Text.ToString() + "') ");
            if (i2 == true)
            {
                Response.Redirect("complain.aspx");
            }
        }
        else
        {
            bool i2 = dbCommon.boolInsertData("update complain set description='" + txtComplaint.Text.ToString().Replace("'", " ") + "' " +
                                        " where order_id='" + ViewState["id"].ToString() + "'  ");
            if (i2 == true)
            {
                Response.Redirect("complain.aspx");
            }
        }

    }
}