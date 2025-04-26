<template>
  <div>
    <div class="card" style="margin-bottom: 5px">
      <el-input v-model="data.name" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入名称查询"></el-input>
      <el-input v-model="data.username" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入学号查询"></el-input>
      <el-select  v-model="data.nianji" style="width: 240px" placeholder="请输入年级查询" >
        <el-option  v-for="item in ['一年级', '二年级', '三年级', 
        '四年级', '五年级', '六年级', '七年级', '八年级',  '九年级']" 
        :key="item" :value="item" :label="item"></el-option>
      </el-select>
      <el-select  v-model="data.banji" style="width: 240px" placeholder="请输入班级查询">
        <el-option v-for="item in ['1班', '2班', '3班', 
        '4班', '5班', '6班', '7班', '8班',  '9班']" 
        :key="item" :value="item" :label="item"></el-option>
      </el-select>
      <el-button type="info" plain @click="load">查询</el-button>
      <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
    </div>
    <div class="card" style="margin-bottom: 5px">
      <el-button type="primary" plain @click="handleAdd">新增</el-button>
      <el-button type="primary" plain @click="batch">批量导入</el-button>

      <el-button type="danger" plain @click="delBatch">批量删除</el-button>
    </div>

    <div class="card" style="margin-bottom: 5px">
      <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="username" label="学号" />
        <el-table-column prop="avatar" label="头像">
          <template v-slot="scope">
            <el-image style="width: 40px; height: 40px; border-radius: 50%; display: block" v-if="scope.row.avatar"
                      :src="scope.row.avatar" :preview-src-list="[scope.row.avatar]" preview-teleported></el-image>
          </template>
        </el-table-column>
        <el-table-column prop="name" label="姓名" />
        <el-table-column prop="role" label="角色" />
        <el-table-column prop="phone" label="电话" />
        <el-table-column prop="bzr" label="班主任" />
        <el-table-column prop="nianji" label="年级" />
        <el-table-column prop="banji" label="班级" />
        <el-table-column prop="email" label="邮箱" />
        <el-table-column prop="score" label="信誉分" />
        <el-table-column label="操作" width="220px" fixed="right">
          <template v-slot="scope">
            <el-button type="primary" style="width: 50px;"  @click="handleEdit(scope.row)">修改</el-button>
            <el-button type="danger"  style="width: 50px;"  @click="del(scope.row.id)">删除</el-button>
            <el-button type="primary" style="width: 60px;"   @click="resetpwd(scope.row)">重置密码</el-button>

          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="card" v-if="data.total">
      <el-pagination @current-change="load" background layout="total,siz,prev, pager, next,jumper" :page-size="data.pageSize"
      :page-sizes="[5, 10, 20, 50]"
            v-model:current-page="data.pageNum" :total="data.total" />
    </div>

    <el-dialog title="普通用户信息" v-model="data.formVisible" width="40%" destroy-on-close>
      <el-form ref="form" :model="data.form" label-width="70px" style="padding: 20px">
        <el-form-item prop="username" label="学号">
          <el-input v-model="data.form.username" placeholder="请输入学号"></el-input>
        </el-form-item>
        <el-form-item prop="avatar" label="头像">
          <el-upload
              :action="baseUrl + '/files/upload'"
              :on-success="handleFileUpload"
              list-type="picture"
              >
            <el-button type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item prop="name" label="姓名">
          <el-input v-model="data.form.name" placeholder="请输入姓名"></el-input>
        </el-form-item>
        <el-form-item prop="role" label="角色">
          <el-input v-model="data.form.role" placeholder="请输入角色"></el-input>
        </el-form-item>
        <el-form-item prop="nianji" label="年级">
          <!-- <el-input v-model="data.form.nianji" placeholder="请输入年级"></el-input> -->
          <el-select  v-model="data.form.nianji" style="width: 100%" >
            <el-option v-for="item in ['一年级', '二年级', '三年级', 
            '四年级', '五年级', '六年级', '七年级', '八年级',  '九年级']" 
            :key="item" :value="item" :label="item"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="banji" label="班级">
          <el-select  v-model="data.form.banji" style="width: 240px" >
        <el-option v-for="item in ['1班', '2班', '3班', 
        '4班', '5班', '6班', '7班', '8班',  '9班']" 
        :key="item" :value="item" :label="item"></el-option>
      </el-select>
        </el-form-item>
        <el-form-item prop="bzr" label="班主任">
          <el-input v-model="data.form.bzr" placeholder="请输入班主任"></el-input>
        </el-form-item>
        <el-form-item prop="phone" label="电话">
          <el-input v-model="data.form.phone" placeholder="请输入电话"></el-input>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input v-model="data.form.email" placeholder="请输入邮箱"></el-input>
        </el-form-item>
        <el-form-item prop="score" label="信誉分">
          <el-input v-model="data.form.score" placeholder="请输入信誉分"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible = false">取 消</el-button>
          <el-button type="primary" @click="save">确 定</el-button>
        </span>
      </template>
    </el-dialog>

    <el-dialog title="批量导入" v-model="data.formVisible1" width="40%" destroy-on-close>
      <el-form ref="form" :model="data.form1"  label-width="70px" style="padding: 20px">
        
        <el-form-item prop="avatar" label="文件">
          <el-upload
              :action="baseUrl + '/files/uploadFile'"
              :on-success="handleFileUpload1"
              list-type="filelist"
              >
            <el-button type="primary">点击导入</el-button>
          </el-upload>
        </el-form-item>
        
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible1 = false">关  闭</el-button>
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

const baseUrl = import.meta.env.VITE_BASE_URL

const data = reactive({
  formVisible: false,
  form: {},
  formVisible1: false,
  form1: {},
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
  name: null,
  ids: []
})

const load = () => {
  request.get('/user/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      nianji: data.nianji,
      username: data.username,
      banji:data.banji
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || []
      data.total = res.data?.total
    }
  })
}
const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}

const batch = () => {
  data.form1 = {}
  data.formVisible1 = true
}


const handleEdit = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}
const add = () => {
  request.post('/user/add', data.form).then(res => {
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
  request.put('/user/update', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      data.formVisible = false
      load()
    }
  })
}

const save = () => {
  data.form.id ? update() : add()
}

const del = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/user/delete/' + id).then(res => {
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

const resetpwd = () => {
  ElMessageBox.confirm('确定重置该用户密码为123456吗？', '确认', { type: 'warning' }).then(res => {
    request.put('/user/resetpwd' , data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success("重置密码成功")
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
    request.delete("/user/delete/batch", {data: data.ids}).then(res => {
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

const handleFileUpload = (res) => {
  data.form.avatar = res.data
}

const handleFileUpload1 = (res) => {

  ElMessage.success('用户导入成功')
  
}

const reset = () => {
  data.name = null;
  data.username=null;
  data.nianji = null; // 重置年级选择
  data.banji = null; // 重置班级选择
  load();
  load()
}


load()
</script>