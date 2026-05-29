<template>
	<nav class="list_article">
		<!-- 文章详情 -->
		<router-link class="article_card" v-for="(o, i) in list" :key="i"
			:to="'/article/details?' + vm.article_id + '=' + o[vm.article_id]">
			<div class="article_card_inner">
				<div class="article_media">
					<div class="article_image_box">
						<img :src="o[vm.img] ? $fullUrl(o[vm.img]) : '/img/default.png'"
							v-default-img="'/img/default.png'" />
					</div>
				</div>
				<div class="article_body">
					<div class="article_title ellipsis_2">
						{{ o[vm.title] }}
					</div>
					<div class="article_meta">
						<span class="praise">
							<b-icon icon="hand-thumbs-up"/>
							{{ o[vm.praise_len] }}
						</span>
						<span class="see">
							<b-icon icon="eye"/>
							{{ o[vm.hits] }}
						</span>
					</div>
					<div class="article_time">{{ $toTime(o[vm.create_time],"yyyy-MM-dd hh:mm:ss") }}</div>
				</div>
			</div>
		</router-link>
	</nav>
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
			vm: {
				type: Object,
				default: function() {
					return {
						img: "img",
						article_id: "article_id",
						title: "title",
						description: "description",
						title: "title",
						create_time: "create_time",
						content: "content",
						praise_len: "praise_len",
						hits: "hits",
					};
				},
			},
		},
		methods: {},
	};
</script>

<style scoped>
	.list_article {
		display: grid;
		grid-template-columns: repeat(2, minmax(0, 1fr));
		gap: 1rem;
		margin: 0 0.5rem;
		padding: 0;
		border: none;
		overflow: visible;
		background: transparent;
	}

	.article_card {
		display: block;
		background-color: #fff;
		border-radius: 0.75rem;
		box-sizing: border-box;
		border: 1px solid #edf0f5;
		text-decoration: none;
		color: inherit;
		overflow: hidden;
		transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
	}

	.article_card:hover {
		border-color: #909399;
		box-shadow: 0 0.35rem 1rem rgba(0, 0, 0, 0.12);
		transform: translateY(-2px);
	}

	.article_card:hover img {
		transform: scale(1.03);
	}

	.article_card_inner {
		width: 100%;
		display: flex;
		align-items: stretch;
		gap: 1rem;
		padding: 1rem;
		min-height: 15rem;
		box-sizing: border-box;
	}

	.article_media {
		flex: 0 0 13.5rem;
		width: 13.5rem;
		min-width: 13.5rem;
	}

	.article_image_box {
		width: 100%;
		height: 13.5rem;
		overflow: hidden;
		border-radius: 0.65rem;
		background: #f4f6fb;
	}

	.article_image_box img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		display: block;
		transition: transform 0.25s ease;
	}

	.article_body {
		display: flex;
		flex-direction: column;
		gap: 0.65rem;
		flex: 1;
		min-width: 0;
		overflow: hidden;
	}

	.article_title {
		min-height: 2.8rem;
		font-size: 1rem;
		font-weight: 700;
		line-height: 1.4;
		color: #202531;
	}

	.article_meta {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		gap: 0.9rem;
		font-size: 0.9rem;
		color: #667085;
	}

	.article_meta span {
		display: inline-flex;
		align-items: center;
		gap: 0.3rem;
	}

	.article_time {
		margin-top: auto;
		font-size: 0.85rem;
		color: #8a94a6;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.ellipsis_2 {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}

	@media (max-width: 992px) {
		.list_article {
			grid-template-columns: 1fr;
		}
	}

	@media (max-width: 768px) {
		.article_card_inner {
			flex-direction: column;
			min-height: 0;
		}

		.article_media {
			width: 100%;
			min-width: 0;
			flex-basis: auto;
		}

		.article_image_box {
			height: 12rem;
		}
	}

</style>
