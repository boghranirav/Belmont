using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auto_order : System.Web.UI.Page
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
        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery("select * from company where company_id='" + Session["Scompany_id"].ToString() + "'").Tables[0];

        if (dt.Rows.Count == 0) { }
        else
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["auto_order"].ToString() == "0")
                {
                    cmbAutoOrder.SelectedValue = "no";
                }
                else
                {
                    cmbAutoOrder.SelectedValue = "yes";
                }
                txtDays.Text = dr["days_of_order"].ToString();
                txtDate.Text = Convert.ToDateTime(dr["start_from_date"].ToString()).ToString("yyyy-MM-dd");
                txtCompanyName.Text = dr["company_name"].ToString();
                txtAddress1.Text = dr["company_address_l1"].ToString();
                txtAddress2.Text = dr["company_address_l2"].ToString();
                txtAddress3.Text = dr["company_address_l3"].ToString();
                txtContact.Text = dr["company_phone"].ToString();
            }
        }
        
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int autoYN = 0;
        if (cmbAutoOrder.SelectedValue == "no")
        {
            autoYN = 0;
        }
        else
        {
            autoYN = 1;
        }
        bool i = dbCommon.boolInsertData("update company set auto_order='"+autoYN+"', days_of_order='"+txtDays.Text.ToString()+"', start_from_date ='"+ DateTime.Parse(txtDate.Text.ToString()).ToString("yyyy-MM-dd") + "', " +
                                        " company_name='"+txtCompanyName.Text.ToString()+ "', company_address_l1='"+ txtAddress1.Text.ToString() + "', " +
                                        " company_address_l2='" + txtAddress2.Text.ToString() + "', company_address_l3='" + txtAddress3.Text.ToString() + "', " +
                                        " company_phone='"+txtContact.Text +"' " +
                                    "  where company_id='" + Session["Scompany_id"].ToString() + "'");
        if (i == true)
        {
            Response.Redirect("auto_order.aspx");
        }
    }
}