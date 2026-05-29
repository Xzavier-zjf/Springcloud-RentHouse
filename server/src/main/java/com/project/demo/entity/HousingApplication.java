package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 看房申请：(HousingApplication)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "HousingApplication")
public class HousingApplication implements Serializable {

    // HousingApplication编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "housing_application_id")
    private Integer housing_application_id;

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
    // 看房备注
    @Basic
    private String remarks;
    // 看房日期
    @Basic
    private Timestamp date_of_viewing;



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
