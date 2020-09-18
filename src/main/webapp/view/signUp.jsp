<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap 4 css link-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="addUser" method="get">
    <div class="container border" style="padding:50px;">
        <h1>Sign Up</h1>
        <div class="row">
        <label>Name</label>
        <input type="text" name="name" class="form-control" placeholder="Name" required="required"/>
        </div>
        <div class="row">
        <label>User Name</label>
        <input type="text" name="uname" class="form-control" placeholder="Username" required="required"/>
        </div>
        <div class="row">
        <label>Password</label>
        <input type="password" name="pass" class="form-control" placeholder="Password" required="required"/>
        </div>
        <div class="row">
        <label>Re-enter Password</label>
        <input type="password" name="repass" class="form-control" placeholder="Re-enter Password" required="required"/>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <input type ="submit" class="btn btn-primary btn-lg form-control" value="Submit"/>
                <p style = "color: red; font-weight: bold;">${error}</p>
            </div>
        </div>
    </div>
</form>
<!-- Bootstrap 4 script link-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>