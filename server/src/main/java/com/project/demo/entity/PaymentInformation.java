package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 缴费信息：(PaymentInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "PaymentInformation")
public class PaymentInformation implements Serializable {

    // PaymentInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_information_id")
    private Integer payment_information_id;

    // 缴费号
    @Basic
    private String payment_no;
    // 合同号
    @Basic
    private String contract_no;
    // 房屋名称
    @Basic
    private String house_name;
    // 出租用户
    @Basic
    private Integer rental_user;
    // 出租人名
    @Basic
    private String lessors_name;
    // 租客用户
    @Basic
    private Integer tenant_user;
    // 缴费名称
    @Basic
    private String payment_name;
    // 缴费金额
    @Basic
    private Integer payment_amount;
    // 缴费日期
    @Basic
    private Timestamp payment_date;




    // 支付状态
    @Basic
    private String pay_state;

    // 支付类型: 微信、支付宝、网银
    @Basic
    private String pay_type;










    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
