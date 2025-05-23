package com.javaweb.model.response;

import lombok.Data;

import java.util.List;

@Data
public class ClassReportResponse {
    private Integer id;
    private String name;
    private Integer studentCount;
    private Integer taskCount;
    private Integer joinRequest;
    private Integer pendingTopic;
    private List<Integer> chartSeries;
}
