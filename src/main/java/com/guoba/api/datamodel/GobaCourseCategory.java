package com.guoba.api.datamodel;

import lombok.Data;

import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Data
@Entity
public class GobaCourseCategory {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long cateId;
    @ManyToOne
    @JoinColumn(name = "cate_parent_cate_id")
    private GobaCourseCategory parentCategory;
    private String cateName;
    private String cateDescription;
    private String cateStatus;
    private LocalDateTime cateLastUpdated;
    private String cateLastUpdatedBy;
    @Version
    private Integer cateVersion;

    @OneToMany(mappedBy = "parentCategory", fetch = FetchType.LAZY)
    private Set<GobaCourseCategory> children = new HashSet<>();
}
