using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_designation : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Srole"] == null)
        {
            Response.Redirect("../LogOut.aspx");
        }
        //if (Request.QueryString.AllKeys.Length > 1)
        //{
        //    Response.Redirect("../logout.aspx");
        //}


        if (!IsPostBack)
        {
            fillTable();

            if (Request.QueryString.AllKeys.Contains("eid"))
            {
                if (!Request.QueryString["eid"].ToString().All(char.IsDigit))
                {
                    Response.Redirect("../logout.aspx");
                }
                btnSubmit.Text = "Update";

                string id = Request.QueryString["eid"];

                ViewState["id"] = Request.QueryString["eid"];

                DataTable dt = new DataTable();
                dt = dbCommon.DisplayDataQuery("select * from designation where designation_id='" + id + "'").Tables[0];

                if (dt.Rows.Count == 0) { Response.Redirect("designation.aspx"); }
                else
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        ViewState["description"] = dr["designation_name"].ToString();
                        txtDescription.Text = dr["designation_name"].ToString();
                    }
                }
            }
            else if (Request.QueryString.AllKeys.Length == 1)
            {
                Response.Redirect("../Logout.aspx");
            }
        }
    }

    public void fillTable()
    {
        string sqlP = "select * from designation ";

        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];
        StringBuilder html = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            html.Append("<tr>");
            html.Append("<td>" + dr["designation_name"] + "</td>");
            html.Append("<td align='center' width='4%'><a href='designation.aspx?eid=" + dr["designation_id"].ToString() + "'><i class='fa fa-1x fa-pencil'></i></a></td>");
            html.Append("<td align='center' width='4%'><a href='Javascript:deletefunction(" + dr["designation_id"].ToString() + ");'><i class='fa fa-1x fa-trash-o'></i></a></td>");
            html.Append("</tr>");
        }
        displayDes.InnerHtml = html.ToString();
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (lblDErrorMsg.Text == "")
        {
            if (btnSubmit.Text == "Submit")
            {
                int maxId = dbCommon.CheckDuplicateByQuery("select IsNUll(Max(designation_id),0)+1 from designation");
                bool b = dbCommon.boolInsertData("insert into designation (designation_id,designation_name) " +
                                        " values('" + maxId + "', '" + txtDescription.Text.ToString().Trim() + "') ");

                if (b == true)
                {
                    Response.Redirect("designation.aspx");
                }
            }
            else
            {
                bool b = dbCommon.boolInsertData("update designation set designation_name='" + txtDescription.Text.ToString().Trim() + "' " +
                                        "  where designation_id='" + ViewState["id"].ToString() + "' ");

                if (b == true)
                {
                    Response.Redirect("designation.aspx");
                }
            }
        }
    }

    [System.Web.Services.WebMethod]
    public static string Deletedesignation(string eid)
    {
        try
        {
            DBConnectionClass con = new DBConnectionClass();

            bool i = con.boolInsertData("delete from designation where designation_id='" + eid.ToString().Trim() + "'");
            if (i == true) return "true"; else return "false";
        }
        catch (Exception)
        {
            return "false";
        }
    }


    protected void txtDescription_TextChanged(object sender, EventArgs e)
    {
        int i = 0;
        DBConnectionClass conD = new DBConnectionClass("CheckDuplicateData");
        List<SqlParameter> sqlp = new List<SqlParameter>();
        sqlp.Clear();
        sqlp.Add(new SqlParameter("@TableName", "designation"));
        sqlp.Add(new SqlParameter("@FieldName", "designation_name"));
        sqlp.Add(new SqlParameter("@FieldValue", txtDescription.Text.ToString().Trim()));
        i = conD.CheckDuplicate(sqlp);
        if (i >= 1)
        {
            if (btnSubmit.Text == "Update" && txtDescription.Text.ToUpper().Trim() != ViewState["description"].ToString().ToUpper().Trim())
            {
                lblDErrorMsg.Text = "* This designation exist.";
            }
            else
            {
                lblDErrorMsg.Text = "";
            }
            if (btnSubmit.Text == "Submit")
            {
                lblDErrorMsg.Text = "* This designation exist.";
            }
        }
        else
        {
            lblDErrorMsg.Text = "";
        }
    }
}