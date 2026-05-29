<template>
  <div class="diy_edit page_housing_evaluation" id="housing_evaluation_edit">
    <div class="warp">
      <div class="container">
        <div class="form_title">房屋评价</div>
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
          <div class="form-item col-12 col-md-6">
            <div class="diy_title"><span>评价等级:</span></div>
            <div class="diy_field diy_select">
              <select v-model="form.evaluation_grade">
                <option value="">请选择评价等级</option>
                <option value="好评">好评</option>
                <option value="中评">中评</option>
                <option value="差评">差评</option>
              </select>
            </div>
          </div>
          <div class="form-item col-12">
            <div class="diy_title"><span>评价内容:</span></div>
            <div class="diy_field diy_desc">
              <textarea v-model="form.evaluation_content" placeholder="请输入评价内容"></textarea>
            </div>
          </div>
        </div>
        <div class="diy_edit_submit_box row">
          <div class="col-12">
            <div class="btn_box">
              <button class="btn_submit" @click="submit()">提交评价</button>
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
      url_add: "~/api/housing_evaluation/add?",
      url_set: "~/api/housing_evaluation/set?",
      oauth: {
        signIn: true,
        user_group: ["承租用户"],
      },
      query: {
        housing_evaluation_id: 0,
      },
      field: "housing_evaluation_id",
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
        evaluation_grade: "",
        evaluation_content: "",
        housing_evaluation_id: 0,
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
          if (cached[key] !== undefined && key !== "housing_evaluation_id") {
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
        return "请先从合同记录发起房屋评价";
      }
      if (!param.evaluation_grade) {
        return "请选择评价等级";
      }
      if (!param.evaluation_content) {
        return "请输入评价内容";
      }
      return null;
    },
    submit_after(json, func) {
      this.$toast("评价提交成功！", "success");
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
