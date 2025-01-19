using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace WebApplication7
{
    public partial class MysqlRecord : System.Web.UI.Page
    {
        private static string MyConnectionString = "Server=127.0.0.1;Database=employee_record;Uid=root;Password=";
        MySqlConnection mySqlConnection = new MySqlConnection(MyConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
        private void BindGridView()
        {
            try
            {
                mySqlConnection.Open();

                // Create a MySqlCommand to fetch data with backticks around the table name
                MySqlCommand cmd = new MySqlCommand("SELECT `Date`, `ID`, `Time`, `InOutstatus`,`Device_Number` FROM `e-records`", mySqlConnection);
        
                // Use MySqlDataAdapter to fill a DataTable
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Bind the DataTable to the GridView
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("There is an error: " + ex.Message);
            }
            finally
            {
                mySqlConnection.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
