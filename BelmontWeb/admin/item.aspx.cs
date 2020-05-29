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

public partial class admin_item : System.Web.UI.Page
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

            string sqlP = "select * from item where item_id='" + id + "'";

            DataTable dt = new DataTable();
            dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];

            if (dt.Rows.Count >= 0)
            {
                btnSubmit.Text = "Update";
                btnCancel.Visible = true;
                foreach (DataRow dr in dt.Rows)
                {

                    txtItem.Text = dr["item_name"].ToString();
                    cmbItemtype.SelectedValue = dr["item_type"].ToString();
                    txtDescription.Text = dr["description"].ToString();
                    txtPrice.Text = dr["price"].ToString();
                    byte[] bytes;
                    try
                    {
                        bytes = (byte[])dr["photo_src"];
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
        string sqlP = "select * from item ";

        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];
        StringBuilder html = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            html.Append("<tr>");
            html.Append("<td>" + dr["item_name"] + "</td>");
            html.Append("<td>" + dr["item_type"] + "</td>");
            html.Append("<td>" + dr["description"] + "</td>");
            html.Append("<td>" + dr["price"] + "</td>");
            html.Append("<td align='center' width='4%'><a href='item.aspx?eid=" + dr["item_id"].ToString() + "'><i class='fa fa-1x fa-pencil'></i></a></td>");
            html.Append("<td align='center' width='4%'><a href='Javascript:deletefunction(" + dr["item_id"].ToString() + ");'><i class='fa fa-1x fa-trash-o'></i></a></td>");
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
                sqlp.Add(new SqlParameter("@photo_src", bytes));
                sqlp.Add(new SqlParameter("@item_name", txtItem.Text.ToString().Trim()));
                sqlp.Add(new SqlParameter("@item_type", cmbItemtype.SelectedValue.ToString()));
                sqlp.Add(new SqlParameter("@price", txtPrice.Text.ToString().Trim()));
                sqlp.Add(new SqlParameter("@description", txtDescription.Text.ToString().Trim()));

                if (btnSubmit.Text == "Submit")
                {
                    DBConnectionClass dbSp = new DBConnectionClass("insertItem");

                    if (dbSp.SaveData(sqlp) == true)
                    {
                        Response.Redirect("item.aspx");
                    }
                }
                else
                {
                    DBConnectionClass dbSp = new DBConnectionClass("updateItem");
                    sqlp.Add(new SqlParameter("@item_id", ViewState["id"].ToString()));
                    if (dbSp.SaveData(sqlp) == true)
                    {
                        Response.Redirect("item.aspx");
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

            bool i = con.boolInsertData("delete from item where item_id='" + eid.ToString().Trim() + "'");
            if (i == true) return "true"; else return "false";
        }
        catch (Exception)
        {
            return "false";
        }
    }

    public void checkItemData()
    {
        int i = 0;

        string sqlQry = "";
        sqlQry = "select count(*) from item where item_name='"+txtItem.Text.ToString()+"' and item_type='"+cmbItemtype.SelectedValue.ToString()+"' ";

        if (btnSubmit.Text == "Update")
        {
            sqlQry += " and item_id not in('"+ ViewState["id"].ToString() + "')";
        }

        i = dbCommon.CheckDuplicateByQuery(sqlQry);
        if (i >= 1)
        {
                lblDErrorMsg.Text = "* This item and type exist.";
                lblDErrorMsg.Visible = true;
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
        Response.Redirect("item.aspx");
    }

    protected void txtItem_TextChanged(object sender, EventArgs e)
    {
        checkItemData();
    }

    protected void cmbItemtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        checkItemData();
    }
}