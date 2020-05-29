using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    DBConnectionClass dbCommon = new DBConnectionClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DBConnectionClass conD = new DBConnectionClass("creteNewUserAndCompany");
        List<SqlParameter> sqlp = new List<SqlParameter>();
        sqlp.Clear();
        sqlp.Add(new SqlParameter("@company_name",txtCompanyName.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@company_address_l1",txtCompanyAddressL1.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@company_address_l2",txtCompanyAddressL2.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@company_address_l3",txtCompanyAddressL3.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@company_phone",txtCompanyPhone.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@password", dbCommon.HashId(txtPassword.Text.ToString().Trim())));
        sqlp.Add(new SqlParameter("@fname",txtfname.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@lname",txtlname.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@email",txtEmail.Text.ToString().Trim()));
        sqlp.Add(new SqlParameter("@mobile",txtMobile.Text.ToString().Trim()));
        bool i = conD.SaveData(sqlp);
        if (i == true)
        {
            Response.Redirect("login.aspx");
        }
    }


    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        int i = 0;
        string sqlQuery = "";

        sqlQuery = "select Count(login_id) from Login " +
                   " where email='" + txtEmail.Text.Trim() + "'";

        i = dbCommon.CheckDuplicateByQuery(sqlQuery);

        if (i >= 1)
        {
            lblEmail_V.Text = "*Email Id Exist.";
        }
        else
        {
            lblEmail_V.Text = "";
        }

    }
}