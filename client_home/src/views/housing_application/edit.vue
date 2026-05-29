<template>
	<div class="diy_edit page_housing_application" id="housing_application_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','house_no') || $check_field('add','house_no') || $check_field('get','house_no')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋编号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_house_no" v-model="form['house_no']" placeholder="请输入房屋编号" v-if="(form['house_no'] && $check_field('set','house_no')) || (!form['house_no'] && $check_field('add','house_no'))"  :disabled="disabledObj['house_no_isDisabled']"/>
							<span v-else-if="$check_field('get','house_no')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','house_name') || $check_field('add','house_name') || $check_field('get','house_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								房屋名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_house_name" v-model="form['house_name']" placeholder="请输入房屋名称" v-if="(form['house_name'] && $check_field('set','house_name')) || (!form['house_name'] && $check_field('add','house_name'))"  :disabled="disabledObj['house_name_isDisabled']"/>
							<span v-else-if="$check_field('get','house_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','deposit') || $check_field('add','deposit') || $check_field('get','deposit')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								押金:
							</span>
						</div>
								<!-- 数字 -->
						<div class="diy_field diy_number">
							<input type="number" id="form_deposit" v-model.number="form['deposit']" placeholder="请输入押金" v-if="(form['deposit'] && $check_field('set','deposit')) || (!form['deposit'] && $check_field('add','deposit'))" :disabled="disabledObj['deposit_isDisabled']" />
							<span v-else-if="$check_field('get','deposit')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','rent') || $check_field('add','rent') || $check_field('get','rent')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								租金:
							</span>
						</div>
								<!-- 数字 -->
						<div class="diy_field diy_number">
							<input type="number" id="form_rent" v-model.number="form['rent']" placeholder="请输入租金" v-if="(form['rent'] && $check_field('set','rent')) || (!form['rent'] && $check_field('add','rent'))" :disabled="disabledObj['rent_isDisabled']" />
							<span v-else-if="$check_field('get','rent')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','hall') || $check_field('add','hall') || $check_field('get','hall')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								厅室:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_hall" v-model="form['hall']" placeholder="请输入厅室" v-if="(form['hall'] && $check_field('set','hall')) || (!form['hall'] && $check_field('add','hall'))"  :disabled="disabledObj['hall_isDisabled']"/>
							<span v-else-if="$check_field('get','hall')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','detailed_address') || $check_field('add','detailed_address') || $check_field('get','detailed_address')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								详细地址:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_detailed_address" v-model="form['detailed_address']" placeholder="请输入详细地址" v-if="(form['detailed_address'] && $check_field('set','detailed_address')) || (!form['detailed_address'] && $check_field('add','detailed_address'))"  :disabled="disabledObj['detailed_address_isDisabled']"/>
							<span v-else-if="$check_field('get','detailed_address')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','rental_user') || $check_field('add','rental_user') || $check_field('get','rental_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								出租用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_rental_user" :disabled="disabledObj['rental_user_isDisabled']" v-model="form['rental_user']" v-if="(form['rental_user'] && $check_field('set','rental_user')) || (!form['rental_user'] && $check_field('add','rental_user'))" >
								<option v-for="o in list_user_rental_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','rental_user')">{{ form['rental_user'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','lessors_name') || $check_field('add','lessors_name') || $check_field('get','lessors_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								出租人名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_lessors_name" v-model="form['lessors_name']" placeholder="请输入出租人名" v-if="(form['lessors_name'] && $check_field('set','lessors_name')) || (!form['lessors_name'] && $check_field('add','lessors_name'))"  :disabled="disabledObj['lessors_name_isDisabled']"/>
							<span v-else-if="$check_field('get','lessors_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','tenant_user') || $check_field('add','tenant_user') || $check_field('get','tenant_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								租客用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_tenant_user" :disabled="disabledObj['tenant_user_isDisabled']" v-model="form['tenant_user']" v-if="(form['tenant_user'] && $check_field('set','tenant_user')) || (!form['tenant_user'] && $check_field('add','tenant_user'))" >
								<option v-for="o in list_user_tenant_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','tenant_user')">{{ form['tenant_user'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','remarks') || $check_field('add','remarks') || $check_field('get','remarks')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								看房备注:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_remarks" v-model="form['remarks']" placeholder="请输入看房备注" v-if="(form['remarks'] && $check_field('set','remarks')) || (!form['remarks'] && $check_field('add','remarks'))"  :disabled="disabledObj['remarks_isDisabled']"/>
							<span v-else-if="$check_field('get','remarks')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','date_of_viewing') || $check_field('add','date_of_viewing') || $check_field('get','date_of_viewing')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								看房日期:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['date_of_viewing_isDisabled']" id="form_date_of_viewing" v-model="form['date_of_viewing']" placeholder="请输入看房日期" v-if="(form['date_of_viewing'] && $check_field('set','date_of_viewing')) || (!form['date_of_viewing'] && $check_field('add','date_of_viewing'))" />
							<span v-else-if="$check_field('get','date_of_viewing')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
	


					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/housing_application/edit','examine')">
							<!--<span> {{ form['examine_state'] }} </span>-->
							<select v-model="form['examine_state']">
								<option value="未审核">
									未审核
								</option>
								<option value="已通过">
									已通过
								</option>
								<option value="未通过">
									未通过
								</option>
							</select>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_state'] }}
							</span>
						</div>
					</div>
					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核回复:
							</span>
						</div>
						<div class="diy_field diy_desc" v-if="$check_action('/housing_application/edit','examine')">
							<textarea v-model="form['examine_reply']"></textarea>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_reply'] }}
							</span>
						</div>
					</div>


				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
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
		components: {},
		data() {
			return {
				url_get_obj: "~/api/housing_application/get_obj?",
				url_add: "~/api/housing_application/add?",
				url_set: "~/api/housing_application/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"house_no": "",
							"house_name": "",
							"deposit": 0,
							"rent": 0,
							"hall": "",
							"detailed_address": "",
							"rental_user": 0,
							"lessors_name": "",
							"tenant_user": 0,
							"remarks": "",
							"date_of_viewing": "",
						"housing_application_id": 0,
				},

				obj: {
						"house_no":  '', // 房屋编号
							"house_name":  '', // 房屋名称
							"deposit":  0, // 押金
							"rent":  0, // 租金
							"hall":  '', // 厅室
							"detailed_address":  '', // 详细地址
							"rental_user": 0, // 出租用户
							"lessors_name":  '', // 出租人名
							"tenant_user": 0, // 租客用户
							"remarks":  '', // 看房备注
							"date_of_viewing": new Date().getTime(),
						"examine_state": "未审核",
					"examine_reply": "",
					"housing_application_id": 0,
				},

				// 表单字段
				form: {
						"house_no":  '', // 房屋编号
							"house_name":  '', // 房屋名称
							"deposit":  0, // 押金
							"rent":  0, // 租金
							"hall":  '', // 厅室
							"detailed_address":  '', // 详细地址
							"rental_user": 0, // 出租用户
							"lessors_name":  '', // 出租人名
							"tenant_user": 0, // 租客用户
							"remarks":  '', // 看房备注
							"date_of_viewing": new Date().getTime(),
						"examine_state": "未审核",
					"examine_reply": "",
					"housing_application_id": 0,
				},
				disabledObj:{
						"house_no_isDisabled": false,
							"house_name_isDisabled": false,
											"hall_isDisabled": false,
							"detailed_address_isDisabled": false,
							"rental_user_isDisabled": false,
							"lessors_name_isDisabled": false,
							"tenant_user_isDisabled": false,
							"remarks_isDisabled": false,
							"date_of_viewing_isDisabled": false,
					},

																		// 用户列表
				list_user_rental_user: [],
									// 用户列表
				list_user_tenant_user: [],
					
				// ID字段
				field: "housing_application_id",

			}
		},
		methods: {
			
				
				
				
				
				
						/**
			 * 获取出租用户用户列表
			 */
			async get_list_user_rental_user() {
				// if(this.user_group !== "管理员" && this.form["rental_user"] === 0) {
				//     this.form["rental_user"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=出租用户");
				if(json.result && json.result.list){
					this.list_user_rental_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
		
				
						/**
			 * 获取承租用户用户列表
			 */
			async get_list_user_tenant_user() {
				// if(this.user_group !== "管理员" && this.form["tenant_user"] === 0) {
				//     this.form["tenant_user"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=承租用户");
				if(json.result && json.result.list){
					this.list_user_tenant_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					async get_user_session_tenant_user(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=承租用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["tenant_user"] = user_id
								_this.disabledObj['tenant_user' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "tenant_user") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/housing_application/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }
																						        if (JSON.stringify(this.form["date_of_viewing"]).indexOf("-")===-1) {
          this.form["date_of_viewing"] = this.$toTime(parseInt(this.form["date_of_viewing"]), "yyyy-MM-dd")
        }
	
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }

				if(func){
					func(json);
				}
			},

		},
		created() {
																								this.get_list_user_rental_user();
									this.get_user_session_tenant_user();
					this.get_list_user_tenant_user();
									},
	}
</script>

<style>




</style>
