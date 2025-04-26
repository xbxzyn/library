<template>
  <div class="main-content">
    <div style="display: flex; grid-gap: 10px; align-items: flex-start">
      <!-- 分类开始 -->
      <div style="width:  150px; padding: 16px; background-color: #a3db8f">
        <div style="text-align: center; margin-bottom: 20px">
          <img src="@/assets/imgs/read.png" alt="" style="width: 50%">
          <div style="font-size: 13px; color: saddlebrown">为中华之崛起，而读书</div>
        </div>
        <el-row :gutter="10">
         <el-col :span="12" style="text-align: center; margin-bottom: 10px" v-for="item in data.categoryList" :key="item.id">
           <a style="color: #333" :href="'/front/book?categoryName=' + item.name">{{ item.name }}</a>
         </el-col>
        </el-row>
      </div>
      <!-- 分类结束 -->
      <!-- 轮播图开始 -->
      <div style="flex: 1">
        <el-carousel height="360px">
          <el-carousel-item v-for="item in data.cimgs" :key="item">
            <img :src="item.img" alt="" style="width: 100%">
          </el-carousel-item>
        </el-carousel>
      </div>
      <!-- 轮播图开始 -->
      <!-- 排行榜开始 -->
      <div style="width: 240px; padding: 10px">
        <div style="color: goldenrod; font-size: 20px; margin-bottom: 15px">借阅排行榜</div>
        <div @click="goPage('/front/bookDetail?id=' + item.id)" v-for="(item, index) in data.rankBookList" :key="item.id"
             style="padding: 10px 0; cursor: pointer; border-bottom: 1px solid #ddd">
          <div style="display: flex; grid-gap: 10px" v-if="index === data.currentIndex">
            <div style="width: 10px; color: orangered; font-weight: bold">{{ index + 1 }}</div>
            <div style="width: 50px">
              <img :src="item.cover" alt="" style="width: 100%">
            </div>
            <div style="flex: 1; width: 0;font-size: 12px">
              <div style="margin-bottom: 5px" class="line1">{{ item.name }}</div>
              <div style="color: #666"  class="line2">{{ item.descr }}</div>
            </div>
          </div>
          <div @mouseover="changeIndex(index)" v-else style="display: flex; align-items: center; grid-gap: 10px; font-size: 12px">
            <div style="width: 10px">{{ index + 1 }}</div>
            <div style="flex: 1; width: 0;" class="line1">{{ item.name }}</div>
          </div>
        </div>
        <div class="front-notice"><el-icon><Bell /></el-icon>公告：<span>{{ data.top }}</span></div> 
      </div>
      <!-- 排行榜开始 -->

    </div>

    <div style="display: flex; grid-gap: 30px;">
      <!--  左边的区域开始 -->
      <div style="flex: 1">
        <div style="margin: 20px 0">
          <div style="display: flex; align-items: flex-end; padding-bottom: 10px;border-bottom: 1px solid #1149a9; margin-bottom: 10px">
            <div style="color: #1149a9; flex: 1"><strong style="font-size: 24px">新</strong> 书上架</div>
            <span style="cursor: pointer" @click="goPage('/front/book')">更多>></span>
          </div>
          <div>
            <el-row :gutter="20">
             <el-col @click="goPage('/front/bookDetail?id=' + item.id)" :span="6" v-for="item in data.newBookList" :key="item.id" style="margin-bottom: 20px; cursor: pointer">
               <div class="book-box">
                 <img :src="item.cover" alt="" style="width: 100%; height: 220px; border-radius: 5px">
               </div>
               <div style="margin: 5px 0" class="line1">{{ item.name }}</div>
               <div style="margin: 5px 0; font-size: 12px; color: #666" class="line1">{{ item.author }}</div>
               <div style="margin: 5px 0; font-size: 12px; color: #666">库存剩余：{{ item.store }}</div>
             </el-col>
            </el-row>
          </div>
        </div>

        <div style="margin: 20px 0">
          <div style="padding-bottom: 10px; color: orangered; border-bottom: 1px solid orangered; margin-bottom: 10px">
            <strong style="font-size: 24px">推荐</strong> 读物
          </div>
          <div>
            <el-row :gutter="20">
              <el-col @click="goPage('/front/bookDetail?id=' + item.id)" :span="6" v-for="item in data.recommendBookList" :key="item.id" style="margin-bottom: 20px; cursor: pointer">
                <div class="book-box">
                  <img :src="item.cover" alt="" style="width: 100%; height: 220px; border-radius: 5px">
                </div>
                <div style="margin: 5px 0" class="line1">{{ item.name }}</div>
                <div style="margin: 5px 0; font-size: 12px; color: #666" class="line1">{{ item.author }}</div>
                <div style="margin: 5px 0; font-size: 12px; color: #666">库存剩余：{{ item.store }}</div>
              </el-col>
            </el-row>
          </div>
        </div>
      </div>
      <!--  左边的区域结束 -->

      <!--  右边的区域开始 -->
      <div style="width: 300px">
        <!-- 社区热帖开始 -->
        <div style="margin: 20px 0">
          <div style="display: flex; align-items: flex-end; padding-bottom: 10px; border-bottom: 1px solid rebeccapurple; margin-bottom: 10px">
            <div style="flex: 1; color: rebeccapurple;"><strong style=" font-size: 24px">社区</strong> 热帖</div>
            <span style="cursor: pointer" @click="goPage('/front/posts')">更多>></span>
          </div>
          <div>
            <div v-for="item in data.postsList" :key="item.id"
                 style="color: #666; border-bottom: 1px dashed #ccc; padding-bottom: 5px; margin-bottom: 10px">
              <div @click="goPage('/front/postsDetail?id=' + item.id)" class="line1 title" style="margin-bottom: 5px">{{ item.title }}</div>
              <div>
                <span style="margin-right: 20px"><el-icon size="16" style="top: 3px"><View /></el-icon>{{ item.readCount }}</span>
                <span style="margin-right: 20px"><el-icon size="16" style="top: 3px"><ChatDotSquare /></el-icon>{{ item.commentCount }}</span>
                <span style="margin-right: 20px"><el-icon size="16" style="top: 3px"><User /></el-icon>{{ item.userName }}</span>
              </div>
            </div>
          </div>
        </div>
        <!-- 社区热帖结束 -->

        <!-- 读书活动开始 -->
        <div style="margin: 20px 0">
          <div style="display: flex; align-items: flex-end; padding-bottom: 10px;  border-bottom: 1px solid orange; margin-bottom: 10px">
           <div style="flex: 1; color: orange">
             <strong style="font-size: 24px">读书</strong> 活动
           </div>
            <span style="cursor: pointer" @click="goPage('/front/activity')">更多>></span>
          </div>
          <div>
            <div @click="goPage('/front/activityDetail?id=' + item.id)" v-for="item in data.activityList" :key="item.id" style="margin-bottom: 20px">
              <img :src="item.img" alt="" style="width: 100%">
              <div style="margin: 5px 0; font-size: 20px; color: #666" class="activity-item">{{ item.name }}</div>
            </div>
          </div>
        </div>
        <!-- 读书活动结束 -->
      </div>
      <!--  右边的区域结束 -->
    </div>
  </div>
