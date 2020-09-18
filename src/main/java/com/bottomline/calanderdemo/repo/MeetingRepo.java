package com.bottomline.calanderdemo.repo;

import com.bottomline.calanderdemo.model.Meeting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

public interface MeetingRepo extends JpaRepository<Meeting, Integer> {

    @Query(value = "select * from meeting where organizer = :name or participant = :name", nativeQuery = true)
    List<Meeting> find(@Param("name") String name);


    @Query(value = "select * from meeting where participant = :name or organizer = :name and dateofmeeting = :date", nativeQuery = true)
    List<Meeting> findByDateAndParticipant(@Param("name") String name, @Param("date") Date date);

    @Query("from Meeting order by dateofmeeting asc")
    List<Meeting> sortByDate();
}
