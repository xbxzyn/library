<template>
  <div>
    <div class="card" style="margin-bottom: 5px">
      <el-input v-model="data.name" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入名称查询"></el-input>
      <el-input v-model="data.isbn" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入ISBN查询"></el-input>
      <el-select style="width: 240px" v-model="data.categoryId" placeholder="请选择">
        <el-option v-for="item in data.categoryList" :key="item.id" :value="item.id" :label="item.name"></el-option>
      </el-select>
      <el-button type="info" plain @click="load">查询</el-button>
      <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
    </div>
    <div class="card" style="margin-bottom: 5px">
      <el-button type="primary" plain @click="handleAdd">新增</el-button>
      <el-button type="danger" plain @click="delBatch">批量删除</el-button>
    </div>

    <div class="card" style="margin-bottom: 5px">
      <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="name" label="名称" show-overflow-tooltip></el-table-column>
        <el-table-column prop="cover" label="封面">
          <template #default="scope">
            <el-image style="width: 50px; height: 50px; border-radius: 5px" :src="scope.row.cover" :preview-src-list="[scope.row.cover]" preview-teleported></el-image>
          </template>
        </el-table-column>
        <el-table-column prop="descr" label="简介" show-overflow-tooltip></el-table-column>
        <el-table-column prop="author" label="作者" show-overflow-tooltip></el-table-column>
        <el-table-column prop="publisher" label="出版社"></el-table-column>
        <el-table-column prop="date" label="出版日期"></el-table-column>
        <el-table-column prop="price" label="价格"></el-table-column>
        <el-table-column prop="isbn" label="ISBN"></el-table-column>
        <el-table-column prop="store" label="库存"></el-table-column>
        <el-table-column prop="categoryName" label="分类"></el-table-column>
        <el-table-column label="是否上架">
          <template v-slot="scope">
            <strong style="color: #1890ff;" v-if="scope.row.grounding">是</strong>
            <strong style="color: red" v-else>否</strong>
          </template>
        </el-table-column>
        <el-table-column prop="recommend" label="是否推荐">
          <template v-slot="scope">
            <strong style="color: #1890ff;" v-if="scope.row.recommend">是</strong>
            <strong style="color: red" v-else>否</strong>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="100" fixed="right">
          <template v-slot="scope">
            <el-button type="primary" circle :icon="Edit" @click="handleEdit(scope.row)"></el-button>
            <el-button type="danger" circle :icon="Delete" @click="del(scope.row.id)"></el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="card" v-if="data.total">
      <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
    </div>

    <el-dialog title="图书信息" v-model="data.formVisible" width="40%" destroy-on-close>
      <el-form ref="form" :model="data.form" label-width="70px" style="padding: 20px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="data.form.name" placeholder="名称"></el-input>
        </el-form-item>
        <el-form-item label="封面" prop="cover">
          <el-upload
              :action="baseUrl + '/files/upload'"
              :headers="{ 'token': data.user.token }"
              :on-success="handleFileUpload"
              list-type="picture"
          >
            <el-button type="primary">上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="简介" prop="descr">
          <el-input :rows="3" type="textarea" v-model="data.form.descr" placeholder="简介"></el-input>
        </el-form-item>
        <el-form-item label="作者" prop="author">
          <el-input v-model="data.form.author" placeholder="作者"></el-input>
        </el-form-item>
        <el-form-item label="出版社" prop="publisher">
          <el-input v-model="data.form.publisher" placeholder="出版社"></el-input>
        </el-form-item>
        <el-form-item label="出版日期" prop="date">
          <el-date-picker style="width: 100%" v-model="data.form.date" type="date" placeholder="出版日期" format="YYYY-MM-DD" value-format="YYYY-MM-DD" />
        </el-form-item>
        <el-form-item label="价格(元)" prop="price">
          <el-input-number :min="0" v-model="data.form.price" placeholder="价格"></el-input-number>
        </el-form-item>
        <el-form-item label="ISBN" prop="isbn">
          <el-input v-model="data.form.isbn" placeholder="ISBN"></el-input>
        </el-form-item>
        <el-form-item label="位置" prop="weizhi">
          <el-input v-model="data.form.weizhi" placeholder="1（楼层）A（分区）01（第几个柜子）2（层数）"></el-input>
        </el-form-item>
        <el-form-item label="库存" prop="store">
          <el-input-number :min="0" v-model="data.form.store" placeholder="库存"></el-input-number>
        </el-form-item>
        <el-form-item label="分类" prop="categoryId">
          <el-select style="width: 100%" v-model="data.form.categoryId">
            <el-option v-for="item in data.categoryList" :key="item.id" :value="item.id" :label="item.name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否上架" prop="grounding">
          <el-switch v-model="data.form.grounding" />
        </el-form-item>
        <el-form-item label="是否推荐" prop="recommend">
          <el-switch v-model="data.form.recommend" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible = false">取 消</el-button>
          <el-button type="primary" @click="save">确 定</el-button>
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
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  formVisible: false,
  form: {},
  tableData: [],
  pageNum: 1,
  pageSize: 5,
  total: 0,
  name: null,
  isbn: null,
  ids: [],
  categoryList: [],
  categoryId:[]
})

request.get('/category/selectAll').then(res => {
  data.categoryList = res.data
})

const handleFileUpload = (res) => {
  data.form.cover = res.data
}

const load = () => {
  request.get('/book/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      isbn: data.isbn,
      categoryId:data.categoryId
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
const handleEdit = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}
const add = () => {
  request.post('/book/add', data.form).then(res => {
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
  request.put('/book/update', data.form).then(res => {
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
    request.delete('/book/delete/' + id).then(res => {
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
    request.delete("/book/delete/batch", {data: data.ids}).then(res => {
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
  data.isbn = null
  data.categoryId=null
  load()
}

load()
</script>