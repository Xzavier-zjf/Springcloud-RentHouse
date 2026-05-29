package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 租赁申请：(LeaseApplication)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "LeaseApplication")
public class LeaseApplication implements Serializable {

    // LeaseApplication编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lease_application_id")
    private Integer lease_application_id;

    // 房屋编号
    @Basic
    private String house_no;
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
    // 租赁申请
    @Basic
    private String lease_application;



    // 审核状态
    @Basic
    private String examine_state;








    // 审核回复
    @Basic
    private String examine_reply;



    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
