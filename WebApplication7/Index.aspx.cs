using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class AttandanceSystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
            protected void Button4_Click(object sender, EventArgs e)
            {
            Response.Redirect("Insertdata.aspx");
            }

          protected void Button5_Click(object sender, EventArgs e)
          {
            Response.Redirect("MysqlRecord.aspx");
          }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Oraclerecords.aspx");
        }
    }
    }
