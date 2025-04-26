<template>
  <div class="main-content" style="margin-top: 20px; width: 60%">
    <div style="display: flex; grid-gap: 20px; align-items: flex-start; margin-bottom: 40px">
      <div style="flex: 1">
        <strong @click="loadByCategory(null)" :class="{'category-active' : data.categoryName === null }" style="margin-right: 10px; display: inline-block; margin-bottom: 5px; cursor: pointer">全部</strong>
        <strong @click="loadByCategory(item.name)" :class="{'category-active' : item.name === data.categoryName }" v-for="item in data.categoryList" :key="item.id" style="margin-right: 10px; display: inline-block; margin-bottom: 5px; cursor: pointer">{{ item.name }}</strong>
      </div>
      <div style="flex: 1; display: flex">
        <el-input clearable style="flex: 1; margin-right: 10px" size="large" v-model="data.name" placeholder="请输入图书名称搜索"></el-input>
        <el-button size="large" type="primary" @click="load">搜 索</el-button>
        <el-button size="large" type="warning" @click="reset">重 置</el-button>
      </div>
    </div>

    <div>
      <el-row :gutter="20">
        <el-col @click="goPage('/front/bookDetail?id=' + item.id)" :span="6" v-for="item in data.tableData" :key="item.id" style="margin-bottom: 20px; cursor: pointer">
          <div class="book-box">
            <img :src="item.cover" alt="" style="width: 100%; height: 220px; border-radius: 5px">
          </div>
          <div style="margin: 5px 0" class="line1">{{ item.name }}</div>
          <div style="margin: 5px 0; font-size: 12px; color: #666" class="line1">{{ item.author }}</div>
          <div style="margin: 5px 0; font-size: 12px; color: #666">库存剩余：{{ item.store }}</div>
          <div style="margin: 5px 0; font-size: 12px; color: #666">位置：{{ item.weizhi }}</div>
        </el-col>
      </el-row>

      <div style="margin: 15px 0" v-if="data.total">
        <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";
import router from "@/router/index.js";
import { ElMessage } from "element-plus";

const data = reactive({
  categoryList: [],
  tableData: [],
  pageNum: 1,
  pageSize: 8,
  total: 0,
  name: router.currentRoute.value.query.name || null,
  categoryName: router.currentRoute.value.query.categoryName || null
});

const loadByCategory = (categoryName) => {
  data.categoryName = categoryName;
  load();
};

const clearUrlParam = () => {
  let url = location.href;
  url = url.replace(/(\?|#)[^'"]*/, '');           // 去除参数
  window.history.pushState({}, 0, url);
};

request.get('/category/selectAll').then(res => {
  data.categoryList = res.data;
}).catch(error => {
  console.error('加载分类数据失败:', error);
  ElMessage.error('加载分类数据失败');
});

const load = () => {
  request.get('/book/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      categoryName: data.categoryName
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || [];
      data.total = res.data?.total;
      clearUrlParam();  // 去除地址栏的参数
    } else {
      ElMessage.error(res.msg || '加载数据失败');
    }
  }).catch(error => {
    console.error('加载数据失败:', error);
    ElMessage.error('加载数据失败');
  });
};

// 定义 reset 方法
const reset = () => {
  // 重置搜索条件
  data.name = null;
  data.categoryName = null;

  // 重置分页到第一页
  data.pageNum = 1;

  // 可选：清除 URL 中的查询参数
  // clearUrlParam();

  // 重新加载数据
  load();
};

// 初始加载数据
load();

const goPage = (path) => {
  location.href = path;
};
</script>

<style scoped>
.book-box {
  overflow: hidden;
}
.book-box:hover img{
  scale: 1.2;
}
.book-box img {
  transition: all 0.5s;
}
.category-active {
  color: red;
}
.line1 {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>