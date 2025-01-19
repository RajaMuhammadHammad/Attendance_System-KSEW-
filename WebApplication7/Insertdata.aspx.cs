using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using Oracle.ManagedDataAccess.Client;

namespace WebApplication7
{
    public partial class Insertdata : System.Web.UI.Page
    {
        private static string MyConnectionString = "Server=127.0.0.1;Database=employee_record;Uid=root;Password=";
        MySqlConnection mySqlConnection = new MySqlConnection(MyConnectionString);

     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
            protected void SubmitButton_Click(object sender, EventArgs e)
        {
            var date = Request.Form["Date"]; // or use FindControl if the control is server-side
            var id = Request.Form["ID"];
            var time = Request.Form["Time"];
            var inOutStatus = Request.Form["InOutTime"];
            var deviceNo = int.Parse(Request.Form["Device_No"]);
           
            
            try
            {
                mySqlConnection.Open();
                string insertQuery = "INSERT INTO `e-records`(`Date`, `ID`, `Time`, `InOutstatus`,  `Device_Number`) VALUES (@Date, @ID, @Time, @InOutstatus, @Device_Number)";
                using (MySqlCommand cmd = new MySqlCommand(insertQuery, mySqlConnection))
                {
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Parameters.AddWithValue("@Time", time);
                    cmd.Parameters.AddWithValue("@InOutstatus", inOutStatus);
                    cmd.Parameters.AddWithValue("@Device_Number", deviceNo);
                    
                    cmd.ExecuteNonQuery();

                      Label13.Text = "Data inserted into Employee_Attendance.";
                }
            }
            catch (Exception ex)
            {
                Label13.Visible = true;
                Label13.Text = "There is an error: " + ex.Message + " " + ex.StackTrace;
            }

            finally
            {
                mySqlConnection.Close();
            }
        }
    }
}