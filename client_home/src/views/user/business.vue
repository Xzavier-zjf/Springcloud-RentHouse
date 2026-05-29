<template>
  <div class="page_user" id="user_business">
    <div class="warp">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-12 col-md-3">
            <div class="card_menu">
              <list_menu_user :list_info="list_info"></list_menu_user>
            </div>
          </div>
          <div class="col-12 col-md-9">
            <div class="business_head">
              <div>
                <div class="business_title">业务中心</div>
                <div class="business_role">{{ currentUserGroup || "游客" }}</div>
              </div>
              <router-link class="business_primary" to="/house_information/list">
                去看房源
              </router-link>
            </div>

            <div v-if="steps.length" class="flow_bar">
              <div
                v-for="step in steps"
                :key="step.key"
                class="flow_step"
                :class="{ active: step.active }"
              >
                <span class="flow_dot"></span>
                <span>{{ step.title }}</span>
              </div>
            </div>

            <div v-if="modules.length" class="business_grid">
              <section class="business_card" v-for="item in modules" :key="item.key">
                <div class="business_card_top">
                  <div>
                    <div class="card_title">{{ item.title }}</div>
                    <div class="card_desc">{{ item.desc }}</div>
                  </div>
                  <div class="card_count">{{ item.count }}</div>
                </div>

                <div class="business_rows" v-if="item.list.length">
                  <div class="business_row" v-for="row in item.list" :key="row[item.id] || row.create_time">
                    <div class="row_head">
                      <span class="row_main">{{ row[item.main] || "未填写" }}</span>
                      <span
                        v-if="statusText(row, item)"
                        class="status_badge"
                        :class="statusClass(statusText(row, item))"
                      >
                        {{ statusText(row, item) }}
                      </span>
                    </div>
                    <span class="row_meta">{{ formatMeta(row, item) || "暂无补充信息" }}</span>
                    <div class="row_actions" v-if="rowActions(row, item).length">
                      <button
                        v-for="action in rowActions(row, item)"
                        :key="action.key"
                        class="row_action"
                        :class="{ outline: action.outline }"
                        @click="handleAction(action, row)"
                      >
                        {{ action.text }}
                      </button>
                    </div>
                  </div>
                </div>
                <div class="business_empty" v-else>
                  暂无相关记录
                </div>

                <router-link v-if="item.frontPath" class="card_action" :to="item.frontPath">
                  {{ item.actionText }}
                </router-link>
                <a v-else-if="item.adminPath" class="card_action" :href="adminUrl(item.adminPath)" target="_blank">
                  {{ item.actionText }}
                </a>
              </section>
            </div>

            <div v-else class="business_empty_page">
              当前身份暂无业务功能，请先登录出租用户、承租用户或管理员账号。
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import mixin from "@/mixins/page.js";
import list_menu_user from "@/components/diy/list_menu_user.vue";

const tenantSteps = [
  { key: "house", title: "找房" },
  { key: "housing_application", title: "看房申请" },
  { key: "lease_application", title: "租赁申请" },
  { key: "contract_information", title: "合同" },
  { key: "payment_information", title: "缴费" },
  { key: "after", title: "退租/评价" },
];

const landlordSteps = [
  { key: "house_information", title: "房源" },
  { key: "housing_application", title: "看房申请" },
  { key: "lease_application", title: "租赁申请" },
  { key: "contract_information", title: "合同" },
  { key: "payment_information", title: "缴费" },
  { key: "message_message", title: "留言" },
];

