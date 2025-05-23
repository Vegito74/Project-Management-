
package com.javaweb.api.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.exception.MyException;
import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/user")
@Slf4j
public class UserAPI {

    @Autowired
    private IUserService userService;

    @PostMapping
    public ResponseEntity<UserDTO> createUsers(@RequestBody UserDTO newUser) {
        return ResponseEntity.ok(userService.insert(newUser));
    }

    @PostMapping("/")
    public ResponseEntity<ResponseData<UserDTO>> createUser(@Valid @RequestBody UserDTO newUser) {
        log.info("Creating new user: {}", newUser.getFullName());

        UserDTO userDTO = userService.insert(newUser);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(), "User added successfully", userDTO));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> updateUsers(@PathVariable("id") Integer id, @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.update(id, userDTO));
    }
    @PutMapping("/change-password/{id}")
    public ResponseEntity<String> changePasswordUser(@PathVariable("id") Integer id, @RequestBody PasswordDTO passwordDTO) {
        try {
            userService.updatePassword(id, passwordDTO);
            return ResponseEntity.ok(SystemConstant.UPDATE_SUCCESS);
        } catch (MyException e) {
            //LOGGER.error(e.getMessage());
            return ResponseEntity.ok(e.getMessage());
        }
    }

    @PutMapping("/password/{id}/reset")
    public ResponseEntity<UserDTO> resetPassword(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(userService.resetPassword(id));
    }

    @PutMapping("/profile/{username}")
    public ResponseEntity<UserDTO> updateProfileOfUser(@PathVariable("username") String username, @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.updateProfileOfUser(username, userDTO));
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteUsers(@RequestBody Integer[] idList) {
        if (idList.length > 0) {
            userService.delete(idList);
        }
        return ResponseEntity.noContent().build();
    }
}

