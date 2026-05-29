<template>
	<div class="diy_home diy_list diy_contract_information" id="diy_contract_information_list">
		<!-- 列表 -->
		<div class="diy_view_list list list-x" v-if="show">
			<router-link class="diy_card goods diy_list_box_wrap" v-for="(o, i) in list" :key="i"
				:to="'/contract_information/details?contract_information_id=' + o['contract_information_id']">
				<!-- 图片 -->
				<div class="diy_list_img_box" v-if="imgList.length" >
					<div class="diy_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/contract_information/details') && +item.is_img_list">
						<div class="diy_title diy_list_img_title">
							<span>{{item.title}}:</span>
						</div>
						<div class="diy_field diy_img">
							<img :src="$fullUrl(o[item.name])" style="width:100%;height:100%" />
						</div>
					</div>
				</div>
				<!-- 内容 -->
				<div class="diy_list_item_box">
					<div class="diy_list_item_content" v-for="(item,index) in showItemList" :key="item+index">
						<div class="diy_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/contract_information/details') && +item.is_img_list">
							<div class="diy_title">
								<span>{{item.title}}:</span>
							</div>
							<div class="diy_field diy_text">
								<span v-if="item.type == 'UID'" v-text="get_user_name(item.name,o[item.name])"></span>
								<span v-else-if="item.type == '日期'" v-text="$toTime(o[item.name],'yyyy-MM-dd')"></span>
								<span v-else-if="item.type == '时间'" v-text="$toTime(o[item.name],'hh:mm:ss')"></span>
								<span v-else-if="item.type == '日长'" v-text="$toTime(o[item.name],'yyyy-MM-dd hh:mm:ss')"></span>
								<span v-else v-text="o[item.name]"></span>
							</div>
						</div>
					</div>
				</div>
			</router-link>
		</div>
		<!-- 表格 -->
		<div class="diy_view_table" v-else>
			<table class="diy_table">
				<tr class="diy_row">
						<th class="diy_title" v-if="$check_field('get','contract_no')">
						合同号
					</th>
							<th class="diy_title" v-if="$check_field('get','house_name')">
						房屋名称
					</th>
							<th class="diy_title" v-if="$check_field('get','deposit')">
						押金
					</th>
							<th class="diy_title" v-if="$check_field('get','rent')">
						租金
					</th>
							<th class="diy_title" v-if="$check_field('get','hall')">
						厅室
					</th>
							<th class="diy_title" v-if="$check_field('get','detailed_address')">
						详细地址
					</th>
							<th class="diy_title" v-if="$check_field('get','rental_user')">
						出租用户
					</th>
							<th class="diy_title" v-if="$check_field('get','lessors_name')">
						出租人名
					</th>
							<th class="diy_title" v-if="$check_field('get','tenant_user')">
						租客用户
					</th>
							<th class="diy_title" v-if="$check_field('get','lease_time')">
						租赁时间
					</th>
							</tr>
				<tr class="diy_row" v-for="(o,i) in list" :key="o+i">
						<td class="diy_field diy_text" v-if="$check_field('get','contract_no')">
						<span>
							{{ o["contract_no"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','house_name')">
						<span>
							{{ o["house_name"] }}
						</span>
					</td>
							<td class="diy_field diy_number" v-if="$check_field('get','deposit')">
						<span>
							{{ o["deposit"] }}
						</span>
					</td>
							<td class="diy_field diy_number" v-if="$check_field('get','rent')">
						<span>
							{{ o["rent"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','hall')">
						<span>
							{{ o["hall"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','detailed_address')">
						<span>
							{{ o["detailed_address"] }}
						</span>
					</td>
							<td class="diy_field diy_uid" v-if="$check_field('get','rental_user')">
						<span>
							{{ get_user_name('rental_user',o['rental_user']) }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','lessors_name')">
						<span>
							{{ o["lessors_name"] }}
						</span>
					</td>
							<td class="diy_field diy_uid" v-if="$check_field('get','tenant_user')">
						<span>
							{{ get_user_name('tenant_user',o['tenant_user']) }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','lease_time')">
						<span>
							{{ o["lease_time"] }}
						</span>
					</td>
							</tr>
			</table>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: function() {
					return [];
				},
			},
			show: {
				type: Boolean,
				default: function(){
					return true;
				}
			}
		},
		data() {
			return {
						imgList: [
						],
						itemList: [
								{
									title: "合同号",
									name: "contract_no",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "房屋名称",
									name: "house_name",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "押金",
									name: "deposit",
									type: "数字",
									is_img_list: "0"
								},
								{
									title: "租金",
									name: "rent",
									type: "数字",
									is_img_list: "0"
								},
								{
									title: "厅室",
									name: "hall",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "详细地址",
									name: "detailed_address",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "出租用户",
									name: "rental_user",
									type: "UID",
									is_img_list: "0"
								},
								{
									title: "出租人名",
									name: "lessors_name",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "租客用户",
									name: "tenant_user",
									type: "UID",
									is_img_list: "0"
								},
								{
									title: "租赁时间",
									name: "lease_time",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "合同文件",
									name: "contract_documents",
									type: "文件",
									is_img_list: "0"
								},
						],
						richList: [
						],
											// 用户列表
				list_user_rental_user: [],
							// 用户列表
				list_user_tenant_user: [],
						};
		},
		methods: {
			get_user_name(name,id){
				var obj = null;
											if (name == 'rental_user'){
					obj = this.list_user_rental_user.getObj({"user_id":id});
				}
							if (name == 'tenant_user'){
					obj = this.list_user_tenant_user.getObj({"user_id":id});
				}
							var ret = "";
				if(obj){
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
										/**
			 * 获取出租用户用户列表
			 */
			async get_list_user_rental_user() {
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
				var json = await this.$get("~/api/user/get_list?user_group=承租用户");
				if(json.result && json.result.list){
					this.list_user_tenant_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					},
		created() {
										this.get_list_user_rental_user();
						this.get_list_user_tenant_user();
					},
		computed:{
			showItemList(){
				let arr = [];
				let _type = ["视频","音频","文件"];
				this.itemList.forEach(item => {
					if(_type.indexOf(item.type) === -1 && !!+item.is_img_list){
						arr.push(item)
					}
				})
				return arr.slice(0,4);
			}
		}
	};
</script>

<style scoped>
	.diy_view_list {
		display: flex;
		flex-wrap: wrap;
		align-items: stretch;
	}

	.diy_list_box_wrap {
		text-decoration: none;
		color: inherit;
	}

	.diy_list_img_box {
		width: 100%;
	}

	.diy_list_img_box .diy_row {
		display: block;
	}

	.diy_list_img_title {
		display: none;
	}

	.diy_img {
		width: 100%;
		height: 210px;
		overflow: hidden;
		border-radius: 0.5rem;
		background: #f4f6fb;
	}

	.diy_img img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		display: block;
	}

	.diy_list_item_box {
		width: 100%;
		padding-top: 0.75rem;
	}

	.diy_list_item_content {
		width: 100%;
	}

	.diy_row {
		display: flex;
		align-items: baseline;
		gap: 0.35rem;
		margin-bottom: 0.45rem;
	}

	.diy_title {
		flex: 0 0 auto;
		font-weight: 700;
		color: #333;
	}

	.diy_field {
		flex: 1;
		min-width: 0;
		color: #555;
	}

	.diy_field span {
		display: block;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}

	.goods {
		display: flex;
		width: calc(25% - 1rem);
		margin: 0.5rem;
		padding: 0.85rem;
		flex-direction: column;
		justify-content: flex-start;
		background-color: #fff;
		border-radius: 0.5rem;
		box-sizing: border-box;
		border: 1px solid #edf0f5;
	}

	.goods:hover {
		border-color: #909399;
		box-shadow: 0 0.1rem 0.3rem rgba(0, 0, 0, 0.15);
	}

	.goods:hover img {
		filter: blur(1px);
	}

	@media (max-width: 992px) {
		.goods {
			width: calc(33.333% - 1rem);
		}
	}

	@media (max-width: 768px) {
		.goods {
			width: calc(50% - 1rem);
		}
	}
</style>

