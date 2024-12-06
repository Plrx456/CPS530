<%@ Language="VBScript" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Background & Last Visit</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            transition: background-color 0.5s ease;
        }
    </style>
</head>
<body style="background-color:<%= Request.QueryString("bgcolor") %>">
    <div class="container text-center mt-5">
        <h1 class="mb-4">Welcome to the ASP Background Page</h1>
        
        <% 
        ' Retrieve the current date and time
        Dim currentDateTime
        currentDateTime = Now()

        ' Retrieve the last visit date from cookies
        Dim lastVisit
        lastVisit = Request.Cookies("LastVisit")

        ' Display message based on user's visit history
        If lastVisit = "" Then
            Response.Write("<p class='alert alert-info'>This is your first time visiting the page!</p>")
        Else
            Response.Write("<p class='alert alert-success'>Your last visit was on: " & lastVisit & "</p>")
        End If

        ' Save the current visit date in a cookie
        Response.Cookies("LastVisit") = currentDateTime
        Response.Cookies("LastVisit").Expires = DateAdd("d", 30, currentDateTime) ' Cookie expires in 30 days
        %>

        <p class="mt-4">
            Change the background color by appending <code>?bgcolor=color</code> to the URL. 
            Examples: <code>?bgcolor=blue</code> or <code>?bgcolor=#ff5733</code>.
        </p>

        <a href="lab10a.asp" class="btn btn-primary mt-3">Reset Background</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
