package com.bottomline.calanderdemo.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
public class Meeting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int meetingid;
    String organizer;
    String eventname;
    String eventdesc;
    @Temporal(TemporalType.DATE)
    Date dateofmeeting;
    LocalDateTime datestarttime;
    LocalDateTime dateendtime;
    //Time starttime;

    //Time endtime;
    String participant;

    public String getParticipant() {
        return participant;
    }

    public void setParticipant(String participant) {
        this.participant = participant;
    }

    public int getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(int meetingid) {
        this.meetingid = meetingid;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public String getEventname() {
        return eventname;
    }

    public void setEventname(String eventname) {
        this.eventname = eventname;
    }

    public String getEventdesc() {
        return eventdesc;
    }

    public void setEventdesc(String eventdesc) {
        this.eventdesc = eventdesc;
    }

    public LocalDateTime getDatestarttime() {
        return datestarttime;
    }

    public void setDatestarttime(LocalDateTime datestarttime) {
        this.datestarttime = datestarttime;
    }

    public LocalDateTime getDateendtime() {
        return dateendtime;
    }

    public void setDateendtime(LocalDateTime dateendtime) {
        this.dateendtime = dateendtime;
    }

    public Date getDateofmeeting() {
        return dateofmeeting;
    }

    public void setDateofmeeting(Date dateofmeeting) {
        this.dateofmeeting = dateofmeeting;
    }

    @Override
    public String toString() {
        return "Meeting{" +
                "meetingid=" + meetingid +
                ", organizer='" + organizer + '\'' +
                ", eventname='" + eventname + '\'' +
                ", eventdesc='" + eventdesc + '\'' +
                ", datestarttime=" + datestarttime +
                ", dateendtime=" + dateendtime +
                ", participant='" + participant + '\'' +
                '}';
    }
}
