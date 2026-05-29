<template>
	<div>
		<b-form-group v-if="$check_register_field('add','lessors_name','/rental_user/view')" label="出租人名">
			<b-form-input v-model="form['lessors_name']" type="text" placeholder="出租人名" trim></b-form-input>
		</b-form-group>
		<b-form-group v-if="$check_register_field('add','gender','/rental_user/view')" label="性别">
			<b-form-select v-model="form['gender']" :options="getDropList(list_gender)"></b-form-select>
		</b-form-group>
	</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		model: {
			prop: "form",
			event: "change"
		},
		props: {
			form: {
				type: Object,
				default: () => {
					return {};
				}
			}
		},
		data() {
			return {
				url_upload: "~/api/rental_user/upload?",
				list_gender: "男,女",
			};
		},
		methods: {
			getDropList(e) {
				let resultArr = [];
				if (e) {
					let arr = e.split(",");
					arr.forEach(item => {
						resultArr.push({
							value: item,
							text: item
						});
					});
				}
				return resultArr;
			},
			uploadFile(file, key = "img") {
				var _this = this;
				var form = new FormData();
				form.append("file", file[0]);
				this.$upload(this.url_upload, form, function(json) {
					if (json.result) {
						_this.$delete(_this.form, key);
						_this.$set(_this.form, key, json.result.url);
					} else {
						_this.$toast("上传失败！");
					}
				});
			},
		},
	}
</script>

<style>
</style>
