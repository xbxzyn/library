<template>
  <div class="main-content">
    <div class="card" style="padding: 20px">
      <div style="margin-bottom: 15px">
        <el-input 
          v-model="data.roomName" 
          prefix-icon="Search" 
          style="width: 240px; margin-right: 10px" 
          placeholder="请输入预览室名称查询">
        </el-input>
        <el-input 
          v-model="data.seatNo" 
          prefix-icon="Search" 
          style="width: 240px; margin-right: 10px" 
          placeholder="请输入座位编号查询">
        </el-input>
        <el-button type="info" plain @click="load">查询</el-button>
        <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
      </div>
      <div style="margin-bottom: 15px">
        <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
          <el-table-column prop="roomName" label="预览室名称" />
          <el-table-column prop="seatNo" label="座位编号" />
          <el-table-column prop="userName" label="账号" />
          <el-table-column prop="time" label="预约时间" />
          <el-table-column prop="yydate" label="预约日期" />
          <el-table-column prop="kssj" label="开始时间" />
          <el-table-column prop="jssj" label="结束时间" />

          <el-table-column prop="status" label="座位状态">
            <template #default="scope">
              <el-tag 
                type="success" 
                v-if="scope.row.status === STATUS.SELECTED">已选
              </el-tag>
              <el-tag 
                type="danger" 
                v-else-if="scope.row.status === STATUS.REFUNDED">已退
              </el-tag>
              <el-tag 
                type="warning" 
                v-else-if="scope.row.status === STATUS.EXPIRED">过期
              </el-tag>
            </template>
          </el-table-column>

          <el-table-column label="操作" width="100" fixed="right">
            <template #default="scope">
              <el-button 
                type="primary" 
                @click="changeStatus(scope.row)" 
                :disabled="isButtonDisabled(scope.row.status)">
                退座
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div v-if="data.total">
        <el-pagination 
          @current-change="load" 
          background 
          layout="total, prev, pager, next" 
          :page-size="data.pageSize" 
          v-model:current-page="data.pageNum" 
          :total="data.total" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";
import { ElMessage, ElMessageBox } from "element-plus";

// 定义状态枚举
const STATUS = {
  SELECTED: '已选',
  REFUNDED: '已退',
  EXPIRED: '过期'
};

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  formVisible: false,
  form: {},
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
  seatNo: null,
  roomName: null,
  ids: []
});

// 判断按钮是否禁用的方法
const isButtonDisabled = (status) => {
  return status === STATUS.EXPIRED || status === STATUS.REFUNDED;
};

const changeStatus = (row) => {
  if (isButtonDisabled(row.status)) {
    if (row.status === STATUS.EXPIRED) {
      ElMessage.warning('过期座位无法退还');
    } else if (row.status === STATUS.REFUNDED) {
      ElMessage.warning('已退座位无法再次退还');
    }
    return;
  }
  
  ElMessageBox.confirm('您确认退还座位吗？', '退还确认', { type: 'warning' }).then(res => {
    row.status = STATUS.REFUNDED;
    request.put('/seatReserve/update', row).then(res => {
      if (res.code === '200') {
        ElMessage.success('操作成功');
        load();
      } else {
        ElMessage.error(res.msg);
        // 恢复状态以防请求失败
        row.status = STATUS.SELECTED; // 或者原来的状态
      }
    }).catch(error => {
      ElMessage.error('网络错误，请稍后再试');
      // 恢复状态以防请求失败
      row.status = STATUS.SELECTED; // 或者原来的状态
    });
  }).catch(() => {
    // 用户取消操作，无需处理
  });
};

const handleAdd = () => {
  data.form = {};
  data.formVisible = true;
};

const handleEdit = (row) => {
  data.form = JSON.parse(JSON.stringify(row));
  data.formVisible = true;
};

const add = () => {
  request.post('/seatReserve/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功');
      data.formVisible = false;
      load();
    } else {
      ElMessage.error(res.msg);
    }
  });
};

const update = () => {
  request.put('/seatReserve/update', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功');
      data.formVisible = false;
      load();
    } else {
      ElMessage.error(res.msg);
    }
  });
};

const save = () => {
  data.form.id ? update() : add();
};

const del = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/seatReserve/delete/' + id).then(res => {
      if (res.code === '200') {
        ElMessage.success("删除成功");
        load();
      } else {
        ElMessage.error(res.msg);
      }
    });
  }).catch(err => {
    console.error(err);
  });
};

const delBatch = () => {
  if (!data.ids.length) {
    ElMessage.warning("请选择数据");
    return;
  }
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete("/seatReserve/delete/batch", {data: data.ids}).then(res => {
      if (res.code === '200') {
        ElMessage.success('操作成功');
        load();
      } else {
        ElMessage.error(res.msg);
      }
    });
  }).catch(err => {
    console.error(err);
  });
};

const handleSelectionChange = (rows) => {
  data.ids = rows.map(v => v.id);
};

// 定义 reset 方法
const reset = () => {
  // 重置查询参数
  data.roomName = null;
  data.seatNo = null;
  
  // 重置分页到第一页
  data.pageNum = 1;
  
  // 可选：重置表单
  // data.form = {};
  
  // 可选：清空选中项
  // data.ids = [];
  
  // 重新加载数据
  load();
};

const load = () => {
  request.get('/seatReserve/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      seatNo: data.seatNo,
      roomName: data.roomName
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || [];
      data.total = res.data?.total;
    } else {
      ElMessage.error(res.msg || '加载数据失败');
    }
  }).catch(error => {
    ElMessage.error('加载数据失败');
    console.error(error);
  });
};

// 初始加载数据
load();
</script>

