using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class new_order : System.Web.UI.Page
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
            if (Request.QueryString.AllKeys.Contains("uid"))
            {
                fillView();
            }
            else
            {
                fillData("all");
            }
        }
    }

    public void fillData(string linenFor)
    {
        DataTable dt = new DataTable();
        string sqlQry = "";
        sqlQry = "select * from item ";
        if (linenFor != "all")
        {
            sqlQry += "where item_type='" + linenFor + "'";
        }
        dt = dbCommon.DisplayDataQuery(sqlQry).Tables[0];
        DataTable dtData = new DataTable();
        dtData.Columns.Add("item_Id");
        dtData.Columns.Add("item_name");
        dtData.Columns.Add("item_type");
        dtData.Columns.Add("description");
        dtData.Columns.Add("price");
        dtData.Columns.Add("photo_src");
        dtData.Columns.Add("qty");

        foreach (DataRow dr in dt.Rows)
        {
            DataRow drTab = dtData.NewRow();
            drTab["item_id"] = dr["item_id"].ToString();
            drTab["item_name"] = dr["item_name"].ToString();
            drTab["item_type"] = dr["item_type"].ToString();
            drTab["description"] = dr["description"].ToString();
            drTab["price"] = dr["price"].ToString();
            byte[] bytes;
            try
            {
                bytes = (byte[])dr["photo_src"];
                drTab["photo_src"] = "data:image/png;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
            }
            catch (Exception)
            {
                bytes = null;
            }
            
            dtData.Rows.Add(drTab);
        }
        GridView1.DataSource = dtData.Copy();
        GridView1.DataBind();
    }

    public void fillView()
    {
        DataTable dt = new DataTable();
        string sqlQry = "";

        sqlQry = "select * from orderMst where order_id ='" + Request.QueryString["uid"].ToString() + "'";
        dt = dbCommon.DisplayDataQuery(sqlQry).Tables[0];

        foreach (DataRow dr in dt.Rows)
        {
            txtTotAmount.Text = dr["amount"].ToString();
            txtTotQty.Text = dr["totalqty"].ToString();
            txtPickUpDate.Text = Convert.ToDateTime(dr["pick_up_date"].ToString()).ToString("yyyy-MM-dd hh:mm");
            break;
        }

        dt.Rows.Clear();

        sqlQry = "select c.item_id,c.item_name,c.item_type,b.quantity,b.price,c.description,c.photo_src " +
                  "  from OrderMst a, order_details b, item c " +
                  "  where a.order_id = b.order_id and c.item_id = b.item_id and a.order_id ='"+ Request.QueryString["uid"].ToString() +"'";

        dt = dbCommon.DisplayDataQuery(sqlQry).Tables[0];
        DataTable dtData = new DataTable();
        dtData.Columns.Add("item_Id");
        dtData.Columns.Add("item_name");
        dtData.Columns.Add("item_type");
        dtData.Columns.Add("description");
        dtData.Columns.Add("price");
        dtData.Columns.Add("photo_src");
        dtData.Columns.Add("qty");

        foreach (DataRow dr in dt.Rows)
        {
            DataRow drTab = dtData.NewRow();
            drTab["item_id"] = dr["item_id"].ToString();
            drTab["item_name"] = dr["item_name"].ToString();
            drTab["item_type"] = dr["item_type"].ToString();
            drTab["description"] = dr["description"].ToString();
            drTab["price"] = dr["price"].ToString();
            drTab["qty"] = dr["quantity"].ToString();

            byte[] bytes;
            try
            {
                bytes = (byte[])dr["photo_src"];
                drTab["photo_src"] = "data:image/png;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
            }
            catch (Exception)
            {
                bytes = null;
            }

            dtData.Rows.Add(drTab);
        }
        GridView1.DataSource = dtData.Copy();
        GridView1.DataBind();
        btnSubmit.Visible = false;
    }

    protected void cmbItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cmbItem.SelectedValue.ToString() != "select")
        {
            fillData(cmbItem.SelectedValue.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int maxId = dbCommon.CheckDuplicateByQuery("select IsNUll(Max(order_id),0)+1 from orderMst");
        string s = Session["Scompany_id"].ToString();
        bool i2 = dbCommon.boolInsertData("insert into orderMst(order_id,login_id,company_id,date_time,pick_up_date,amount,totalqty)" +
                                    " Values('" + maxId + "','" + Session["Slogin_id"].ToString() + "','" + Session["Scompany_id"].ToString() + "', " +
                                    " SYSDATETIME(),'" + DateTime.Parse(txtPickUpDate.Text.ToString()).ToString("yyyy-MM-dd hh:mm") + "','" + txtTotAmount.Text.ToString() + "','" + txtTotQty.Text.ToString() + "') ");
        if (i2 == true)
        {
            try
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    TextBox txtQty = (TextBox)row.Cells[6].FindControl("TextBoxS");
                    if (txtQty.Text.ToString() != "")
                    {
                        dbCommon.boolInsertData("insert into order_details(order_id, item_id, quantity, price) " +
                                            " Values('" + maxId + "','" + row.Cells[0].Text.ToString() + "','" + txtQty.Text.ToString() + "','" + row.Cells[4].Text.ToString() + "') ");
                    }
                    }
                Response.Redirect("past_order.aspx");
            }
            catch (Exception) { }
        }

    }

    protected void TextBoxS_TextChanged(object sender, EventArgs e)
    {
        double sum = 0,totAmt=0;
        for (int i = 0; i < GridView1.Rows.Count; ++i)
        {
            double d = 0,amt=0;
            TextBox txtQty = (TextBox)GridView1.Rows[i].Cells[6].FindControl("TextBoxS");
            Double.TryParse(GridView1.Rows[i].Cells[4].Text.ToString(), out amt);
            Double.TryParse(txtQty.Text.ToString(), out d);
            sum += d;
            totAmt += amt * d;
        }
        txtTotAmount.Text = totAmt.ToString();
        txtTotQty.Text = sum.ToString();
    }
}