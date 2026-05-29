package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 房屋信息：(HouseInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "HouseInformation")
public class HouseInformation implements Serializable {

    // HouseInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "house_information_id")
    private Integer house_information_id;

    // 房屋编号
    @Basic
    private String house_no;
    // 房屋名称
    @Basic
    private String house_name;
    // 封面
    @Basic
    private String cover;
    // 房屋类型
    @Basic
    private String house_type;
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
    // 房屋详情
    @Basic
    private String house_details;
    // 出租用户
    @Basic
    private Integer rental_user;
    // 出租人名
    @Basic
    private String lessors_name;

    // 点击数
    @Basic
    private Integer hits;

    // 点赞数
    @Basic
    private Integer praise_len;

    // 审核状态
    @Basic
    private String examine_state;











    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
