<template>
	<div class="diy_details page_house_information" id="house_information_details">
		<div class='warp'>
			<div class='container'>
				<div class='row'>
					<div class='col'>
						<div class='card_house_information'>
							<div_house_information :obj="obj"></div_house_information>



						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 评论区 -->
		<div class="warp" v-if="$check_action('/comment/list', 'get')">
			<div class="container">
				<div class="row">
					<!-- 评论区 -->
					<div class="col">
						<bar_title class="mt" title="评论区"	v-if="list_comment.length"/>
						<div class="comment_box"	v-if="list_comment.length">
							<list_comment
									class="w-100"
									:list="list_comment"
									:obj="form_comment"
							/>
							<b-pagination-nav
									:base-url="$route.path"
									:number-of-pages="count_pages"
									:link-gen="link_gen"
									@change="change_page"
									first-number
									last-number
							/>
						</div>

						<!-- 发表评论 -->
						<div class="form_editor form_edit_box">
							<div class="details_form_editor_title">发表评论</div>
							<div class="fl ml-3 answer_title" v-show="form_comment.reply_to_id">
								对 <i>{{ respondent }}</i> 回复:
							</div>
							<div class="fr mr-3" v-show="form_comment.reply_to_id">
								<b-button
										variant="outline-primary reset_answer_personnel"
										size="sm"
										@click="form_comment.reply_to_id = 0"
								>重置回复人
								</b-button
								>
							</div>
							<form_editor
									class="fn"
									:form="form_comment"
									@update_comment="update_comment"
							/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import div_house_information from "@/components/diy/div_house_information.vue";
	import list_comment from "@/components/diy/list_comment.vue";
	import bar_title from "@/components/diy/bar_title.vue";
	import form_editor from "@/components/diy/form_editor.vue";
	import mixin from "@/mixins/page.js";
	export default {
		mixins:[mixin],
		components:{
			list_comment,
			bar_title,
			form_editor,
			div_house_information
		},
		data(){
			return{
				url_get_obj: "~/api/house_information/get_obj?",

				field: "house_information_id",

				obj: {
					"praise_len": 0,
				},

				query: {
						"house_no": "",
							"house_name": "",
							"cover": "",
							"house_type": "",
							"deposit": 0,
							"rent": 0,
							"hall": "",
							"detailed_address": "",
							"house_details": "",
							"rental_user": 0,
							"lessors_name": "",
						"house_information_id":0,
				},
				list_comment: [],
				form_comment: {
					source_table: "house_information",
					source_field: "house_information_id",
					source_id: 0,
					reply_to_id: 0,
				},
				count_pages: 1, // 页面数
			}
		},
		methods:{
			/**
			 * 添加访问量
			 */
			add_hits(obj) {
				obj["hits"] = obj["hits"] + 1;
				var hits = obj["hits"];
				this.$post('~/api/house_information/set?house_information_id=' + obj["house_information_id"], {
					hits
				}, (res) => {
					if(res.result){
						var body = {
							source_table: "house_information",
							source_field: "house_information_id",
							source_id: this.obj.house_information_id,
							user_id: this.$store.state.user.user_id,
						};
						this.$post("~/api/hits/add?", body, () => {});
					}
					else if(res.error){
						console.error(res.error);
					}
				});
			},
			get_obj_after(json) {
				// 判断是否获取到数据
				if (json && json.result && json.result.obj) {
					var obj = json.result.obj;
					this.obj = obj
					// 增加点击数
					this.add_hits(obj);
					this.get_comment(obj);
					this.form_comment.source_id = this.obj.house_information_id;
				}
			},
		 /****
			 * 分享点击
			 *
			 *  */
			toShare(e){
				window.open(e);
			},
			/**
			 * 分页器
			 * @param { Number } page_num 分页数
			 * @return { Object } 查询对象
			 */
			link_gen(page_num) {
				return {
					query: this.query,
				};
			},
			/**
			 *加载下一页
			 */
			change_page(page_num) {
				this.get_comment(this.obj, page_num);
				this.form_comment.reply_to_id = 0;
			},
			/**
			 * 更新评论
			 */
			update_comment() {
				this.get_comment(this.obj);
			},
			/**
			 * 获取评论
			 * @param { Object } obj 文章对象
			 * @param { Number } page 分页数
			 * @param { Number } size 评论显示条数
			 */
			get_comment(obj, page = 1, size = 5) {
				this.$get(
						"~/api/comment/get_list?",
						{
							source_table: "house_information",
							source_field: "house_information_id",
							source_id: this.obj["house_information_id"],
							page,
							size,
							reply_to_id: "0",
							orderby: "create_time desc",
						},
						(json) => {
							if (json.result) {
								var list_comment = json.result.list;
								list_comment.map((o) => {
									o.list_reply = [];
								});
								this.add_reply(list_comment).then((list) => {
									this.list_comment = list;
								});
								this.count_pages = Math.ceil(json.result.count / size) || 1
							}
						}
				);
			},
			/**
			 * @param { Array } list 评论列表
			 * 添加回复到评论列表
			 */
			add_reply(list) {
				return new Promise((resolve) => {
					for (let idx = 0; idx < list.length; idx++) {
						const obj = list[idx];
						this.$get(
								"~/api/comment/get_list?",
								{
									source_table: "house_information",
									source_field: "house_information_id",
									source_id: this.obj["house_information_id"],
									orderby: "create_time desc",
									reply_to_id: obj.comment_id,
								},
								(res) => {
									if (res.result) {
										obj.list_reply = res.result.list;
									}
								}
						);
					}
					resolve(list);
				});
			},

		},
		computed: {
			respondent() {
				var reply_to_id = this.form_comment.reply_to_id;
				var respondent = "";
				this.list_comment.map((o) => {
					if (o.comment_id === reply_to_id) {
						respondent = o.nickname;
					}
				});
				return respondent;
			},
		},

		mounted() {
		},

	}
</script>

<style>
.qecode {
  display: flex;
  align-content: center;
  width: 270px;
  background: white;
  position: absolute;
  left: 20%;
  top: 20px;
  z-index: 999;
}
.qecodeImg {
  display: flex;
  flex-direction: column;
  align-content: center;
  text-align: center;
  padding-top: 10px;
  margin: 0 auto;
}
.btn_share{
	display: inline-block;
	position: relative;
	top: 15px;
	background: rgb(240, 238, 238);
	border: 1px solid #ccc;
	height: 38px;
	margin-left: 10px;
	padding: 3px 10px;
	cursor: pointer;
	overflow: hidden;
	border-radius: 5px;
}
.btn_share_icon{
	width: 30px;
	height: 28px;
	float: left;
	margin-right: 10px;
}
.share_box{
	display: none;
	float: left;
}
.share_box img{
	width: 30px;
	height: 28px;
	margin-right: 10px;
}
.btn_share:hover .share_box{
	display: block;
}
</style>
