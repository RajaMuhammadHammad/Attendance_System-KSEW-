using MySql.Data.MySqlClient;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class Oraclerecords : System.Web.UI.Page
    {
        private static string OracleConnectionString = "User Id=system;Password=123;Data Source=localhost/xepdb1;";
        OracleConnection oracleConnection = new OracleConnection(OracleConnectionString);

        private static string MyConnectionString = "Server=127.0.0.1;Database=employee_record;Uid=root;Password=";
        MySqlConnection mySqlConnection = new MySqlConnection(MyConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
               // Label13.Text = "Data transferred to Oracle successfully.";

                // Register the JavaScript function to show the alert
                
                BindGridView2();
            }
        }

        private void BindGridView2()
        {
            try
            {
                oracleConnection.Open();
                OracleCommand cmd = new OracleCommand("SELECT * FROM IFS_RECORDS", oracleConnection);
                OracleDataAdapter adapter = new OracleDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    Label13.Visible = true;
                    Label13.Text = "No records found.";
                }
            }
            catch (Exception ex)
            {
                Label13.Visible = true;
                Label13.Text = "There is an error: " + ex.Message;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlConn = new MySqlConnection(MyConnectionString))
            using (OracleConnection oracleConn = new OracleConnection(OracleConnectionString))
            {
                try
                {
                    mysqlConn.Open();
                    oracleConn.Open();
        
                    string selectQuery = @"
                        SELECT e.ID, e.Time, e.InOutstatus, e.Date, e.Device_Number, 
       d.Device_id, d.Device_name, d.Comapany, d.Status,  b.IFS_ID FROM `e-records` e JOIN bridge_table b ON e.ID = b.ID  
          JOIN devices d ON e.Device_Number = d.Device_Number";
;

                    using (MySqlCommand selectCmd = new MySqlCommand(selectQuery, mysqlConn))
                    using (MySqlDataReader reader = selectCmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string date = reader["Date"].ToString();
                            string id = reader["ID"].ToString();
                            string Time = reader["Time"].ToString();
                            string InOutstatus = reader["InOutstatus"].ToString();
                            string Company = reader["Comapany"].ToString();
                            string devicename = reader["Device_name"].ToString();
                            int deviceNo = Convert.ToInt32(reader["Device_id"]);
                            string status = reader["Status"].ToString();
                            int ifsid = Convert.ToInt32(reader["IFS_ID"]);
                          //  int SNo = Convert.ToInt32(reader["SNO"]);

                            if (!DoesRecordExistInOracle(ifsid, date, Time, InOutstatus, oracleConn))
                            {
                                string oracleInsertQuery = @"
                                    INSERT INTO IFS_RECORDS
                                    (IFS_ID, TIME, INOUTSTATUS, ATTENDANCEDATE, COMPANY, 
                                    DEVICENAME, DEVICENO, STATUS)
                                    VALUES
                                    (:IFS_ID, :TIME, :INOUTSTATUS, :ATTENDANCEDATE, :COMPANY, 
                                    :DEVICENAME, :DEVICENO, :STATUS)";

                                using (OracleCommand oracleCmd = new OracleCommand(oracleInsertQuery, oracleConn))
                                {
                                    oracleCmd.Parameters.Add(new OracleParameter(":IFS_ID", ifsid));
                                    oracleCmd.Parameters.Add(new OracleParameter(":TIME", Time));
                                    oracleCmd.Parameters.Add(new OracleParameter(":INOUTSTATUS", InOutstatus));
                                    oracleCmd.Parameters.Add(new OracleParameter(":ATTENDANCEDATE", date));
                                    oracleCmd.Parameters.Add(new OracleParameter(":COMPANY", Company));
                                    oracleCmd.Parameters.Add(new OracleParameter(":DEVICENAME", devicename));
                                    oracleCmd.Parameters.Add(new OracleParameter(":DEVICENO", deviceNo));
                                    oracleCmd.Parameters.Add(new OracleParameter(":STATUS", status));

                                    oracleCmd.ExecuteNonQuery();
                                }
                            }
                        }
                        reader.Close();
                    }

                    Label13.Text = "Data transferred to Oracle successfully.";
                    string script = $"showAlert('{Label13.Text}');";
                    ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                    // Refresh only the header
                    ScriptManager.RegisterStartupScript(this, GetType(), "RefreshHeader", "refreshHeader();", true);
                }
                catch (Exception ex)
                {
                    Label13.Visible = true;
                    Label13.Text = "There is an error: " + ex.Message;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                int SNo = Convert.ToInt32(e.CommandArgument);

                try
                {
                    using (OracleConnection oracleConn = new OracleConnection(OracleConnectionString))
                    {
                        oracleConn.Open();

                        string deleteQuery = "DELETE FROM IFS_RECORDS WHERE SNO = :SNO";
                        using (OracleCommand oracleCmd = new OracleCommand(deleteQuery, oracleConn))
                        {
                            oracleCmd.Parameters.Add(new OracleParameter(":SNO", SNo));
                            int rowsAffected = oracleCmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                Label13.Text = "Record deleted successfully.";
                            }
                            else
                            {
                                Label13.Text = "Record not found.";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label13.Visible = true;
                    Label13.Text = "Error deleting record: " + ex.Message;
                }
                finally
                {
                    BindGridView2(); // Refresh the GridView after deletion
                    // Refresh only the header
                    ScriptManager.RegisterStartupScript(this, GetType(), "RefreshHeader", "refreshHeader();", true);
                }
            }
        }

        private bool DoesRecordExistInOracle(int ifsid, string date, string Time, string InOutstatus, OracleConnection oracleConn)
        {
            try
            {
                string query = "SELECT COUNT(*) FROM IFS_RECORDS WHERE IFS_ID = :IFS_ID AND ATTENDANCEDATE = :ATTENDANCEDATE AND TIME = :TIME AND INOUTSTATUS = :INOUTSTATUS";
                using (OracleCommand cmd = new OracleCommand(query, oracleConn))
                {
                    cmd.Parameters.Add(new OracleParameter(":IFS_ID", ifsid));
                    cmd.Parameters.Add(new OracleParameter(":ATTENDANCEDATE", date));
                    cmd.Parameters.Add(new OracleParameter(":TIME", Time));
                    cmd.Parameters.Add(new OracleParameter(":INOUTSTATUS", InOutstatus));
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                Label13.Visible = true;
                Label13.Text = "Error checking existing record in Oracle: " + ex.Message;
                return false;
            }
        }
    }
}
