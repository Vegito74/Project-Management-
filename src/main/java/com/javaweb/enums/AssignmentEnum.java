package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum AssignmentEnum {
    BAO_CAO_TIEN_DO ("Báo cáo tiến độ"),
    THONG_BAO ("Thông báo"),
    BAI_TAP ("Bài tập"),
    TAI_LIEU_THAM_KHAO("Tài liệu tham khảo"),
    FINAL ("Final");

    private String name;

    // Constructor để khởi tạo giá trị cho "name"
    AssignmentEnum(String name) {
        this.name = name;
    }

    // Phương thức getter cho "name"
    public String getName() {
        return name;
    }
}
