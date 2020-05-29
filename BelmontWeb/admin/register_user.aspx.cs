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

public partial class admin_register_user : System.Web.UI.Page
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
            Fill_Combo_des();
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

            string sqlP = "select * from login where login_id='" + id + "'";

            DataTable dt = new DataTable();
            dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];

            if (dt.Rows.Count >= 0)
            {
                btnSubmit.Text = "Update";
                btnCancel.Visible = true;
                foreach (DataRow dr in dt.Rows)
                {
                    txtFName.Text = dr["fname"].ToString();
                    txtLName.Text = dr["lname"].ToString();
                    cmbItemtype.SelectedValue = dr["designation_id"].ToString();
                    txtEmail.Text = dr["email"].ToString();
                    txtAddress.Text = dr["address"].ToString();
                    byte[] bytes;
                    try
                    {
                        bytes = (byte[])dr["profile_src"];
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

    protected void Fill_Combo_des()
    {

        DataTable dtCat = new DataTable();
        dtCat = dbCommon.DisplayDataQuery("select * from designation").Tables[0];
        cmbItemtype.Items.Clear();
        cmbItemtype.Items.Add(new ListItem("Select Designation", "select"));
        foreach (DataRow drUserInfo in dtCat.Rows)
        {
            cmbItemtype.Items.Add(new ListItem(drUserInfo["designation_name"].ToString(), drUserInfo["designation_id"].ToString()));
        }
    }

    public void fillTable()
    {
        string sqlP = "select * from login where role='admin' ";

        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];
        StringBuilder html = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            html.Append("<tr>");
            html.Append("<td>" + dr["fname"] + " " + dr["lname"] + "</td>");
            html.Append("<td>" + dr["email"] + "</td>");
            html.Append("<td>" + dr["address"] + "</td>");
            byte[] bytes;
            string base64String = "";
            try
            {
                bytes = (byte[])dr["profile_src"];
                Session["imageupdate"] = bytes;
                base64String = "data:image/png;base64,";
                base64String += Convert.ToBase64String(bytes, 0, bytes.Length);

            }
            catch (Exception)
            {
                bytes = null;
            }
            html.Append("<td><img src='"+ base64String + "' alt='userimage' height='100px' width='100px' /></td>");
            html.Append("<td align='center' width='4%'><a href='register_user.aspx?eid=" + dr["login_id"].ToString() + "'><i class='fa fa-1x fa-pencil'></i></a></td>");
            html.Append("<td align='center' width='4%'><a href='Javascript:deletefunction(" + dr["login_id"].ToString() + ");'><i class='fa fa-1x fa-trash-o'></i></a></td>");
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
                sqlp.Add(new SqlParameter("@profile_src", bytes));
                sqlp.Add(new SqlParameter("@password", dbCommon.HashId("admin")));
                sqlp.Add(new SqlParameter("@fname", txtFName.Text.ToString().Trim()));
                sqlp.Add(new SqlParameter("@lname", txtLName.Text.ToString().Trim()));
                sqlp.Add(new SqlParameter("@email", txtEmail.Text.ToString().Trim()));
                sqlp.Add(new SqlParameter("@designation_id", cmbItemtype.SelectedValue.ToString().Trim()));
                sqlp.Add(new SqlParameter("@address", txtAddress.Text.ToString().Trim()));

                if (btnSubmit.Text == "Submit")
                {
                    DBConnectionClass dbSp = new DBConnectionClass("insertAdminUser");

                    if (dbSp.SaveData(sqlp) == true)
                    {
                        Response.Redirect("register_user.aspx");
                    }
                }
                else
                {
                    DBConnectionClass dbSp = new DBConnectionClass("updateAdminUser");
                    sqlp.Add(new SqlParameter("@login_id", ViewState["id"].ToString()));
                    if (dbSp.SaveData(sqlp) == true)
                    {
                        Response.Redirect("register_user.aspx");
                    }
                }
            }
            catch (Exception) { }
        }
    }

    [System.Web.Services.WebMethod]
    public static string Deleteitem(string eid)
    {
        try
        {
            DBConnectionClass con = new DBConnectionClass();

            bool i = con.boolInsertData("delete from login where login_id='" + eid.ToString().Trim() + "'");
            if (i == true) return "true"; else return "false";
        }
        catch (Exception)
        {
            return "false";
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ViewState["id"] = "";
        Response.Redirect("register_user.aspx");

    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        int i = 0;

        string sqlQry = "";
        sqlQry = "select count(*) from login where email='" + txtEmail.Text.ToString().Trim() + "'  ";

        if (btnSubmit.Text == "Update")
        {
            sqlQry += " and login_id not in('" + ViewState["id"].ToString() + "')";
        }

        i = dbCommon.CheckDuplicateByQuery(sqlQry);
        if (i >= 1)
        {
            lblDErrorMsg.Text = "* This email exist.";
            lblDErrorMsg.Visible = true;
        }
        else
        {
            lblDErrorMsg.Text = "";
            lblDErrorMsg.Visible = false;
        }
    }
}