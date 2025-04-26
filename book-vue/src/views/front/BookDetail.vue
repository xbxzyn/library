<template>
  <div class="main-content" style="width: 60%">
    <div style="display: flex; grid-gap: 20px; align-items: flex-start; margin-bottom: 50px">
      <img :src="data.book.cover" alt="" style="width: 300px; height: 350px">

      <div style="flex: 1">
        <div style="font-size: 24px; font-weight: bold; color: #333; margin-bottom: 10px">{{ data.book.name }}</div>
        <el-tooltip :content="data.book.descr" effect="customized">
          <div class="line3" style="height: 60px; font-size: 14px; text-align: justify; color: #666; margin-bottom: 10px">{{ data.book.descr }}</div>
        </el-tooltip>
        <div style="padding: 15px; background-color: #eee; border-radius: 5px; margin-bottom: 10px">
          <el-row :gutter="10" style="margin-bottom: 10px">
           <el-col :span="8"><span style="color: #666">作者：</span>{{ data.book.author }}</el-col>
           <el-col :span="9"><span style="color: #666">出版社：</span>{{ data.book.publisher }}</el-col>
           <el-col :span="7"><span style="color: #666">出版日期：</span>{{ data.book.date }}</el-col>
          </el-row>
          <el-row :gutter="10">
            <el-col :span="8"><span style="color: #666">ISBN：</span>{{ data.book.isbn }}</el-col>
            <el-col :span="9"><span style="color: #666">零售价：</span>{{ data.book.price }}元</el-col>
            <el-col :span="7"><span style="color: #666">剩余库存：</span>{{ data.book.store }}</el-col>
          </el-row>
        </div>
        <div style="padding: 15px; background-color: #ffffe6; border-radius: 5px; margin-bottom: 10px; text-align: justify">
          借阅须知：借阅书籍如果出现破损需借阅者承担借书全部费用，默认可借阅30天， 逾期未归还图书会扣除信誉分，信誉分低于50无法借阅图书
        </div>
        <div>
          <el-input-number v-model="data.form.num" :min="1" style="height: 40px; margin-right: 10px"></el-input-number>
          <el-button @click="addOrder" type="danger" style="height: 40px; width: 150px">立即借阅</el-button>
          <el-button @click="addCart" type="warning" style="height: 40px; width: 150px">加入书单</el-button>
        </div>
      </div>
    </div>

    <!-- 引入 Comment 组件  -->
    <Comment module="book" :fid="data.id" />
  </div>
</template>

<script setup>
import { reactive } from "vue";
import router from "@/router/index.js";
import request from "@/utils/request.js";
import {ElMessage, ElMessageBox} from "element-plus";
import Comment from "@/components/Comment.vue";

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  id: router.currentRoute.value.query.id,
  book: {},
  form: { num: 1 },

})

request.get('/book/selectById/' + data.id).then(res => data.book = res.data)

const addCart = () => {
  data.form.bookId = data.id
  request.post('/cart/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('加入书单成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const addOrder = () => {
  data.form.bookId = data.id
  request.post('/orders/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('借书成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}
</script>

<style>
.el-popper.is-customized {
  /* Set padding to ensure the height is 32px */
  padding: 6px 12px;
  background: linear-gradient(90deg, rgb(159, 229, 151), rgb(204, 229, 129));
}

.el-popper.is-customized .el-popper__arrow::before {
  background: linear-gradient(45deg, #b2e68d, #bce689);
  right: 0;
}
.el-popper .is-pure {
  width: 40% !important;
}
</style>
