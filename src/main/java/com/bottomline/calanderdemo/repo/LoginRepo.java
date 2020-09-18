package com.bottomline.calanderdemo.repo;

import com.bottomline.calanderdemo.model.Login;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoginRepo extends JpaRepository<Login, Integer> {

}
