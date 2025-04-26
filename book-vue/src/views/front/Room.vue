<template>
  <div class="main-content" style="width: 60%">
    <el-row :gutter="20">
     <el-col @click="goPage('/front/seatReserve?id=' + item.id)" :span="8" v-for="item in data.roomList" :key="item.id" style="margin-bottom: 20px">
       <div class="img-box">
         <img :src="item.img" alt="" style="width: 100%; height: 200px; border-radius: 5px">
       </div>

       <div style="margin: 10px 0; font-size: 20px">{{ item.name }}</div>
     </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";

const data = reactive({
  roomList: []
})

request.get('/room/selectAll').then(res => {
  data.roomList = res.data
})

const goPage = (path) => {
  location.href = path
}
</script>

<style scoped>
.img-box {
  border-radius: 5px;
  overflow: hidden;
  cursor: pointer;
}
.img-box:hover img{
  scale: 1.2;
}
.img-box img {
  transition: all 0.5s;
}
</style>