const moduleMap = {
  出租用户: [
    {
      key: "house_information",
      title: "我的房源",
      desc: "发布和维护出租房源",
      owner: "rental_user",
      id: "house_information_id",
      main: "house_name",
      meta: ["house_type", "rent", "examine_state"],
      status: "examine_state",
      actionText: "管理房源",
      adminPath: "house_information/table.html",
    },
    {
      key: "housing_application",
      title: "看房申请",
      desc: "处理承租用户的看房请求",
      owner: "rental_user",
      id: "housing_application_id",
      main: "house_name",
      meta: ["tenant_user", "date_of_viewing", "examine_state"],
      status: "examine_state",
      actionText: "查看申请",
      adminPath: "housing_application/table.html",
    },
    {
      key: "lease_application",
      title: "租赁申请",
      desc: "处理租赁意向与审核",
      owner: "rental_user",
      id: "lease_application_id",
      main: "house_name",
      meta: ["tenant_user", "examine_state"],
      status: "examine_state",
      actionText: "查看申请",
      adminPath: "lease_application/table.html",
    },
    {
      key: "contract_information",
      title: "合同信息",
      desc: "查看出租相关合同",
      owner: "rental_user",
      id: "contract_information_id",
      main: "contract_no",
      meta: ["house_name", "tenant_user", "lease_time"],
      actionText: "查看合同",
      adminPath: "contract_information/table.html",
    },
    {
      key: "payment_information",
      title: "缴费信息",
      desc: "查看租金和费用记录",
      owner: "rental_user",
      id: "payment_information_id",
      main: "payment_name",
      meta: ["house_name", "payment_amount", "payment_date", "pay_state"],
      status: "pay_state",
      actionText: "查看缴费",
      adminPath: "payment_information/table.html",
    },
    {
      key: "message_message",
      title: "留言信息",
      desc: "查看房源留言",
      owner: "rental_user",
      id: "message_message_id",
      main: "house_name",
      meta: ["tenant_user", "message_date"],
      actionText: "查看留言",
      adminPath: "message_message/table.html",
    },
  ],
  承租用户: [
    {
      key: "housing_application",
      title: "我的看房申请",
      desc: "跟进已提交的看房申请",
      owner: "tenant_user",
      id: "housing_application_id",
      main: "house_name",
      meta: ["lessors_name", "date_of_viewing", "examine_state"],
      status: "examine_state",
      actionText: "继续找房",
      frontPath: "/house_information/list",
    },
    {
      key: "lease_application",
      title: "我的租赁申请",
      desc: "查看租赁申请状态",
      owner: "tenant_user",
      id: "lease_application_id",
      main: "house_name",
      meta: ["lessors_name", "examine_state"],
      status: "examine_state",
      actionText: "继续找房",
      frontPath: "/house_information/list",
    },
    {
      key: "contract_information",
      title: "我的合同",
      desc: "合同生成后可发起缴费、退租和评价",
      owner: "tenant_user",
      id: "contract_information_id",
      main: "contract_no",
      meta: ["house_name", "lessors_name", "lease_time"],
      actionText: "查看全部合同",
      adminPath: "contract_information/table.html",
    },
    {
      key: "payment_information",
      title: "我的缴费",
      desc: "模拟支付租金和相关费用",
      owner: "tenant_user",
      id: "payment_information_id",
      main: "payment_name",
      meta: ["house_name", "payment_amount", "payment_date", "pay_state"],
      status: "pay_state",
      actionText: "查看全部缴费",
      adminPath: "payment_information/table.html",
    },
    {
      key: "rent_out_application",
      title: "我的退租申请",
      desc: "查看退租进度",
      owner: "tenant_user",
      id: "rent_out_application_id",
      main: "house_name",
      meta: ["contract_no", "lessors_name", "examine_state"],
      status: "examine_state",
      actionText: "查看退租",
      adminPath: "rent_out_application/table.html",
    },
    {
      key: "housing_evaluation",
      title: "我的房屋评价",
      desc: "查看评价记录",
      owner: "tenant_user",
      id: "housing_evaluation_id",
      main: "house_name",
      meta: ["contract_no", "evaluation_grade", "lessors_name"],
      actionText: "查看评价",
      adminPath: "housing_evaluation/table.html",
    },
  ],
  管理员: [
    {
      key: "house_information",
      title: "房屋信息",
      desc: "管理平台房源",
      id: "house_information_id",
      main: "house_name",
      meta: ["house_type", "rent", "examine_state"],
      status: "examine_state",
      actionText: "进入管理",
      adminPath: "house_information/table.html",
    },
    {
      key: "housing_application",
      title: "看房申请",
      desc: "管理所有看房申请",
      id: "housing_application_id",
      main: "house_name",
      meta: ["rental_user", "tenant_user", "examine_state"],
      status: "examine_state",
      actionText: "进入管理",
      adminPath: "housing_application/table.html",
    },
    {
      key: "lease_application",
      title: "租赁申请",
      desc: "管理所有租赁申请",
      id: "lease_application_id",
      main: "house_name",
      meta: ["rental_user", "tenant_user", "examine_state"],
      status: "examine_state",
      actionText: "进入管理",
      adminPath: "lease_application/table.html",
    },
    {
      key: "contract_information",
      title: "合同信息",
      desc: "管理合同档案",
      id: "contract_information_id",
      main: "contract_no",
      meta: ["house_name", "rental_user", "tenant_user"],
      actionText: "进入管理",
      adminPath: "contract_information/table.html",
    },
    {
      key: "payment_information",
      title: "缴费信息",
      desc: "管理缴费记录",
      id: "payment_information_id",
      main: "payment_name",
      meta: ["house_name", "payment_amount", "payment_date", "pay_state"],
      status: "pay_state",
      actionText: "进入管理",
      adminPath: "payment_information/table.html",
    },
  ],
};

