<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="热点新闻"
				source_table="article"
			  ></list_result_search>


						  <list_result_search
				v-if="$check_action('/rental_user/list', 'get')"
				:list="result_rental_user_lessors_name"
				title="出租用户出租人名"
				source_table="rental_user"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/rental_user/list', 'get')"
				:list="result_rental_user_gender"
				title="出租用户性别"
				source_table="rental_user"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/tenant_user/list', 'get')"
				:list="result_tenant_user_name_of_the_lessee"
				title="承租用户租赁人名"
				source_table="tenant_user"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/tenant_user/list', 'get')"
				:list="result_tenant_user_gender"
				title="承租用户性别"
				source_table="tenant_user"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/house_information/list', 'get')"
				:list="result_house_information_house_name"
				title="房屋信息房屋名称"
				source_table="house_information"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/house_information/list', 'get')"
				:list="result_house_information_house_type"
				title="房屋信息房屋类型"
				source_table="house_information"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/house_information/list', 'get')"
				:list="result_house_information_hall"
				title="房屋信息厅室"
				source_table="house_information"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/housing_application/list', 'get')"
				:list="result_housing_application_house_no"
				title="看房申请房屋编号"
				source_table="housing_application"
			  ></list_result_search>
																																			  <list_result_search
				v-if="$check_action('/housing_application/list', 'get')"
				:list="result_housing_application_date_of_viewing"
				title="看房申请看房日期"
				source_table="housing_application"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/lease_application/list', 'get')"
				:list="result_lease_application_house_no"
				title="租赁申请房屋编号"
				source_table="lease_application"
			  ></list_result_search>
																																				  <list_result_search
				v-if="$check_action('/contract_information/list', 'get')"
				:list="result_contract_information_contract_no"
				title="合同信息合同号"
				source_table="contract_information"
			  ></list_result_search>
																																																									  <list_result_search
				v-if="$check_action('/payment_information/list', 'get')"
				:list="result_payment_information_payment_name"
				title="缴费信息缴费名称"
				source_table="payment_information"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/payment_information/list', 'get')"
				:list="result_payment_information_payment_date"
				title="缴费信息缴费日期"
				source_table="payment_information"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/rent_out_application/list', 'get')"
				:list="result_rent_out_application_contract_no"
				title="退租申请合同号"
				source_table="rent_out_application"
			  ></list_result_search>
																																																									  <list_result_search
				v-if="$check_action('/message_message/list', 'get')"
				:list="result_message_message_message_date"
				title="留言信息留言日期"
				source_table="message_message"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/housing_evaluation/list', 'get')"
				:list="result_housing_evaluation_contract_no"
				title="房屋评价合同号"
				source_table="housing_evaluation"
			  ></list_result_search>
																																  <list_result_search
				v-if="$check_action('/housing_evaluation/list', 'get')"
				:list="result_housing_evaluation_evaluation_grade"
				title="房屋评价评价等级"
				source_table="housing_evaluation"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/house_type/list', 'get')"
				:list="result_house_type_house_type"
				title="房屋类型房屋类型"
				source_table="house_type"
			  ></list_result_search>
						</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
						"result_rental_user_lessors_name":[],
								"result_rental_user_gender":[],
									"result_tenant_user_name_of_the_lessee":[],
								"result_tenant_user_gender":[],
												"result_house_information_house_name":[],
											"result_house_information_house_type":[],
														"result_house_information_hall":[],
																					"result_housing_application_house_no":[],
																																			"result_housing_application_date_of_viewing":[],
									"result_lease_application_house_no":[],
																																				"result_contract_information_contract_no":[],
																																																									"result_payment_information_payment_name":[],
											"result_payment_information_payment_date":[],
									"result_rent_out_application_contract_no":[],
																																																									"result_message_message_message_date":[],
									"result_housing_evaluation_contract_no":[],
																																"result_housing_evaluation_evaluation_grade":[],
												"result_house_type_house_type":[],
				};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},

				/**
	 * 获取lessors_name
	 */
	get_rental_user_lessors_name(){
		let url = "~/api/rental_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "lessors_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_rental_user_lessors_name = json.result.list;
			result_rental_user_lessors_name.map(o => o.title = o['lessors_name'])
	  			this.result_rental_user_lessors_name = result_rental_user_lessors_name
		 	}
		});
	},
						/**
	 * 获取gender
	 */
	get_rental_user_gender(){
		let url = "~/api/rental_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "gender": this.query.word }, (json) => {
		  if (json.result) {
			var result_rental_user_gender = json.result.list;
			result_rental_user_gender.map(o => o.title = o['gender'])
	  			this.result_rental_user_gender = result_rental_user_gender
		 	}
		});
	},
							/**
	 * 获取name_of_the_lessee
	 */
	get_tenant_user_name_of_the_lessee(){
		let url = "~/api/tenant_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "name_of_the_lessee": this.query.word }, (json) => {
		  if (json.result) {
			var result_tenant_user_name_of_the_lessee = json.result.list;
			result_tenant_user_name_of_the_lessee.map(o => o.title = o['name_of_the_lessee'])
	  			this.result_tenant_user_name_of_the_lessee = result_tenant_user_name_of_the_lessee
		 	}
		});
	},
						/**
	 * 获取gender
	 */
	get_tenant_user_gender(){
		let url = "~/api/tenant_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "gender": this.query.word }, (json) => {
		  if (json.result) {
			var result_tenant_user_gender = json.result.list;
			result_tenant_user_gender.map(o => o.title = o['gender'])
	  			this.result_tenant_user_gender = result_tenant_user_gender
		 	}
		});
	},
										/**
	 * 获取house_name
	 */
	get_house_information_house_name(){
		let url = "~/api/house_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_house_information_house_name = json.result.list;
			result_house_information_house_name.map(o => o.title = o['house_name'])
	  			this.result_house_information_house_name = result_house_information_house_name
		 	}
		});
	},
									/**
	 * 获取house_type
	 */
	get_house_information_house_type(){
		let url = "~/api/house_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_house_information_house_type = json.result.list;
			result_house_information_house_type.map(o => o.title = o['house_type'])
	  			this.result_house_information_house_type = result_house_information_house_type
		 	}
		});
	},
												/**
	 * 获取hall
	 */
	get_house_information_hall(){
		let url = "~/api/house_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "hall": this.query.word }, (json) => {
		  if (json.result) {
			var result_house_information_hall = json.result.list;
			result_house_information_hall.map(o => o.title = o['hall'])
	  			this.result_house_information_hall = result_house_information_hall
		 	}
		});
	},
																			/**
	 * 获取house_no
	 */
	get_housing_application_house_no(){
		let url = "~/api/housing_application/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_application_house_no = json.result.list;
			result_housing_application_house_no.map(o => o.title = o['house_no'])
	  			this.result_housing_application_house_no = result_housing_application_house_no
		 	}
		});
	},
																																	/**
	 * 获取date_of_viewing
	 */
	get_housing_application_date_of_viewing(){
		let url = "~/api/housing_application/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "date_of_viewing": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_application_date_of_viewing = json.result.list;
			result_housing_application_date_of_viewing.map(o => o.title = o['date_of_viewing'])
	  			this.result_housing_application_date_of_viewing = result_housing_application_date_of_viewing
		 	}
		});
	},
							/**
	 * 获取house_no
	 */
	get_lease_application_house_no(){
		let url = "~/api/lease_application/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "house_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_application_house_no = json.result.list;
			result_lease_application_house_no.map(o => o.title = o['house_no'])
	  			this.result_lease_application_house_no = result_lease_application_house_no
		 	}
		});
	},
																																		/**
	 * 获取contract_no
	 */
	get_contract_information_contract_no(){
		let url = "~/api/contract_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "contract_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_contract_information_contract_no = json.result.list;
			result_contract_information_contract_no.map(o => o.title = o['contract_no'])
	  			this.result_contract_information_contract_no = result_contract_information_contract_no
		 	}
		});
	},
																																																							/**
	 * 获取payment_name
	 */
	get_payment_information_payment_name(){
		let url = "~/api/payment_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "payment_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_payment_information_payment_name = json.result.list;
			result_payment_information_payment_name.map(o => o.title = o['payment_name'])
	  			this.result_payment_information_payment_name = result_payment_information_payment_name
		 	}
		});
	},
									/**
	 * 获取payment_date
	 */
	get_payment_information_payment_date(){
		let url = "~/api/payment_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "payment_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_payment_information_payment_date = json.result.list;
			result_payment_information_payment_date.map(o => o.title = o['payment_date'])
	  			this.result_payment_information_payment_date = result_payment_information_payment_date
		 	}
		});
	},
							/**
	 * 获取contract_no
	 */
	get_rent_out_application_contract_no(){
		let url = "~/api/rent_out_application/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "contract_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_rent_out_application_contract_no = json.result.list;
			result_rent_out_application_contract_no.map(o => o.title = o['contract_no'])
	  			this.result_rent_out_application_contract_no = result_rent_out_application_contract_no
		 	}
		});
	},
																																																							/**
	 * 获取message_date
	 */
	get_message_message_message_date(){
		let url = "~/api/message_message/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "message_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_message_message_message_date = json.result.list;
			result_message_message_message_date.map(o => o.title = o['message_date'])
	  			this.result_message_message_message_date = result_message_message_message_date
		 	}
		});
	},
							/**
	 * 获取contract_no
	 */
	get_housing_evaluation_contract_no(){
		let url = "~/api/housing_evaluation/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "contract_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_evaluation_contract_no = json.result.list;
			result_housing_evaluation_contract_no.map(o => o.title = o['contract_no'])
	  			this.result_housing_evaluation_contract_no = result_housing_evaluation_contract_no
		 	}
		});
	},
																														/**
	 * 获取evaluation_grade
	 */
	get_housing_evaluation_evaluation_grade(){
		let url = "~/api/housing_evaluation/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "evaluation_grade": this.query.word }, (json) => {
		  if (json.result) {
			var result_housing_evaluation_evaluation_grade = json.result.list;
			result_housing_evaluation_evaluation_grade.map(o => o.title = o['evaluation_grade'])
	  			this.result_housing_evaluation_evaluation_grade = result_housing_evaluation_evaluation_grade
		 	}
		});
	},
										/**
	 * 获取house_type
	 */
	get_house_type_house_type(){
		let url = "~/api/house_type/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "house_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_house_type_house_type = json.result.list;
			result_house_type_house_type.map(o => o.title = o['house_type'])
	  			this.result_house_type_house_type = result_house_type_house_type
		 	}
		});
	},
			
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
					this.get_rental_user_lessors_name();
							this.get_rental_user_gender();
								this.get_tenant_user_name_of_the_lessee();
							this.get_tenant_user_gender();
											this.get_house_information_house_name();
										this.get_house_information_house_type();
													this.get_house_information_hall();
																				this.get_housing_application_house_no();
																																		this.get_housing_application_date_of_viewing();
								this.get_lease_application_house_no();
																																			this.get_contract_information_contract_no();
																																																								this.get_payment_information_payment_name();
										this.get_payment_information_payment_date();
								this.get_rent_out_application_contract_no();
																																																								this.get_message_message_message_date();
								this.get_housing_evaluation_contract_no();
																															this.get_housing_evaluation_evaluation_grade();
											this.get_house_type_house_type();
			  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
				  this.get_rental_user_lessors_name();
						  this.get_rental_user_gender();
							  this.get_tenant_user_name_of_the_lessee();
						  this.get_tenant_user_gender();
										  this.get_house_information_house_name();
									  this.get_house_information_house_type();
												  this.get_house_information_hall();
																			  this.get_housing_application_house_no();
																																	  this.get_housing_application_date_of_viewing();
							  this.get_lease_application_house_no();
																																		  this.get_contract_information_contract_no();
																																																							  this.get_payment_information_payment_name();
									  this.get_payment_information_payment_date();
							  this.get_rent_out_application_contract_no();
																																																							  this.get_message_message_message_date();
							  this.get_housing_evaluation_contract_no();
																														  this.get_housing_evaluation_evaluation_grade();
										  this.get_house_type_house_type();
				},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
