<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap 4 css link-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<!-- Login starts here -->
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4" >
            <div class="border " style="padding:30px;margin-top:30%;">
                <form action="homepage" method="post">
                    <h1>Login</h1>
                    <hr>
                    <div class="form=group">
                        <label for="uname">Username</label>
                        <input class="form-control" name="uname" id="uname" type ="uname" placeholder="UserName" required="required"/>
                        <small id="unamehelp" class="form-text text-muted">We'll never share your username with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                          <input class="form-control" name="password" id="password" type="password" placeholder="Password" required="required"/>
                    </div>
                    <input type="submit" value="Login" class="form-control btn btn-primary"/>
                    <p style = "color: red; font-weight:bold;">${loginError}</p>
                </form>
                <form action = "signup">
                    <input type="submit" value="Sign Up" class="form-control btn btn-primary"/>
                    <p style="color: green; font-weight: bold;">${addmsg}</p>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap 4 script link-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</script>
</body>
</html>