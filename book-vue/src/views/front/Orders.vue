<template>
  <div class="main-content">
    <div class="card" style="margin-bottom: 10px; font-size: 24px">
      我的借书
    </div>
    <div class="card" style="padding: 20px">
      <div style="margin-bottom: 15px">
        <el-input v-model="data.name" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入订单名称查询"></el-input>
        <el-input v-model="data.orderNo" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入订单编号查询"></el-input>
        <el-button type="info" plain @click="load">查询</el-button>
        <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
      </div>
      <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
        <el-table-column prop="name" label="书籍名称" show-overflow-tooltip></el-table-column>
        <el-table-column prop="orderNo" label="借书编号" width="200"></el-table-column>
        <el-table-column prop="time" label="借书时间" width="180"></el-table-column>
        <el-table-column prop="ghtime" label="归还时间">
          <template #default="scope">
            <strong style="color: red" v-if="scope.row.days > 30">{{ scope.row.days }}天</strong>
            <span v-if="scope.row.days && scope.row.days <= 30">{{ scope.row.days }}天</span>

          </template>
        </el-table-column>
        <el-table-column prop="userName" label="学号"></el-table-column>
        <el-table-column prop="status" label="状态">
          <template #default="scope">
            <el-tag type="danger" v-if="scope.row.status === '已取消'">已取消</el-tag>
            <el-tag type="warning" v-if="scope.row.status === '借书待确认'">借书待确认</el-tag>
            <el-tag type="primary" v-if="scope.row.status === '已借出'">已借出</el-tag>
            <el-tag type="warning" v-if="scope.row.status === '还书待确认'">还书待确认</el-tag>
            <el-tag type="success" v-if="scope.row.status === '已归还'">已归还</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="订单详情" width="100" fixed="right">
          <template #default="scope">
            <el-button @click="detail(scope.row.id)">查询</el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="160" fixed="right">
          <template #default="scope">
            <el-button v-if="scope.row.status === '借书待确认'" type="danger" @click="changeStatus(scope.row, '已取消')">取消</el-button>
            <el-button v-if="scope.row.status === '已借出'" type="primary" @click="changeStatus(scope.row, '还书待确认')">归还</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div style="margin-top: 15px" v-if="data.total">
        <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
    </div>


    <el-dialog title="订单详情" v-model="data.formVisible" width="40%" destroy-on-close>
      <el-table :data="data.ordersItemList" stripe>
        <el-table-column prop="bookCover" label="图书封面">
          <template #default="scope">
            <img :src="scope.row.bookCover" alt="" style="width: 80px; height: 80px">
          </template>
        </el-table-column>
        <el-table-column label="图书">
          <template #default="scope">
            <a target="_blank" style="color: #1890ff" :href="'/front/bookDetail?id=' + scope.row.bookId">{{ scope.row.bookName }}</a>
          </template>
        </el-table-column>
        <el-table-column prop="num" label="数量">
          <template #default="scope">
            x{{ scope.row.num }}
          </template>
        </el-table-column>
      </el-table>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible = false">关 闭</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>

import {reactive} from "vue";
import request from "@/utils/request.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {Delete, Edit} from "@element-plus/icons-vue";


const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  formVisible: false,
  form: {},
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
  name: null,
  orderNo: null,
  ids: [],
  ordersItemList: []
})

// 确认操作
const changeStatus = (row, status) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = status
  if (status === '已取消') {
    ElMessageBox.confirm('您确认取消本次借书吗？', '取消确认', {
      type: 'warning'
    }).then(() => {
      update()
    }).catch(err => {})
    return
  }
  update()
}

const detail = (orderId) => {
  request.get('/ordersItem/selectByOrderId/' + orderId).then(res => {
    data.ordersItemList = res.data
    data.formVisible = true // 打开弹窗
  })
}

const load = () => {
  request.get('/orders/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      orderNo: data.orderNo
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || []
      data.total = res.data?.total
    } else {
      ElMessage.error(res.msg)
    }
  })
}
const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}
const handleEdit = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}
const add = () => {
  request.post('/orders/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      data.formVisible = false
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const update = () => {
  request.put('/orders/update', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      data.formVisible = false
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const save = () => {
  data.form.id ? update() : add()
}

const del = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/orders/delete/' + id).then(res => {
      if (res.code === '200') {
        ElMessage.success("删除成功")
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {
    console.error(err)
  })
}
const delBatch = () => {
  if (!data.ids.length) {
    ElMessage.warning("请选择数据")
    return
  }
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete("/orders/delete/batch", {data: data.ids}).then(res => {
      if (res.code === '200') {
        ElMessage.success('操作成功')
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {
    console.error(err)
  })
}
const handleSelectionChange = (rows) => {
  data.ids = rows.map(v => v.id)
}

const reset = () => {
  data.name = null
  data.orderNo = null
  load()
}

load()
</script>