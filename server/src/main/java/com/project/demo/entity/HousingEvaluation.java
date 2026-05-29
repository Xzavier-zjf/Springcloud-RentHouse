package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 房屋评价：(HousingEvaluation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "HousingEvaluation")
public class HousingEvaluation implements Serializable {

    // HousingEvaluation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "housing_evaluation_id")
    private Integer housing_evaluation_id;

    // 合同号
    @Basic
    private String contract_no;
    // 房屋名称
    @Basic
    private String house_name;
    // 押金
    @Basic
    private Integer deposit;
    // 租金
    @Basic
    private Integer rent;
    // 厅室
    @Basic
    private String hall;
    // 详细地址
    @Basic
    private String detailed_address;
    // 出租用户
    @Basic
    private Integer rental_user;
    // 出租人名
    @Basic
    private String lessors_name;
    // 租客用户
    @Basic
    private Integer tenant_user;
    // 评价等级
    @Basic
    private String evaluation_grade;
    // 评价内容
    @Basic
    private String evaluation_content;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
