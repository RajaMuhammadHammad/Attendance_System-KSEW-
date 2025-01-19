<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insertdata.aspx.cs" Inherits="WebApplication7.Insertdata" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function getCurrentTime() {
                var now = new Date();
                var hours = now.getHours().toString().padStart(2, '0');
                var minutes = now.getMinutes().toString().padStart(2, '0');
                return hours + ":" + minutes;
            }

            function getCurrentDate() {
                var now = new Date();
                var year = now.getFullYear();
                var month = (now.getMonth() + 1).toString().padStart(2, '0');
                var day = now.getDate().toString().padStart(2, '0');
                return year + "-" + month + "-" + day;
            }

            document.getElementById('Date').value = getCurrentDate();
            document.getElementById('Time').value = getCurrentTime();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server" class="m-5">
        <div class="container border rounded-5 shadow-lg mt-5 p-5">
            <h1 class="mb-5">Attendance Form</h1>

            <div class="form-group">
                <label for="Date" class="mb-2 mt-3">Date</label>
                <input type="date" class="form-control w-75" id="Date" name="Date" placeholder="date">
            </div>
            
            <div class="form-group">
                <label for="ID" class="mb-3 mt-3">KSWE ID</label>
                <input type="text" class="form-control w-75" id="ID" name="ID" aria-describedby="idHelp" placeholder="Enter ID">
            </div>
            
            <div class="form-group">
                <label for="Time" class="mb-2 mt-3">Time</label>
                <input type="time" class="form-control w-75" id="Time" name="Time" placeholder="Time">
            </div>

            <div class="form-group mt-3">
                <label for="InOutTime" class="mb-2">In/Out Time</label>
                <select class="form-select w-75" id="InOutTime" name="InOutTime" aria-label="Select an option">
                    <option selected>Select an option</option>
                    <option value="F1">F1</option>
                    <option value="F2">F2</option>
                    <option value="F3">F3</option>
                </select>
            </div>

          

            <div class="form-group mt-3">
                <label for="Device_No" class="mb-2">Device No</label>
                <select class="form-select w-75" id="Device_No" name="Device_No" aria-label="Select an option">
                    <option selected>Select an option</option>
                    <option value="51">51</option>
                    <option value="53">53</option>
                    <option value="54">54</option>
                    <option value="60">60</option>
                    <option value="70">70</option>
                    <option value="90">90</option>
                </select>
            </div>

         

            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>

            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary mt-5" OnClick="SubmitButton_Click" />
            <asp:Button ID="BackButton" runat="server" Text="Back" CssClass="btn btn-primary mt-5" OnClick="BackButton_Click" />
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
