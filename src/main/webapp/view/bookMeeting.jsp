<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap 4 css link-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body class = "bg-dark">

<form action = "newInvite">
    <div class="container border bg-light" style="padding:50px;">
            <h6 style = "color: red;">${error}</h6>
            <h1>New Calender Invite</h1>
            <div class="row">
            <label>Name/organizer</label>
            <input type="text" name="organizer" class="form-control" placeholder="Organizers's Name" required="required"/>
            </div>
            <div class="row">
            <label>Participant</label>
            <input type="text" name="participant" class="form-control" placeholder="Participant Name" required="required"/>
            </div>
            <div class="row">
            <label>Date</label>
            <input type="date" name="dateofmeeting" class="form-control" placeholder="Date of meeting" required="required"/>
            </div>
            <div class="row">
            <label>Start Time</label>
            <input type="time" name="starttime" class="form-control" placeholder="Office Hours are from 9am to 6pm" min="09:00" max="18:00" required="required"/>
            </div>
            <div class="row">
            <label>End Time</label>
            <input type="time" name="endtime" class="form-control" placeholder="-Office Hours are from 9am to 6pm" min="09:00" max="18:00" required="required"/>
            </div>
            <div class="row">
            <label>Event Name</label>
            <input type="text" name="eventname" class="form-control" placeholder="Event Name" required="required"/>
            </div>
            <div class="row">
            <label>Event Description</label>
            <input type="text" name="eventdesc" class="form-control" placeholder="Event Description" required="required"/>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <input type ="submit" class="btn btn-primary btn-lg form-control" value="Submit"/>
                </div>
            </div>
            <c:choose>
                         <c:when test="${meetinglist!=null}">
                          <table class="table table-striped">
                                    <thead>
                                      <tr>
                                        <th scope="col">Organizer</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Date and Start Time</th>
                                        <th scope="col">Date and End Time</th>
                                        <th scope="col">Event Name</th>
                                        <th scope="col">Event Description</th>
                                        <th scope="col">Participant</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${meetinglist}" var="element">
                                      <tr>
                                        <td>${element.organizer}</td>
                                        <td>${element.dateofmeeting}</td>
                                        <td>${element.datestarttime}</td>
                                        <td>${element.dateendtime}</td>
                                        <td>${element.eventname}</td>
                                        <td>${element.eventdesc}</td>
                                        <td>${element.participant}</td>
                                      </tr>
                                     </c:forEach>
                                    </tbody>
                            </table>
                           </c:when>
                           <c:otherwise>
                           </c:otherwise>
                          </c:choose>
        </div>

</form>

<!-- Bootstrap 4 script link-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</script>
</body>
</html>