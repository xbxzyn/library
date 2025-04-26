<template>
  <div class="main-content" style="width: 60%">
    <div class="card" style="padding: 20px; margin-bottom: 20px">
      <div style="margin-bottom: 15px; font-size: 24px; font-weight: bold; text-align: center">{{ data.posts.title }}</div>
      <div style="text-align: center; color: #666; margin-bottom: 20px">
        <span style="margin-right: 20px"><el-icon size="16" style="top: 2px"><View /></el-icon>{{ data.posts.readCount }}</span>
        <span style="margin-right: 20px"><el-icon size="16" style="top: 2px"><User /></el-icon>{{ data.posts.userName }}</span>
        <span style="margin-right: 20px"><el-icon size="16" style="top: 2px"><Clock /></el-icon>{{ data.posts.time }}</span>
      </div>
      <div style="text-align: justify; line-height: 24px">
        <div v-html="data.posts.content"></div>
      </div>
    </div>

    <div class="card" style="padding: 20px">
      <Comment module="posts" :fid="data.id" />
    </div>

  </div>
</template>

<script setup>
import { reactive } from "vue";
import router from "@/router/index.js";
import request from "@/utils/request.js";
import Comment from '@/components/Comment.vue'

const data = reactive({
  id: router.currentRoute.value.query.id,
  posts: {}
})

const load = () => {
  request.get('/posts/selectById/' + data.id).then(res => {
    data.posts = res.data
  })
}

request.put('/posts/updateReadCount/' + data.id).then(res => {
  load()
})
</script>
