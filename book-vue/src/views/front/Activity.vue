<template>
  <div class="main-content" style="width: 60%">
    <el-row :gutter="10">
     <el-col :span="8" v-for="item in data.tableData" :key="item.id">
       <div @click="goPage('/front/activityDetail?id=' + item.id)" class="card" style="margin-bottom: 10px; cursor: pointer">
         <img :src="item.img" alt="" style="width: 100%; height: 150px">
         <div style="margin: 10px 0;" class="line1">
           <el-tag type="primary" style="position: relative; bottom: 3px" v-if="item.status === '进行中'">{{ item.status }}</el-tag>
           <el-tag type="warning" style="position: relative; bottom: 3px" v-if="item.status === '未开始'">{{ item.status }}</el-tag>
           <el-tag type="danger" style="position: relative; bottom: 3px" v-if="item.status === '已结束'">{{ item.status }}</el-tag>
           <span style="font-size: 20px; margin-left: 2px" >{{ item.name }}</span>
         </div>
         <div class="line2" style="color: #666; text-align: justify; margin-bottom: 10px; height: 40px">{{ item.descr }}</div>
         <div style="color: #666"><el-icon size="16px" style="top: 2px"><Calendar /></el-icon> {{ item.start }} ~ {{ item.end }}</div>
       </div>
     </el-col>
    </el-row>
    <div style="margin: 15px 0" v-if="data.total">
      <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
    </div>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";

const data = reactive({
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
})

const goPage = (path) => {
  location.href = path
}

const load = () => {
  request.get('/activity/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
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