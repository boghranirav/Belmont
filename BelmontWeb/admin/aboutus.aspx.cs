using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_aboutus : System.Web.UI.Page
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
        }
    }

    public void fillData()
    {
        string sqlP = "select Top 1 * from about_us";

        DataTable dt = new DataTable();
        dt = dbCommon.DisplayDataQuery(sqlP).Tables[0];

        if (dt.Rows.Count >= 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                txtPhone.Text = dr["phone"].ToString();
                txtEmail.Text = dr["email"].ToString();
                txtAddress1.Text = dr["address_l1"].ToString();
                txtAddress2.Text = dr["address_l2"].ToString();
                txtAddress3.Text = dr["address_l3"].ToString();
                txtTitle.Text = dr["title"].ToString();
                txtDescriptionOne.Text = dr["description"].ToString();
                txtDescTwo.Text = dr["description2"].ToString();
                txtTiming.Text = dr["timing"].ToString();
            }
        }
        else if (Request.QueryString.AllKeys.Length == 1)
        {
            Response.Redirect("../Logout.aspx");
        }
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {
  //      try
    //    {
            string sqlStr = "";


            sqlStr = " delete from about_us; ";

            sqlStr += " insert into about_us(about_id,phone,email,address_l1,address_l2,address_l3,description,title,description2,timing)  " +
                      " values('1','" + txtPhone.Text.ToString().Trim() + "','" + txtEmail.Text.ToString().Trim() + "','" + txtAddress1.Text.ToString().Trim() + "', " +
                      " '" + txtAddress2.Text.ToString().Trim() + "','" + txtAddress3.Text.ToString().Trim() + "', " +
                      " '"+ txtDescriptionOne.Text.ToString() + "','"+txtTitle.Text.ToString().Trim()+"','" + txtDescTwo.Text.ToString().Trim() + "','"+txtTiming.Text.ToString()+"' ) ";

            bool i=dbCommon.boolInsertData(sqlStr);

            if (i == true)
            {
                Response.Redirect("aboutus.aspx");
            }
            else
            {

          }
//        }
    //    catch (Exception) {  }
    }
}