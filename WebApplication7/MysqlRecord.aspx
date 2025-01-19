<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MysqlRecord.aspx.cs" Inherits="WebApplication7.MysqlRecord" %>

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
    </style>
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
              <asp:Button ID="BackButton" runat="server" Text="Back" 
CssClass="btn btn-primary mt-5" 
OnClick="BackButton_Click" 
Style="float: right;" />
        <h1>&nbsp;<span class="auto-style4"><strong>Records&nbsp;</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
        

        <div class="container mt-5 px-2">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered my-custom-table" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="InOutstatus" HeaderText="InOutstatus" />
                    <asp:BoundField DataField="Device_Number" HeaderText="Device_Number" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
