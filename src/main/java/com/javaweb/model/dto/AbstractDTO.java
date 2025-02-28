package com.javaweb.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class AbstractDTO<T> implements Serializable {

    private static final long serialVersionUID = 7213600440729202783L;
    private Long id;
    private Date createdDate;
    private String createdBy;
    private Date modifiedDate;
    private String modifiedBy;
    private List<T> listResult = new ArrayList<>();

}
