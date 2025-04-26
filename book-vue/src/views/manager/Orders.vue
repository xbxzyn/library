
<template>
    <div>
      <div class="card" style="margin-bottom: 5px">
      <div class="statistics" style="margin-bottom: 20px; font-size: 16px; color: #333;">
      <div style="display: flex; align-items: center; gap: 20px;">
      <div style="display: flex; align-items: center; gap: 8px;">
      <i class="el-icon-s-opportunity" style="font-size: 20px; color: #409EFF;"></i>
      <span>已借出订单数量: <strong style="color: #67C23A;">{{ data.borrowedCount }}</strong></span>
      </div>
      <div style="display: flex; align-items: center; gap: 8px;">
      <i class="el-icon-warning" style="font-size: 20px; color: #F56C6C;"></i>
      <span>逾期订单数量: <strong style="color: #F56C6C;">{{ data.overdueCount }}</strong></span>
      </div>
    <el-button type="primary" plain size="mini" @click="updateall">更新 </el-button>
    </div>
    </div>
        <el-input v-model="data.orderNo" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入订单编号查询"></el-input>
        <el-input v-model="data.userName" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入学号查询"></el-input>
        <el-select v-model="data.status" style="width: 240px; margin-right: 10px" placeholder="请选择订单状态">
          <el-option label="已借出" value="已借出"></el-option>
          <el-option label="已归还" value="已归还"></el-option>
          <el-option label="逾期" value="逾期"></el-option>
        </el-select>
        <!-- <el-input v-model="data.status" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入订单状态查询"></el-input> -->
        <el-button type="info" plain @click="load">查询</el-button>
        <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
        
      </div>
      <div class="card" style="margin-bottom: 5px">
        <el-button type="danger" plain @click="delBatch">批量删除</el-button>
        <el-button type="success" plain @click="exportExcel">导出Excel</el-button>
      </div>
  
      <div class="card" style="margin-bottom: 5px">
        <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" />
          <el-table-column prop="name" label="书籍名称"></el-table-column>
          <el-table-column prop="orderNo" label="借书编号"></el-table-column>
          <el-table-column prop="time" label="借书时间"></el-table-column>
          <el-table-column prop="userName" label="学号"></el-table-column>
          <el-table-column prop="ghtime" label="归还时间"></el-table-column>
  
  
          <el-table-column prop="status" label="状态">
            <template #default="scope">
              <el-tag type="danger" v-if="scope.row.status === '已取消'">已取消</el-tag>
              <el-tag type="warning" v-if="scope.row.status === '借书待确认'">借书待确认</el-tag>
              <el-tag type="primary" v-if="scope.row.status === '已借出'">已借出
  
                <el-button type="primary"  @click="xujie(scope.row.id)">续借</el-button>
  
              </el-tag>
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
              <el-button v-if="scope.row.status === '借书待确认'" type="primary" @click="changeStatus(scope.row, '已借出')">确认借出</el-button>
              <el-button v-if="scope.row.status === '还书待确认'" type="primary" @click="changeStatus(scope.row, '已归还')">确认归还</el-button>
              <el-button type="danger" circle :icon="Delete" @click="del(scope.row.id)"></el-button>
  
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div class="card" v-if="data.total">
        <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
  
      <el-dialog title="订单详情" v-model="data.formVisible" width="60%" destroy-on-close>
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
          <el-table-column prop="num" label="数量"></el-table-column>
          <el-table-column prop="userName" label="用户"></el-table-column>
          <el-table-column prop="username" label="学号"></el-table-column>
          <el-table-column prop="nianji" label="年级"></el-table-column>
          <el-table-column prop="banji" label="班级"></el-table-column>
          <el-table-column prop="phone" label="电话"></el-table-column>
        </el-table>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="data.formVisible = false">关 闭</el-button>
          </span>
        </template>
      </el-dialog>
  
      <el-dialog title="续借" v-model="data.formVisible1" width="40%" destroy-on-close>
        <el-form ref="form" :model="data.form" label-width="70px" style="padding: 20px">
          <el-form-item prop="username" label="归还日期">
            <el-date-picker style="width: 100%" v-model="data.form.ghtime" type="date" placeholder="归还日期" 
            format="YYYY-MM-DD" value-format="YYYY-MM-DD" />
  
          </el-form-item>
          
          
          
        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="data.formVisible1 = false">取 消</el-button>
            <el-button type="primary" @click="save1">确 定</el-button>
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
    orderNo: null,
    status:null,
    userName:null,
    ids: [],
    ordersItemList: [],
    borrowedCount: 0, // 已借出订单数量
    overdueCount: 0,  // 逾期订单数量
    
  })
  
  // 确认操作
  const changeStatus = (row, status) => {
    data.form = JSON.parse(JSON.stringify(row))
    data.form.status = status
    update()
  }
  
  const detail = (orderId) => {
    request.get('/ordersItem/selectByOrderId/' + orderId).then(res => {
      data.ordersItemList = res.data
      data.formVisible = true // 打开弹窗
    })
  }
  
  const xujie = (orderId) => {
      data.form.id =orderId
      data.formVisible1 = true // 打开弹窗
  }
  const loadCounts = () => {
  console.log('loadCounts 被调用了'); // 确认方法是否被调用
  Promise.all([
    request.get('/orders/selectnum1'),
    request.get('/orders/selectnum2')
  ]).then(([res1, res2]) => {
    console.log('Response 1:', res1);
    console.log('Response 2:', res2);

    if (res1.code === '200' && res2.code === '200') {
      data.borrowedCount = res1.data || 0;
      data.overdueCount = res2.data || 0;
      console.log('统计数量更新成功:', data.borrowedCount, data.overdueCount); // 确认数据是否更新
    } else {
      ElMessage.error('获取统计数量失败，响应格式不正确');
    }
  }).catch(err => {
    console.error('获取统计数量失败:', err);
    ElMessage.error('获取统计数量失败，请稍后重试');
  });
};
  const load = () => {
    request.get('/orders/selectPage', {
      params: {
        pageNum: data.pageNum,
        pageSize: data.pageSize,
        ...(data.orderNo && { orderNo: data.orderNo }), // 仅在 orderNo 有值时传递
        ...(data.status && { status: data.status }),// 仅在 status 有值时传递
        ...(data.userName && { userName: data.userName }) 
      }
    }).then(res => {
      if (res.code === '200') {
        data.tableData = res.data?.list || []
        data.total = res.data?.total
        data.ids = res.data.list.map(v => v.id)
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
        loadCounts()
      
      } else {
        ElMessage.error(res.msg)
      }
    })
  }
  
  const save = () => {
    data.form.id ? update() : add()
  }
  
  const save1 = () => {
    request.put('/orders/xujie', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('续借成功')
        data.formVisible1 = false
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
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
    data.orderNo = null,
    data.status = null ,
    data.userName= null,
    load(),
    loadCounts()
  }
  const updateall = () => {
    load(),
    loadCounts()
  }
  
  load(),
  loadCounts()

  const exportExcel = () => {

// 使用axios请求下载文件
request.post('/orders/export', {ids: data.ids}, {
      responseType: 'blob'  // 设置响应类型为blob
    }).then(res => {
      // 创建blob链接
      const blob = new Blob([res], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
      const url = window.URL.createObjectURL(blob)
      // 创建一个a标签用于下载
      const link = document.createElement('a')
      link.href = url
      link.download = '借书订单.xlsx'
      document.body.appendChild(link)
      link.click()
      // 清理
      window.URL.revokeObjectURL(url)
      document.body.removeChild(link)
    }).catch(err => {
      ElMessage.error('导出失败')
      console.error(err)
    })
    
  }
  </script>