export default {
  mixins: [mixin],
  components: {
    list_menu_user,
  },
  data() {
    return {
      list_info: [
        {
          title: "个人资料",
          url: "/user/info",
          icon: "house-fill",
          selected: false,
        },
        {
          title: "密码修改",
          url: "/user/password",
          icon: "person-fill",
          selected: false,
        },
        {
          title: "收藏",
          url: "/user/collect",
          icon: "heart-fill",
          selected: false,
        },
      ],
      modules: [],
      contractNumbers: [],
      rentOutContractMap: {},
      evaluationContractMap: {},
    };
  },
  computed: {
    currentUserGroup() {
      return (this.user && this.user.user_group) || "";
    },
    steps() {
      const group = this.currentUserGroup;
      if (group === "承租用户") {
        return tenantSteps.map((step) => ({
          ...step,
          active: step.key === "house" || this.hasStepData(step.key),
        }));
      }
      if (group === "出租用户") {
        return landlordSteps.map((step) => ({
          ...step,
          active: this.hasStepData(step.key),
        }));
      }
      return [];
    },
  },
  methods: {
    init_after(func) {
      this.loadModules();
      if (func) {
        func();
      }
    },
    loadModules() {
      const group = this.currentUserGroup;
      const userId = this.user && this.user.user_id;
      const configs = moduleMap[group] || [];
      this.contractNumbers = [];
      this.rentOutContractMap = {};
      this.evaluationContractMap = {};
      this.modules = configs.map((item) => ({
        ...item,
        count: 0,
        list: [],
      }));
      this.modules.forEach((item, index) => {
        const params = {
          page: 1,
          size: 5,
          orderby: "create_time desc",
        };
        if (item.owner && userId) {
          params[item.owner] = userId;
        }
        this.$get(`~/api/${item.key}/get_list?`, params, (json) => {
          if (json.result) {
            const list = json.result.list || [];
            this.$set(this.modules, index, {
              ...this.modules[index],
              count: json.result.count || 0,
              list,
            });
            this.cacheContractState(item.key, list);
          }
        });
      });
    },
    cacheContractState(key, list) {
      if (key === "contract_information") {
        this.contractNumbers = list.map((row) => row.contract_no).filter(Boolean);
      }
      if (key === "rent_out_application") {
        const map = {};
        list.forEach((row) => {
          if (row.contract_no) {
            map[row.contract_no] = true;
          }
        });
        this.rentOutContractMap = map;
      }
      if (key === "housing_evaluation") {
        const map = {};
        list.forEach((row) => {
          if (row.contract_no) {
            map[row.contract_no] = true;
          }
        });
        this.evaluationContractMap = map;
      }
    },
    hasStepData(key) {
      if (key === "after") {
        return this.hasStepData("rent_out_application") || this.hasStepData("housing_evaluation");
      }
      const item = this.modules.find((moduleItem) => moduleItem.key === key);
      return item ? item.count > 0 : false;
    },
    formatMeta(row, item) {
      return item.meta
        .map((field) => this.formatField(row, field))
        .filter((value) => value !== undefined && value !== null && value !== "")
        .join(" / ");
    },
    formatField(row, field) {
      if (field === "rent" || field === "deposit" || field === "payment_amount") {
        return row[field] || row[field] === 0 ? `￥${row[field]}` : "";
      }
      if (field.indexOf("date") !== -1 && row[field]) {
        return typeof row[field] === "number" ? this.$toTime(row[field], "yyyy-MM-dd") : row[field];
      }
      return row[field];
    },
    statusText(row, item) {
      return item.status ? row[item.status] : "";
    },
    statusClass(text) {
      if (text === "已通过" || text === "已支付") {
        return "success";
      }
      if (text === "未通过" || text === "未支付") {
        return "danger";
      }
      return "warning";
    },
    rowActions(row, item) {
      const group = this.currentUserGroup;
      if (group === "承租用户" && item.key === "payment_information" && row.pay_state !== "已支付") {
        return [
          { key: "pay_wechat", text: "微信支付", type: "pay", payType: "微信" },
          { key: "pay_alipay", text: "支付宝", type: "pay", payType: "支付宝", outline: true },
          { key: "pay_bank", text: "网银", type: "pay", payType: "网银", outline: true },
        ];
      }
      if (group === "承租用户" && item.key === "contract_information") {
        const actions = [];
        if (!this.rentOutContractMap[row.contract_no]) {
          actions.push({ key: "rent_out", text: "申请退租", type: "rent_out" });
        }
        if (!this.evaluationContractMap[row.contract_no]) {
          actions.push({ key: "evaluation", text: "评价房屋", type: "evaluation", outline: true });
        }
        return actions;
      }
      if ((group === "出租用户" || group === "管理员") && item.adminPath) {
        return [{ key: "admin", text: "管理", type: "admin", adminPath: item.adminPath }];
      }
      return [];
    },
    handleAction(action, row) {
      if (action.type === "pay") {
        this.pay(row, action.payType);
      } else if (action.type === "rent_out") {
        this.toBusinessForm("/rent_out_application/edit", row);
      } else if (action.type === "evaluation") {
        this.toBusinessForm("/housing_evaluation/edit", row);
      } else if (action.type === "admin") {
        window.open(this.adminUrl(action.adminPath), "_blank");
      }
    },
    pay(row, payType) {
      this.$post(
        `~/api/payment_information/set?payment_information_id=${row.payment_information_id}`,
        {
          pay_state: "已支付",
          pay_type: payType,
        },
        (res) => {
          if (res.result) {
            this.$toast("支付成功！", "success");
            this.loadModules();
          } else if (res.error) {
            this.$toast(res.error.message, "danger");
          }
        }
      );
    },
    toBusinessForm(path, row) {
      $.db.set("form", row);
      this.$router.push(path);
    },
    adminUrl(path) {
      const target = `/page/${path}`;
      const user = this.user || {};
      const personInfo = encodeURIComponent(JSON.stringify({
        user_id: user.user_id,
        username: user.username,
        nickname: user.nickname,
        user_group: user.user_group,
        avatar: user.avatar,
        token: user.token,
      }));
      const token = encodeURIComponent(user.token || $.db.get("token") || "");
      return `http://127.0.0.1:8080/bridge.html?target=${encodeURIComponent(target)}&token=${token}&personInfo=${personInfo}`;
    },
  },
};
</script>

