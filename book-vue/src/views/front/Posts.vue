<template>
  <div class="main-content" style="width: 60%">
    <div style="display: flex">
      <div @click="loadSectionPosts(null)" class="card" :class="{ 'section-active' :  data.activeSectionId === null }" style="padding: 10px 20px; margin-right: 10px; cursor: pointer">全部版块</div>
      <div @click="loadSectionPosts(item.id)" class="card" :class="{ 'section-active' :  data.activeSectionId === item.id }" style="padding: 10px 20px; margin-right: 10px; cursor: pointer" v-for="item in data.sectionList" :key="item.id">{{ item.name }}</div>
    </div>

    <div style="margin: 15px 0">
      <div class="card" style="padding: 20px; margin-bottom: 10px" v-for="(item, index) in data.tableData" :key="item.id">
        <div style="font-size: 20px; margin-bottom: 10px" class="title" @click="goPage('/front/postsDetail?id=' + item.id)">
          <img src="@/assets/imgs/热门.png" alt="" style="width: 20px; position: relative; top: 2px" v-if="index < 3">
          {{ item.title }}
        </div>
        <div>
          <el-tag style="margin-right: 5px;" type="primary" v-for="tag in JSON.parse(item.tags)" :key="tag">{{ tag }}</el-tag>
        </div>
        <div style="display: flex; align-items: center; grid-gap: 20px">
          <div class="line2" style="flex: 1; color: #666">
            <div v-html="item.simpleContent"></div>
          </div>
          <img :src="item.img" alt="" style="width: 100px; height: 70px">
        </div>
        <div style="color: #666">
          <span style="margin-right: 20px">学号：<span style="color: #333">{{ item.userName }}</span></span>
          <span style="margin-right: 20px">发布时间： <span style="color: #333">{{ item.time }}</span> </span>
          <span>阅读量： <span style="color: #333">{{ item.readCount }}</span></span>
        </div>


      </div>
    </div>

    <div v-if="data.total" style="margin: 15px 0">
      <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
    </div>

  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";

const data = reactive({
  sectionList: [],
  activeSectionId: null,
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
})

const goPage = (path) => {
  location.href = path
}

request.get('/postsSection/selectAll').then(res => {
  data.sectionList = res.data
})

const loadSectionPosts = (postsId) => {
  data.activeSectionId = postsId
  load()
}

const load = () => {
  request.get('/posts/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      sectionId: data.activeSectionId
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || []
      data.total = res.data?.total
    }
  })
}
load()
</script>

<style scoped>
.section-active {
  background-color: #1890ff;
  color: white;
}
</style>