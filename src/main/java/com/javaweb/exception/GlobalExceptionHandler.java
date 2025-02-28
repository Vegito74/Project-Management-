package com.javaweb.exception;

import com.javaweb.model.response.ResponseData;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.validation.FieldError;
import java.util.stream.Collectors;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

@RestControllerAdvice
public class GlobalExceptionHandler {

    // Xử lý lỗi Validation (dữ liệu đầu vào không hợp lệ)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ResponseData<String>> handleValidationException(MethodArgumentNotValidException ex) {
        String errorMessage = ex.getBindingResult().getFieldErrors()
                .stream().map(FieldError::getDefaultMessage)
                .collect(Collectors.joining(", "));

        return ResponseEntity.badRequest()
                .body(new ResponseData<>(HttpStatus.BAD_REQUEST.value(), errorMessage, null));
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ResponseData<String>> handleDuplicateEntry(DataIntegrityViolationException ex) {
        Throwable rootCause = ex.getRootCause();
        String errorMessage = "Dữ liệu bị trùng!";

        if (rootCause != null && rootCause.getMessage().contains("Duplicate entry")) {
            // Lấy giá trị bị trùng
            String duplicateValue = rootCause.getMessage().split("'")[1];

            // Lấy tên trường bị lỗi (tìm khóa UNIQUE)
            Pattern pattern = Pattern.compile("for key '(.*?)'");
            Matcher matcher = pattern.matcher(rootCause.getMessage());
            String fieldName = matcher.find() ? matcher.group(1) : "unknown_field";

            errorMessage = "Giá trị '" + duplicateValue + "' đã tồn tại cho trường " + fieldName + ". Vui lòng nhập giá trị khác.";
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ResponseData<>(HttpStatus.BAD_REQUEST.value(), errorMessage, null));
    }

    // Xử lý lỗi chung
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ResponseData<String>> handleGlobalException(Exception ex) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new ResponseData<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "An unexpected error occurred", null));
    }
}

