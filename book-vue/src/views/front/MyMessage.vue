<template>
  <div class="main-content">
    <div class="card" style="padding: 20px">
      <div style="margin-bottom: 15px">
        <el-input v-model="data.content" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入内容"></el-input>
        <el-button type="info" plain @click="load">查询</el-button>
        <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
      </div>
      <div style="margin-bottom: 15px">
        <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
          <!-- <el-table-column type="selection" width="55" /> -->
          <el-table-column prop="leixing" label="提醒类型"></el-table-column>
        <el-table-column prop="content" label="提醒信息" show-overflow-tooltip></el-table-column>
        <el-table-column prop="time" label="提醒时间"></el-table-column>
        <!-- <el-table-column label="评论图书">
          <template #default="scope">
            <a target="_blank" style="color: #1890ff" :href="'/front/bookDetail?id=' + scope.row.fid">{{ scope.row.bookName }}</a>
          </template>
          
        </el-table-column> -->
        </el-table>
      </div>
      <div v-if="data.total">
        <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
    </div>

  </div>
</template>

<script setup>

import {reactive} from "vue";
import request from "@/utils/request.js";
import {ElMessage, ElMessageBox} from "element-plus";


const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  formVisible: false,
  form: {},
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
  content: null,
  roomName: null,
  ids: []
})



const load = () => {
  request.get('/message/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      content: data.content

    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || []
      data.total = res.data?.total
    }
  })
}
const handleSelectionChange = (rows) => {
  data.ids = rows.map(v => v.id)
}

const reset = () => {
  data.seatNo = null
  data.content = null
  load()
}

load()
</script>