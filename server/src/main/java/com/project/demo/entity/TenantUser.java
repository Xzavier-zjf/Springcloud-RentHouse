package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 承租用户：(TenantUser)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "TenantUser")
public class TenantUser implements Serializable {

    // TenantUser编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tenant_user_id")
    private Integer tenant_user_id;

    // 租赁人名
    @Basic
    private String name_of_the_lessee;
    // 性别
    @Basic
    private String gender;












    // 用户编号
    @Id
    @Column(name = "user_id")
    private Integer userId;


    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
