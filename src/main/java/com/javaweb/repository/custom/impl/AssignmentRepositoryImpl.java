package com.javaweb.repository.custom.impl;

import com.javaweb.model.response.AssignmentResponse;
import com.javaweb.repository.AssignmentRepository;
import com.javaweb.repository.custom.AssignmentRepositoryCustom;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class AssignmentRepositoryImpl implements AssignmentRepositoryCustom {

}
