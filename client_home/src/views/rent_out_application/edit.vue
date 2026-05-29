<template>
  <div class="diy_edit page_rent_out_application" id="rent_out_application_edit">
    <div class="warp">
      <div class="container">
        <div class="form_title">退租申请</div>
        <div class="row diy_edit_content_box">
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>合同号:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.contract_no" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>房屋名称:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.house_name" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>押金:</span></div>
            <div class="diy_field diy_number">
              <input v-model.number="form.deposit" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>租金:</span></div>
            <div class="diy_field diy_number">
              <input v-model.number="form.rent" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>厅室:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.hall" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>详细地址:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.detailed_address" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>出租用户:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.rental_user" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>出租人名:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.lessors_name" disabled />
            </div>
          </div>
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>租客用户:</span></div>
            <div class="diy_field diy_text">
              <input v-model="form.tenant_user" disabled />
            </div>
          </div>
          <div class="form-item col-12">
            <div class="diy_title"><span>退租原因:</span></div>
            <div class="diy_field diy_desc">
              <textarea v-model="form.reasons_for_rent_cancellation" placeholder="请输入退租原因"></textarea>
            </div>
          </div>
        </div>
        <div class="diy_edit_submit_box row">
          <div class="col-12">
            <div class="btn_box">
              <button class="btn_submit" @click="submit()">提交退租申请</button>
              <button class="btn_cancel" @click="cancel()">取消</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import mixin from "@/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      url_add: "~/api/rent_out_application/add?",
      url_set: "~/api/rent_out_application/set?",
      oauth: {
        signIn: true,
        user_group: ["承租用户"],
      },
      query: {
        rent_out_application_id: 0,
      },
      field: "rent_out_application_id",
      form: {
        contract_no: "",
        house_name: "",
        deposit: 0,
        rent: 0,
        hall: "",
        detailed_address: "",
        rental_user: 0,
        lessors_name: "",
        tenant_user: 0,
        reasons_for_rent_cancellation: "",
        examine_state: "未审核",
        examine_reply: "",
        rent_out_application_id: 0,
      },
    };
  },
  methods: {
    init_after(func) {
      this.loadCachedContract();
      if (func) {
        func();
      }
    },
    loadCachedContract() {
      const cached = $.db.get("form");
      if (cached) {
        Object.keys(this.form).forEach((key) => {
          if (cached[key] !== undefined && key !== "rent_out_application_id") {
            this.form[key] = cached[key];
          }
        });
        $.db.del("form");
      }
      if (this.user && this.user.user_id) {
        this.form.tenant_user = this.user.user_id;
      }
    },
    submit_check(param) {
      if (!param.contract_no) {
        return "请先从合同记录发起退租申请";
      }
      if (!param.reasons_for_rent_cancellation) {
        return "请输入退租原因";
      }
      return null;
    },
    submit_after(json, func) {
      this.$toast("退租申请提交成功！", "success");
      if (func) {
        func(json);
      }
      this.$router.push("/user/business");
    },
  },
};
</script>

<style scoped>
.container {
  min-height: 800px;
}
.form_title {
  padding: 18px 0;
  font-size: 24px;
  font-weight: 700;
  color: #1f2933;
}
.btn_cancel {
  margin-left: 12px;
  min-width: 96px;
  height: 40px;
  border: 1px solid #d0d5dd;
  border-radius: 4px;
  background: #fff;
  color: #344054;
}
textarea {
  width: 100%;
  min-height: 120px;
}
</style>
