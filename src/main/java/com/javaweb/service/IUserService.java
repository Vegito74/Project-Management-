package com.javaweb.service;

import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.exception.MyException;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IUserService {
    UserDTO findOneByUsernameAndStatus(String name, int status);
    List<UserDTO> getUsers(String searchValue, Pageable pageable);

    UserDTO insert(UserDTO userDTO);
    UserDTO update(Integer id, UserDTO userDTO);
    void updatePassword(Integer id, PasswordDTO userDTO) throws MyException;
    UserDTO resetPassword(Integer id);
    UserDTO updateProfileOfUser(String id, UserDTO userDTO);
    void delete(Integer[] ids);
//    ResponseDTO listStaff(Long buildingId);
    List<UserDTO> getAllUsers(Pageable pageable);
    int countTotalItems();
}
