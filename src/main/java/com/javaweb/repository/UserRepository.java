package com.javaweb.repository;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long> , UserRepositoryCustom {
    UserEntity findOneByUsernameAndStatus(String name, int status);
    Page<UserEntity> findByUsernameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String username, String fullName, int status,
                                                                                                  Pageable pageable);
    List<UserEntity> findByStatusAndRole(Integer status, String roleCode);
    Page<UserEntity> findByStatusNot(int status, Pageable pageable);
    long countByUsernameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String username, String fullName, int status);
    long countByStatusNot(int status);
    UserEntity findOneByUsername(String username);
}
