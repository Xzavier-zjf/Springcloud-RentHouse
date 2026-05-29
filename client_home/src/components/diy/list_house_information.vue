<template>
	<div class="diy_home diy_list diy_house_information" id="diy_house_information_list">
		<!-- 列表 -->
		<div class="house_card_grid" v-if="show">
			<router-link class="house_card" v-for="(o, i) in list" :key="i"
				:to="'/house_information/details?house_information_id=' + o['house_information_id']">
				<!-- 图片 -->
				<div class="house_card_media" v-if="imgList.length" >
					<div class="house_card_image_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/house_information/details') && +item.is_img_list">
						<div class="house_card_image_title">
							<span>{{item.title}}:</span>
						</div>
						<div class="house_card_image">
							<img :src="$fullUrl(o[item.name])" />
						</div>
					</div>
				</div>
				<!-- 内容 -->
				<div class="house_card_body">
					<div class="house_card_content" v-for="(item,index) in showItemList" :key="item+index">
						<div class="house_card_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/house_information/details') && +item.is_img_list">
							<div class="house_card_label">
								<span>{{item.title}}:</span>
							</div>
							<div class="house_card_value">
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
						<th class="diy_title" v-if="$check_field('get','house_no')">
						房屋编号
					</th>
							<th class="diy_title" v-if="$check_field('get','house_name')">
						房屋名称
					</th>
							<th class="diy_title" v-if="$check_field('get','cover')">
						封面
					</th>
							<th class="diy_title" v-if="$check_field('get','house_type')">
						房屋类型
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
					</tr>
				<tr class="diy_row" v-for="(o,i) in list" :key="o+i">
						<td class="diy_field diy_text" v-if="$check_field('get','house_no')">
						<span>
							{{ o["house_no"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','house_name')">
						<span>
							{{ o["house_name"] }}
						</span>
					</td>
							<td class="diy_field" v-if="$check_field('get','cover')">
						<img class="diy_img" :src="o['cover']" />
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','house_type')">
						<span>
							{{ o["house_type"] }}
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
						{
							title: "封面",
							name: "cover",
							type: "图片",
							is_img_list: "1"
						},
						],
						itemList: [
								{
									title: "房屋编号",
									name: "house_no",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "房屋名称",
									name: "house_name",
									type: "文本",
									is_img_list: "1"
								},
								{
									title: "房屋类型",
									name: "house_type",
									type: "下寻",
									is_img_list: "0"
								},
								{
									title: "押金",
									name: "deposit",
									type: "数字",
									is_img_list: "1"
								},
								{
									title: "租金",
									name: "rent",
									type: "数字",
									is_img_list: "1"
								},
								{
									title: "厅室",
									name: "hall",
									type: "下拉",
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
						],
						richList: [
								{
									title: "房屋详情",
									name: "house_details",
									type: "编辑"
								},
						],
														// 用户列表
				list_user_rental_user: [],
					};
		},
		methods: {
			get_user_name(name,id){
				var obj = null;
														if (name == 'rental_user'){
					obj = this.list_user_rental_user.getObj({"user_id":id});
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
				},
		created() {
													this.get_list_user_rental_user();
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
	.house_card_grid {
		display: grid;
		grid-template-columns: repeat(2, minmax(0, 1fr));
		gap: 1rem;
		margin: 0 0.5rem;
	}

	.house_card {
		display: flex;
		align-items: stretch;
		gap: 1rem;
		min-width: 0;
		min-height: 15rem;
		padding: 1rem;
		background: #fff;
		border: 1px solid #edf0f5;
		border-radius: 0.75rem;
		box-sizing: border-box;
		color: inherit;
		text-decoration: none;
		overflow: hidden;
		transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
	}

	.house_card:hover {
		border-color: #909399;
		box-shadow: 0 0.35rem 1rem rgba(0, 0, 0, 0.12);
		transform: translateY(-2px);
	}

	.house_card:hover img {
		transform: scale(1.03);
	}

	.house_card_media {
		flex: 0 0 13.5rem;
		width: 13.5rem;
		min-width: 13.5rem;
	}

	.house_card_image_row {
		display: block;
		width: 100%;
	}

	.house_card_image_title {
		display: none;
	}

	.house_card_image {
		width: 100%;
		height: 13.5rem;
		overflow: hidden;
		border-radius: 0.65rem;
		background: #f4f6fb;
	}

	.house_card_image img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		display: block;
		transition: transform 0.25s ease;
	}

	.house_card_body {
		display: flex;
		flex: 1;
		min-width: 0;
		flex-direction: column;
		justify-content: center;
		gap: 0.65rem;
		overflow: hidden;
	}

	.house_card_content {
		min-width: 0;
	}

	.house_card_row {
		display: flex;
		align-items: baseline;
		gap: 0.5rem;
		min-width: 0;
	}

	.house_card_label {
		flex: 0 0 auto;
		font-weight: 700;
		color: #333;
		white-space: nowrap;
	}

	.house_card_value {
		flex: 1;
		min-width: 0;
		color: #555;
	}

	.house_card_value span {
		display: block;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}

	.price {
		font-size: 1rem;
		margin-right: 3px;
	}

	.price_ago {
		text-decoration: line-through;
		font-size: 0.5rem;
		color: #999;

	}

	.icon_cart {
		color: #FF5722;
		float: right;
	}

	@media (max-width: 992px) {
		.house_card_grid {
			grid-template-columns: 1fr;
		}
	}

	@media (max-width: 768px) {
		.house_card {
			flex-direction: column;
			min-height: 0;
		}

		.house_card_media {
			width: 100%;
			min-width: 0;
			flex-basis: auto;
		}

		.house_card_image {
			height: 12rem;
		}

	}
</style>

