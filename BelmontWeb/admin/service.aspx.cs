using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_service : System.Web.UI.Page
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
            fillTable();
        }
    }

    public void fillData()
    {
        if (Request.QueryString.AllKeys.Contains("eid"))
        {
            if (!Request.QueryString["eid"].ToString().All(char.IsDigit))
            {
                Response.Redirect("../logout.aspx");
            }
            btnSubmit.Text = "Update";

            string id = Request.QueryString["eid"];

            ViewState["id"] = Request.QueryString["eid"];

            string sqlP = "select * from service where service_id='" + id + "'";

            DataTable dt = new DataTable();
            dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];

            if (dt.Rows.Count >= 0)
            {
                btnSubmit.Text = "Update";
                btnCancel.Visible = true;
                foreach (DataRow dr in dt.Rows)
                {

                    txttitle.Text = dr["sname"].ToString();
                    ViewState["description"]= dr["sname"].ToString();
                    txtDescription.Text = dr["description"].ToString();
                    byte[] bytes;
                    try
                    {
                        bytes = (byte[])dr["image_src"];
                        Session["imageupdate"] = bytes;
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        displayImg.ImageUrl = "data:image/png;base64," + base64String;

                    }
                    catch (Exception)
                    {
                        bytes = null;
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
        string sqlP = "select * from service ";

        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];
        StringBuilder html = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            html.Append("<tr>");
            html.Append("<td>" + dr["sname"] + "</td>");
            html.Append("<td>" + dr["description"] + "</td>");
            html.Append("<td align='center' width='4%'><a href='service.aspx?eid=" + dr["service_id"].ToString() + "'><i class='fa fa-1x fa-pencil'></i></a></td>");
            html.Append("<td align='center' width='4%'><a href='Javascript:deletefunction(" + dr["service_id"].ToString() + ");'><i class='fa fa-1x fa-trash-o'></i></a></td>");
            html.Append("</tr>");
        }
        displayData.InnerHtml = html.ToString();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (lblDErrorMsg.Text != "") { }
        else
        {
            Byte[] bytes = null;
            String ext = imgCategoryImage.PostedFile.ContentType;

            try
            {
                if (ext.ToLower() == "image/jpeg" || ext.ToLower() == "image/jpg" || ext.ToLower() == "image/png")
                {

                    if (imgCategoryImage.PostedFile.ContentLength > 0)
                    {
                        Stream fs = imgCategoryImage.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs);
                        bytes = br.ReadBytes((Int32)fs.Length);
                    }
                }
                else
                if (Session["imageupdate"] != null)
                {
                    bytes = (Byte[])Session["imageupdate"];
                }
                else
                {
                    bytes = new byte[] { 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20 };
                }

                List<SqlParameter> sqlp = new List<SqlParameter>();
                sqlp.Add(new SqlParameter("@image_src", bytes));
                sqlp.Add(new SqlParameter("@description", txtDescription.Text.ToString()));
                sqlp.Add(new SqlParameter("@sname", txttitle.Text.ToString()));

                if (btnSubmit.Text == "Submit")
                {
                    DBConnectionClass dbSp = new DBConnectionClass("insertService");

                    if (dbSp.SaveData(sqlp) == true)
                    {
                        Response.Redirect("service.aspx");
                    }
                }
                else
                {
                    DBConnectionClass dbSp = new DBConnectionClass("updateService");
                    sqlp.Add(new SqlParameter("@service_id", ViewState["id"].ToString()));
                    if (dbSp.SaveData(sqlp) == true)
                    {
                        Response.Redirect("service.aspx");
                    }
                }
            }
            catch (Exception) { }
        }
    }

    [System.Web.Services.WebMethod]
    public static string Deleteservice(string eid)
    {
        try
        {
            DBConnectionClass con = new DBConnectionClass();

            bool i = con.boolInsertData("delete from service where service_id='" + eid.ToString().Trim() + "'");
            if (i == true) return "true"; else return "false";
        }
        catch (Exception)
        {
            return "false";
        }
    }



    protected void txttitle_TextChanged(object sender, EventArgs e)
    {
        int i = 0;
        DBConnectionClass conD = new DBConnectionClass("CheckDuplicateData");
        List<SqlParameter> sqlp = new List<SqlParameter>();
        sqlp.Clear();
        sqlp.Add(new SqlParameter("@TableName", "service"));
        sqlp.Add(new SqlParameter("@FieldName", "sname"));
        sqlp.Add(new SqlParameter("@FieldValue", txttitle.Text.ToString().Trim()));
        i = conD.CheckDuplicate(sqlp);
        if (i >= 1)
        {
            if (btnSubmit.Text == "Update" && txtDescription.Text.ToUpper().Trim() != ViewState["description"].ToString().ToUpper().Trim())
            {
                lblDErrorMsg.Text = "* This service exist.";
                lblDErrorMsg.Visible = true;
            }
            else
            {
                lblDErrorMsg.Text = "";
                lblDErrorMsg.Visible = false;
            }
            if (btnSubmit.Text == "Submit")
            {
                lblDErrorMsg.Text = "* This service exist.";
                lblDErrorMsg.Visible = true;
            }
        }
        else
        {
            lblDErrorMsg.Text = "";
            lblDErrorMsg.Visible = false;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ViewState["id"] = "";
        ViewState["description"] = "";
        Response.Redirect("service.aspx");
    }
}