<template>
  <div>
    <!-- 评论开始 -->
    <div>
      <div style="margin-bottom: 20px">
        <div style="font-size: 24px; font-weight: bold; margin-bottom: 20px">评论 {{ data.commentCount }}</div>
        <div style="margin-bottom: 5px">
          <el-input type="textarea" :rows="3" v-model="data.content" placeholder="请输入评论"></el-input>
        </div>
        <div style="text-align: right">
          <el-button @click="addComment(null)" type="primary">评论</el-button>
        </div>
      </div>
      <div>
        <div style="display: flex; grid-gap: 10px; margin-bottom: 20px" v-for="item in data.commentList" :key="item.id">
          <img :src="item.userAvatar" alt="" style="width: 50px; height: 50px; border-radius: 50%">
          <div style="flex: 1; color: #666;">
            <div style="margin-bottom: 20px">
              <div style="margin-bottom: 5px">{{ item.userName }}</div>
              <div style="margin-bottom: 5px; color: #333">{{ item.content }}</div>
              <div style="font-size: 12px; margin-bottom: 10px">
                <span style="margin-right: 20px">{{ item.time }}</span>
                <span @click="handleReply(item)" style="margin-right: 20px; cursor: pointer"><el-icon size="14" style="top: 2px"><ChatDotSquare /></el-icon>回复</span>
                <span v-if="data.user.id === item.userId" @click="deepDelete(item.id)" style="margin-right: 20px; cursor: pointer"><el-icon size="14" style="top: 2px"><Delete /></el-icon>删除</span>
              </div>
              <div v-if="item.showReply">
                <div style="margin-bottom: 5px">
                  <el-input type="textarea" v-model="item.replyContent" placeholder="请输入回复内容"></el-input>
                </div>
                <div style="text-align: right">
                  <el-button type="primary" @click="addComment(item)">回复</el-button>
                </div>
              </div>
            </div>
            <div v-if="item.children?.length">
              <div v-for="sub in item.children" :key="sub.id" style="display: flex; grid-gap: 10px">
                <img :src="sub.userAvatar" alt="" style="width: 50px; height: 50px; border-radius: 50%">
                <div style="flex: 1">
                  <div style="margin-bottom: 20px">
                    <div style="margin-bottom: 5px">{{ sub.userName }} <span style="color: #1890ff" v-if="sub.parentUserName !== item.userName">回复 @{{ sub.parentUserName }}</span></div>
                    <div style="margin-bottom: 5px; color: #333">{{ sub.content }}</div>
                    <div style="font-size: 12px; margin-bottom: 10px">
                      <span style="margin-right: 20px">{{ sub.time }}</span>
                      <span @click="handleReply(sub)" style="margin-right: 20px; cursor: pointer"><el-icon size="14" style="top: 2px"><ChatDotSquare /></el-icon>回复</span>
                      <span v-if="data.user.id === sub.userId" @click="deepDelete(item.id)" style="margin-right: 20px; cursor: pointer"><el-icon size="14" style="top: 2px"><Delete /></el-icon>删除</span>
                    </div>
                  </div>
                  <div v-if="sub.showReply">
                    <div style="margin-bottom: 5px">
                      <el-input type="textarea" v-model="sub.replyContent" placeholder="请输入回复内容"></el-input>
                    </div>
                    <div style="text-align: right">
                      <el-button type="primary" @click="addComment(sub)">回复</el-button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div style="margin: 20px 0" v-if="data.commentList?.length">
        <el-pagination size="small" @current-change="loadComment" background layout="prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>

    </div>
    <!-- 评论结束 -->
  </div>
</template>

<script setup>
import { reactive } from "vue";
import {ElMessage, ElMessageBox} from "element-plus";
import request from "@/utils/request.js";

const props = defineProps({
  module: null,
  fid: null
})

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  commentCount: 0,
  content: null,
  commentList: [],
  pageNum: 1,
  pageSize: 5,
  total: 0
})

const deepDelete = (id) => {
  ElMessageBox.confirm('您确认删除评论吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/comment/deepDelete/' + id).then(res => {
      if (res.code === '200') {
        ElMessage.success('操作成功')
        loadComment()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {})
}

const handleReply = (comment) => {
  comment.showReply = !comment.showReply
}

const loadCommentCount = () => {
  request.get('/comment/selectCount/' + props.module + '/' + props.fid).then(res => {
    data.commentCount = res.data
  })
}

const loadComment = () => {
  loadCommentCount()
  request.get('/comment/selectTree/' + props.module + '/' + props.fid, {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
    }
  }).then(res => {
    data.commentList = res.data?.list
    data.total = res.data.total
  })
}
loadComment()

const addComment = (parentComment) => {  //   parentComment有值  表示这是回复
  const param = { content: data.content, fid: props.fid, module: props.module }
  if (parentComment) {
    param.content = parentComment.replyContent
    param.pid = parentComment.id
  }
  request.post('/comment/add', param).then(res => {
    if (res.code === '200') {
      data.content = null
      ElMessage.success('评论成功')
      loadComment()
    } else {
      ElMessage.error(res.msg)
    }
  })
}
</script>