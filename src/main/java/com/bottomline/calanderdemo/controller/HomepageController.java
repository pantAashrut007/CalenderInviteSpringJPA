package com.bottomline.calanderdemo.controller;

import com.bottomline.calanderdemo.model.Meeting;
import com.bottomline.calanderdemo.repo.MeetingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomepageController {

    @Autowired
    MeetingRepo mrepo;

    @GetMapping("bookMeeting")
    public String bookMeeting(){
        return "bookMeeting";
    }

    @GetMapping("allmeeting")
    public String allmeeting(){
        return "allMeetings";
    }

    @GetMapping("sortByDate")
    public String sortByDate(Model m){
        List<Meeting> list = mrepo.sortByDate();
        m.addAttribute("list",list);
        return "homepage";
    }


}
