<template>
	<div class="diy_list page_house_information" id="house_information_list">
		<div class="warp">
			<div class="container diy_list_container">
				<div class="diy_list_title">
					<div class="col">
						<span class="title">房屋信息列表</span>
					</div>
				</div>
				<div class="row diy_list_search">
					<div class="col">
						<!-- 搜索栏 -->
						<div class="view">
							<span class="diy_list_search_title">关键字搜索：</span>
									<b-form-input size="sm" class="mr-sm-2" placeholder="房屋名称搜索" v-model="query['house_name']" />
										<b-form-input size="sm" class="mr-sm-2" placeholder="房屋类型搜索" v-model="query['house_type']" />
											<b-form-input size="sm" class="mr-sm-2" placeholder="厅室搜索" v-model="query['hall']" />
												<b-button size="sm" @click="search()" >
								<b-icon icon="search"/>
							</b-button>
						</div>
						<!-- /搜索栏 -->
					</div>
				</div>
				<div class="diy_list_select_box">
					<span class="diy_list_select_title">下拉搜索：</span>
						<div class="diy_list_dropdown_box">
						<div class="col">
							<!-- 筛选 -->
							<div class="view">
																	<b-dropdown text="房屋类型" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','house_type')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o, i) in list_house_type" :key="i" @click="filter_set(o['house_type'],'house_type')" >
												{{ o['house_type'] }}
										</b-dropdown-item>
								</b-dropdown>
																<b-dropdown text="厅室" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','hall')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o,i) in list_hall" @click="filter_set(o,'hall')" >
										{{ o }}
										</b-dropdown-item>
								</b-dropdown>
														</div>
							<!-- /筛选 -->
						</div>
					</div>
					<div class="diy_list_sort_box">
						<div class="col">
							<!-- 排序 -->
							<div class="view">
								<b-dropdown text="排序" variant="outline-dark" left>
										<b-dropdown-item v-for="(o, i) in list_sort" :key="i" @click="set_sort(o)" >
												{{ o.name }}
										</b-dropdown-item>
								</b-dropdown>
							</div>
							<!--/排序 -->
						</div>
					</div>
				</div>

				<div class="row diy_list_box">
					<div class="col">
						<!-- 列表 -->
						<list_house_information :list="list" />
						<!-- /列表 -->
					</div>
				</div>
				<div class="row diy_list_page_box">
					<div class="col overflow-auto flex_cc">
						<!-- 分页器 -->
<!--						<diy_pager v-model="query['page']" :size="query['size']" :count="count" v-on:toPage="toPage" v-on:toSize="toSize" ></diy_pager>-->
            <b-pagination
                v-model="query.page"
                :total-rows="count"
                :per-page="query.size"
                @change="goToPage"
            />
						<!-- /分页器 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import list_house_information from "@/components/diy/list_house_information.vue";
	import diy_pager from "@/components/diy/diy_pager";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			diy_pager,
			list_house_information
		},
		data() {
			return {
				url_get_list: "~/api/house_information/get_list?like=0",

				// 查询条件
				query: {
					keyword: "",
					page: 1,
					size: 10,
									"house_name": "", // 房屋名称
												"house_type": "", // 房屋类型
													"hall": "", // 厅室
												"examine_state": "已通过", // 审核状态
				},

				// 排序内容
				list_sort: [{
						name: "创建时间从高到低",
						value: "create_time desc",
					},
					{
						name: "创建时间从低到高",
						value: "create_time asc",
					},
					{
						name: "更新时间从高到低",
						value: "update_time desc",
					},
					{
						name: "更新时间从低到高",
						value: "update_time asc",
					},
							{
						name: "房屋名称正序",
						value: "house_name asc",
					},
					{
						name: "房屋名称倒序",
						value: "house_name desc",
					},
								{
						name: "房屋类型正序",
						value: "house_type asc",
					},
					{
						name: "房屋类型倒序",
						value: "house_type desc",
					},
									{
						name: "厅室正序",
						value: "hall asc",
					},
					{
						name: "厅室倒序",
						value: "hall desc",
					},
									],

											// 房屋类型列表
				"list_house_type": [""],
											// 厅室列表
				"list_hall": ['一室','两室','三室','四室','四室以上'],
										
			}
		},
		methods: {
      get_list_before(param) {
      },
			/**
			 * 筛选选择
			 */
			filter_set(o,key) {
			    if (o == "全部") {
			        this.query[key] = "";
			    } else {
			        this.query[key] = o;
			    }
			    this.search();
			},

			/**
			 * 排序
			 */
			set_sort(o) {
			    this.query.orderby = o.value;
			    this.search();
			},


							/**
			 * 获取房屋类型列表
			 */
			async get_list_house_type() {
				var json = await this.$get("~/api/house_type/get_list?");
				if (json.result) {
					this.list_house_type = json.result.list;
				} else if (json.error && json.error.message) {
					this.$toast(json.error.message, "danger");
				}
			},
								
			/**
			 * 筛选
			 */
														filter_house_type(o) {
				if (o == "全部") {
					this.query["house_type"] = "";
				} else {
					this.query["house_type"] = o;
				}
				this.search();
			},
													filter_hall(o) {
				if (o == "全部") {
					this.query["hall"] = "";
				} else {
					this.query["hall"] = o;
				}
				this.search();
			},
												/**
			 * 重置
			 */
			reset() {
								this.query.house_name = ""
											this.query.house_type = ""
												this.query.hall = ""
											this.search();
			},

			// 返回条数
			toSize(i){
				this.query.size = i;
				this.first();
			},

			// 返回页数
			toPage(i){
				this.query.page = i;
				this.first();
			},

      goToPage(v){
        this.query.page = v;
        this.goToNew(v)
      },

		},
		computed: {
		},
		created() {
										/**
			 * 获取房屋类型列表
			 */
			this.get_list_house_type();
																		}
	}
</script>

<style>
</style>