<style scoped>
.container {
  min-height: 800px;
}
.business_head {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  padding: 18px 0 18px;
}
.business_title {
  font-size: 24px;
  font-weight: 700;
  color: #1f2933;
}
.business_role {
  margin-top: 4px;
  color: #667085;
  font-size: 14px;
}
.business_primary,
.card_action,
.row_action {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 34px;
  padding: 0 12px;
  border: 1px solid #0f766e;
  border-radius: 4px;
  background: #0f766e;
  color: #fff;
  text-decoration: none;
  cursor: pointer;
}
.business_primary:hover,
.card_action:hover,
.row_action:hover {
  color: #fff;
  background: #115e59;
}
.flow_bar {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(92px, 1fr));
  gap: 8px;
  margin-bottom: 16px;
  padding: 12px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
}
.flow_step {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #667085;
  font-size: 13px;
  white-space: nowrap;
}
.flow_dot {
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: #d0d5dd;
}
.flow_step.active {
  color: #0f766e;
  font-weight: 700;
}
.flow_step.active .flow_dot {
  background: #0f766e;
}
.business_grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 14px;
}
.business_card {
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
  padding: 16px;
}
.business_card_top {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 12px;
}
.card_title {
  font-size: 17px;
  font-weight: 700;
  color: #1f2933;
}
.card_desc {
  margin-top: 4px;
  color: #667085;
  font-size: 13px;
}
.card_count {
  min-width: 44px;
  height: 32px;
  line-height: 32px;
  border-radius: 4px;
  background: #f3f7f5;
  color: #0f766e;
  text-align: center;
  font-weight: 700;
}
.business_rows {
  margin: 14px 0;
  border-top: 1px solid #eef2f6;
}
.business_row {
  display: flex;
  flex-direction: column;
  gap: 7px;
  padding: 10px 0;
  border-bottom: 1px solid #eef2f6;
}
.row_head {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 8px;
}
.row_main {
  color: #1f2933;
  font-size: 14px;
  font-weight: 600;
  word-break: break-word;
}
.row_meta {
  color: #667085;
  font-size: 12px;
  line-height: 1.5;
}
.row_actions {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.row_action {
  min-height: 30px;
  font-size: 12px;
}
.row_action.outline {
  background: #fff;
  color: #0f766e;
}
.row_action.outline:hover {
  color: #fff;
}
.status_badge {
  flex: 0 0 auto;
  padding: 2px 8px;
  border-radius: 4px;
  font-size: 12px;
  line-height: 20px;
}
.status_badge.success {
  background: #ecfdf3;
  color: #067647;
}
.status_badge.warning {
  background: #fffaeb;
  color: #b54708;
}
.status_badge.danger {
  background: #fef3f2;
  color: #b42318;
}
.business_empty,
.business_empty_page {
  margin: 16px 0;
  color: #667085;
}
.business_empty_page {
  padding: 22px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
}
@media (max-width: 576px) {
  .business_head {
    align-items: flex-start;
    flex-direction: column;
  }
  .flow_bar {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}
</style>
