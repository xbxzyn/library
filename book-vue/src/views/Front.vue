<template>
  <div>
    <!-- <div class="front-notice"><el-icon><Bell /></el-icon>公告：{{ data.top }}</div> -->
    <div class="front-header">
      <div class="front-header-left">
        <img src="@/assets/imgs/logo.png" alt="">
        <a href="/front/home"><div class="title">中小学图书馆管理系统</div></a>
      </div>
      <div class="front-header-center">
        <el-menu :default-active="router.currentRoute.value.path" router mode="horizontal">
          <el-menu-item index="/front/home">首页</el-menu-item>
          <el-menu-item index="/front/posts">图书社区</el-menu-item>
          <el-menu-item index="/front/activity">图书活动</el-menu-item>
          <el-menu-item index="/front/room">预览室</el-menu-item>
          <el-menu-item index="/front/book">图书馆</el-menu-item>
          <el-menu-item index="/front/feadback">留言反馈</el-menu-item>

        </el-menu>
      </div>
      <div style="width: 350px">
        <el-input clearable style="width: 240px; margin-right: 10px" v-model="data.name" placeholder="请输入图书名称搜索"></el-input>
        <el-button @click="goPage('/front/book?name=' + data.name)" type="primary">搜索</el-button>
      </div>
      <div class="front-header-right">
        <div v-if="!data.user.id">
          <el-button @click="router.push('/login')">登录</el-button>
          <!-- <el-button @click="router.push('/register')">注册</el-button> -->
        </div>
        <div v-else>
          <el-dropdown style="cursor: pointer; height: 60px">
            <div style="display: flex; align-items: center">
              <img style="width: 40px; height: 40px; border-radius: 50%;" :src="data.user.avatar" alt="">
              <span style="margin-left: 5px; color: #333">{{ data.user.name }}</span><el-icon><arrow-down /></el-icon>
            </div>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item @click="goPage('/front/cart')">我的书单</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/orders')">我的借书</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/myPosts')">我的发帖</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/sign')">我报名的活动</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/collect')">我收藏的活动</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/mySeatReserve')">我预约的座位</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/myComment')">我的评价</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/tips')">我的提醒</el-dropdown-item>

                <el-dropdown-item @click="goPage('/front/person')">个人信息</el-dropdown-item>
                <el-dropdown-item @click="goPage('/front/password')">修改密码</el-dropdown-item>
                <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </div>
    </div>
    <div class="main-body">
      <RouterView @updateUser="updateUser" />
    </div>

    <Footer />
  </div>
</template>

<script setup>
  import router from "@/router/index.js";
  import { reactive } from "vue";
  import request from "@/utils/request.js";
  import Footer from "@/components/Footer.vue";

  const data = reactive({
    user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
    top: '',
    noticeData: [],
    name: null
  })

  const goPage = (path) => {
    location.href = path
  }

  const logout = () => {
    localStorage.removeItem('xm-user')
    router.push('/login')
  }

  const updateUser = () => {
    data.user =  JSON.parse(localStorage.getItem('xm-user') || '{}')
  }

  const loadNotice = () => {
    request.get('/notice/selectAll').then(res => {
      data.noticeData = res.data
      let i = 0
      if (data.noticeData && data.noticeData.length) {
        data.top = data.noticeData[0].content
        setInterval(() => {
          data.top = data.noticeData[i].content
          i++
          if (i === data.noticeData.length) {
            i = 0
          }
        }, 2500)
      }
    })
  }
  loadNotice()
</script>

<style scoped>
@import "@/assets/css/front.css";
</style>