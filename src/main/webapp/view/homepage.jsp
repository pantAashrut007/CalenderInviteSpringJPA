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
<body>

    <div class="jumbotron">
      <center><h1 class="dispay-4">Calender Invite</h1></center>
      <h3 class="display-4">Hello, ${name}</h1>
      <p class="lead">Welcome to the homepage of calender booking. Please select the "Book a Meeting" botton to book a meeting.</p>
      <hr class="my-4">
      <p>You can click on Book a meeting to book a new meeting with someone and see the meeting schedule of tghe logged in user.</p>
      <p class="lead">
          <div class="row">
              <!-- <div class="col-md-4">
                  <form action="addStudent" method="get">
                      <input class="btn btn-success btn-lg" type="submit" value="Add Student Details" />
                  </form>
                  <p style = "color: green">${addInfo}</p>
              </div> -->
              <div class="col-md-4">
                  <form action="bookMeeting" method="get">
                      <input class="btn btn-info btn-lg" type="submit" value="Book a Meeting" />
                      <p style = "color: green;">${info}</p>
                  </form>
              </div>

          </div>
      </p>
      <c:choose>
             <c:when test="${list!=null}">
              <table class="table table-dark table-hover">
                        <thead>
                          <tr>
                            <th scope="col">Organizer</th>
                            <th scope="col">Date<a class="btn btn-light" style = "margin: 10px;" href = "/sortByDate">Sort</a></th>
                            <th scope="col">Date and Start Time</th>
                            <th scope="col">Date and End Time</th>
                            <th scope="col">Event Name</th>
                            <th scope="col">Event Description</th>
                            <th scope="col">Participant</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="element">
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

<!-- Bootstrap 4 script link-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>