</template>

<script setup>
import request from "@/utils/request.js";
import {reactive} from "vue";


const data = reactive({
  categoryList: [],
  
  rankBookList: [],
  currentIndex: 0,  // 图书排行榜高亮选中的序号
  newBookList: [],
  activityList: [],
  postsList: [],
  recommendBookList: [],
  noticeData: [],
  cimgs:[]
})

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

request.get('/carousel/selectAll').then(res => {
  data.cimgs = res.data
})

// 查询所有图书分类
request.get('/category/selectAll').then(res => {
  data.categoryList = res.data
})

// 查询社区热帖
request.get('/posts/selectHot').then(res => {
  data.postsList = res.data
})

// 查询借书排行榜单
request.get('/book/selectHot').then(res => {
  data.rankBookList = res.data
})

// 查询新书信息
request.get('/book/selectAll').then(res => {
  data.newBookList = res.data.splice(0, 8)
})

// 查询活动信息
request.get('/activity/selectAll').then(res => {
  data.activityList = res.data.splice(0, 4)
})

// 查询推荐读物
request.get('/book/selectAll', {
  params: {
    recommend: true
  }
}).then(res => {
  data.recommendBookList = res.data.splice(0, 8)
})

const changeIndex = (index) => {
  data.currentIndex = index
}



const goPage = (path) => {
  location.href = path
}
</script>

<style scoped>
a:hover {
  color: red !important;
  text-decoration: underline;
  font-weight: bold;
}
.activity-item {
  cursor: pointer;
}
.activity-item:hover {
  color: #1890ff !important;
  text-decoration: underline;
}
.book-box {
  overflow: hidden;
}
.book-box:hover img{
  scale: 1.2;
}
.book-box img {
  transition: all 0.5s;
}

.front-notice {
    padding: 15px 10px;
    color: #35ac55;
    font-size: 13px;
    font-weight: bold ;
    display: flex;
    align-items: left;
    background-color: rgb(163, 219, 143);

}
</style>