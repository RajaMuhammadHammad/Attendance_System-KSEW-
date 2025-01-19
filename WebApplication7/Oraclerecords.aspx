<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oraclerecords.aspx.cs" Inherits="WebApplication7.Oraclerecords" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Records</title>
    <link rel="stylesheet" href="CSS/StyleSheet1.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .auto-style1 {
            color: #FF3300;
        }
        .auto-style3 {
            font-size: xx-large;
        }
        .auto-style4 {
            font-size: x-large;
        }

        /* Custom styling for the GridView */
        .my-custom-table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .my-custom-table th, .my-custom-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .my-custom-table th {
            background-color: #f4f4f4;
            color: #333;
        }

        .my-custom-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .my-custom-table tr:hover {
            background-color: #e9ecef;
        }

        .my-custom-table th {
            font-size: 16px;
            font-weight: bold;
        }

        .my-custom-table td {
            font-size: 14px;
        }

        /* Add animation to the table */
        .my-custom-table {
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Responsive table design */
        @media (max-width: 768px) {
            .my-custom-table {
                font-size: 12px;
            }

            .my-custom-table th, .my-custom-table td {
                padding: 10px;
            }
        }
        .button-container {
    display: flex;
    justify-content: flex-end; /* Aligns buttons to the right */
    gap: 10px; /* Optional: Adds space between buttons */
    margin-top: 1.25rem; /* Optional: Adds margin-top to match mt-5 */
}
    </style>
    <script type="text/javascript">
        function refreshHeader() {
            // This will trigger the partial page update for the header
            __doPostBack('UpdateHeader', '');
        }
    </script>
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <h1>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" Height="121px" ImageUrl="~/Images/klogo1.png" />
            &nbsp;<span class="auto-style1"><span class="text-decoration-underline"><strong> <span class="auto-style3">KARACHI SHIPYARD AND ENGINEERING WORK&nbsp;&nbsp;&nbsp;</span></strong></span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="118px" ImageUrl="~/Images/Pakistan_120-animated-flag-gifs.gif" />
            &nbsp;&nbsp;
        </h1>
        <h1>&nbsp;</h1>
                    <div class="button-container">
    <asp:Button ID="BackButton" runat="server" Text="Back" 
        CssClass="btn btn-primary" 
        OnClick="BackButton_Click" />
    <asp:Button ID="Button1" runat="server" Text="Update" 
        CssClass="btn btn-primary" 
        OnClick="UpdateButton_Click" />
</div>

        &nbsp;<h1>&nbsp;<span class="auto-style4"><strong>IFS Records&nbsp;</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
        <div class="container mt-5 px-2">
           <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered my-custom-table" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:BoundField DataField="SNo" HeaderText="SNo" />
        <asp:BoundField DataField="IFS_ID" HeaderText="ID" />
        <asp:BoundField DataField="TIME" HeaderText="Time" />
        <asp:BoundField DataField="INOUTSTATUS" HeaderText="InOutstatus" />
        <asp:BoundField DataField="ATTENDANCEDATE" HeaderText="Date" />
        <asp:BoundField DataField="COMPANY" HeaderText="Company" />
        <asp:BoundField DataField="DEVICENAME" HeaderText="DeviceName" />
        <asp:BoundField DataField="DEVICENO" HeaderText="DeviceNo" />
        <asp:BoundField DataField="STATUS" HeaderText="Status" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="DeleteRecord" CommandArgument='<%# Eval("SNO") %>' CssClass="btn btn-danger">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
        </div>

           <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
         <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>

     <div class="container mt-5 d-flex justify-content-center">
   
</div>

        <br />
        <br />
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>