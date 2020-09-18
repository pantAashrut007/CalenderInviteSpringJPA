package com.bottomline.calanderdemo.controller;

import com.bottomline.calanderdemo.model.Meeting;
import com.bottomline.calanderdemo.repo.MeetingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.util.Date;
import java.util.List;

@Controller
public class CreateMeetingController {

    @Autowired
    MeetingRepo mrepo;

    Meeting meeting = new Meeting();

    @GetMapping("newInvite")
    public String newMeeting(@RequestParam("organizer") String organizer,
                             @RequestParam("eventname") String eventName,
                             @RequestParam("eventdesc") String eventDesc,
                             @RequestParam("dateofmeeting") String dateOfMeeting,
                             @RequestParam("starttime") String start,
                             @RequestParam("endtime") String end,
                             @RequestParam("participant") String participant, Model model) throws ParseException {
        //yyyy-MM-dd HH:mm:ss
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(dateOfMeeting);
        meeting.setDateofmeeting(date);

        //getting date in sql date dataType
        java.sql.Date sqlDate = java.sql.Date.valueOf(dateOfMeeting);
        System.out.print(sqlDate);

        String stringStartDateAndTime = dateOfMeeting+" "+start;
        String stringendDateAndTime = dateOfMeeting+" "+end;

        //Converting String to localDateAndTime
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dateStartTime = LocalDateTime.parse(stringStartDateAndTime, formatter);
        LocalDateTime dateEndTime = LocalDateTime.parse(stringendDateAndTime, formatter);

        //Getting the current date and time
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formatDateTime = now.format(format);
        LocalDateTime modifiedCurrentDate = LocalDateTime.parse(formatDateTime, formatter);

        meeting.setOrganizer(organizer);
        meeting.setEventname(eventName);
        meeting.setEventdesc(eventDesc);
        meeting.setParticipant(participant);
        meeting.setDatestarttime(dateStartTime);
        meeting.setDateendtime(dateEndTime);
        meeting.setDateofmeeting(date);

        int count = 0;
        List<Meeting> meetingList = mrepo.findByDateAndParticipant(participant, sqlDate);
        if(meetingList.isEmpty()){
            if(dateEndTime.isBefore(dateStartTime) || modifiedCurrentDate.isBefore(dateStartTime) || modifiedCurrentDate.isBefore(dateEndTime)){
                model.addAttribute("error","End time cannot be before Start Time");
                return "bookMeeting";
            }
            mrepo.save(meeting);
            model.addAttribute("info","meeting added successfully");
            return "homepage";
        }
        else{
            //To check if the dates are closhing with the previous date and time of the participant
            for (int i = 0 ; i < meetingList.size(); i++){
                String[] demoList = meetingList.get(i).toString().split(",");
                String dbStartDate = demoList[4].split("=")[1].replace("T"," ");
                String dbEndDate = demoList[5].split("=")[1].replace("T"," ");
                LocalDateTime modifiedDbStartDate = LocalDateTime.parse(dbStartDate, formatter);
                LocalDateTime modifiedDbEndDate = LocalDateTime.parse(dbEndDate, formatter);
                if((dateStartTime.isAfter(modifiedDbStartDate) && dateStartTime.isBefore(modifiedDbEndDate)) ||
                        (dateEndTime.isAfter(modifiedDbStartDate) && dateEndTime.isBefore(modifiedDbEndDate)) ||
                        dateStartTime.isEqual(modifiedDbStartDate) || dateEndTime.isEqual(modifiedDbEndDate) ||
                        (dateStartTime.isEqual(modifiedDbStartDate) && dateEndTime.isEqual(modifiedDbEndDate))){
                    count++;
                }
            }
        }
        if(count==0){
            if(dateEndTime.isBefore(dateStartTime) || modifiedCurrentDate.isBefore(dateStartTime) || modifiedCurrentDate.isBefore(dateEndTime)){
                model.addAttribute("error","End time cannot be before Start Time");
                return "bookMeeting";
            }
            mrepo.save(meeting);
            model.addAttribute("info","Meeting scheduled successfully.");
            return "homepage";
        }
        model.addAttribute("error","Participant is not available at the requested time slot. Please see below the schedule of the participant for the selected day.");
        model.addAttribute("meetinglist", meetingList);
        return "bookMeeting";
    }
}
