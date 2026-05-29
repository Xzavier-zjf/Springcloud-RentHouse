package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 留言信息：(MessageMessage)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "MessageMessage")
public class MessageMessage implements Serializable {

    // MessageMessage编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "message_message_id")
    private Integer message_message_id;

    // 房屋名称
    @Basic
    private String house_name;
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
    // 留言内容
    @Basic
    private String message_content;
    // 留言日期
    @Basic
    private Timestamp message_date;



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
