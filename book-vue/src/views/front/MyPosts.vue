<template>
  <div class="main-content">
    <div class="card" style="margin-bottom: 10px; font-size: 24px">
      我的发帖
    </div>
    <div class="card" style="padding: 20px">
      <div style="margin-bottom: 10px; display: flex; align-items: center">
        <div style="flex: 1">
          <el-button @click="handleAdd" type="primary"><el-icon size="16" style="top: -1px"><CirclePlus /></el-icon> 发帖</el-button>
        </div>
        <div>
          <el-input v-model="data.title" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入标题查询"></el-input>
          <el-button type="info" plain @click="load">查询</el-button>
          <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
        </div>
      </div>
      <div style="margin-bottom: 15px">
        <el-table stripe :data="data.tableData" @selection-change="handleSelectionChange">
          <el-table-column prop="title" label="标题" show-overflow-tooltip></el-table-column>
          <el-table-column prop="img" label="图片">
            <template #default="scope">
              <el-image style="width: 50px; height: 50px; border-radius: 5px" :src="scope.row.img" :preview-src-list="[scope.row.img]" preview-teleported></el-image>
            </template>
          </el-table-column>
          <el-table-column prop="tags" label="标签">
            <template #default="scope">
              <el-tag style="margin-bottom: 5px;" type="info" v-for="item in scope.row.tags" :key="item">{{ item }}</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="content" label="内容">
            <template #default="scope">
              <el-button type="primary" @click="view(scope.row.content)">查看内容</el-button>
            </template>
          </el-table-column>
          <el-table-column prop="userName" label="学号"></el-table-column>
          <el-table-column prop="time" label="发布时间" width="180"></el-table-column>
          <el-table-column prop="readCount" label="阅读量"></el-table-column>
          <el-table-column prop="sectionName" label="版块"></el-table-column>
          <el-table-column label="操作" width="100" fixed="right">
            <template v-slot="scope">
              <el-button type="primary" circle :icon="Edit" @click="handleEdit(scope.row)"></el-button>
              <el-button type="danger" circle :icon="Delete" @click="del(scope.row.id)"></el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div v-if="data.total">
        <el-pagination @current-change="load" background layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
    </div>


    <el-dialog title="内容" v-model="data.viewVisible" width="50%" :close-on-click-modal="false" destroy-on-close>
      <div class="editor-content-view" style="padding: 20px" v-html="data.content"></div>
      <template #footer>
    <span class="dialog-footer">
      <el-button @click="data.viewVisible = false">关 闭</el-button>
    </span>
      </template>
    </el-dialog>

    <el-dialog title="发帖" v-model="data.formVisible" width="50%" :close-on-click-modal="false" destroy-on-close>
      <el-form ref="form" :model="data.form" label-width="70px" style="padding: 20px">
        <el-form-item label="版块" prop="sectionId">
          <el-select style="width: 100%" v-model="data.form.sectionId">
            <el-option v-for="item in data.sectionList" :key="item.id" :value="item.id" :label="item.name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="标题" prop="title">
          <el-input v-model="data.form.title" placeholder="标题"></el-input>
        </el-form-item>
        <el-form-item label="图片" prop="img">
          <el-upload
              :action="baseUrl + '/files/upload'"
              :headers="{ 'token': data.user.token }"
              :on-success="handleFileUpload"
              list-type="picture"
          >
            <el-button type="primary">上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="标签" prop="tags">
          <el-select clearable multiple style="width: 100%" v-model="data.form.tags">
            <el-option value="学习园地"></el-option>
            <el-option value="科普知识"></el-option>
            <el-option value="生活小贴士"></el-option>
            <el-option value="热门问答"></el-option>
            <el-option value="新人求助"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <div style="border: 1px solid #ccc; width: 100%">
            <Toolbar
                style="border-bottom: 1px solid #ccc"
                :editor="editorRef"
                :mode="mode"
            />
            <Editor
                style="height: 500px; overflow-y: hidden;"
                v-model="data.form.content"
                :mode="mode"
                :defaultConfig="editorConfig"
                @onCreated="handleCreated"
            />
          </div>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.viewVisible = false">关 闭</el-button>
          <el-button type="primary" @click="save">保 存</el-button>
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
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import {onBeforeUnmount, ref, shallowRef} from "vue";
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'


const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  formVisible: false,
  form: {},
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
  title: null,
  ids: [],
  viewVisible: false,
  content: null,
  sectionList: []
})

request.get('/postsSection/selectAll').then(res => {
  data.sectionList = res.data
})

const baseUrl = import.meta.env.VITE_BASE_URL
const handleFileUpload = (res) => {
  data.form.img = res.data
}

/* wangEditor5 初始化开始 */
const editorRef = shallowRef()  // 编辑器实例，必须用 shallowRef
const mode = 'default'
const editorConfig = { MENU_CONF: {} }
// 图片上传配置
editorConfig.MENU_CONF['uploadImage'] = {
  headers: {
    token: data.user.token,
  },
  server: baseUrl + '/files/wang/upload',  // 服务端图片上传接口
  fieldName: 'file'  // 服务端图片上传接口参数
}
// 组件销毁时，也及时销毁编辑器，否则可能会造成内存泄漏
onBeforeUnmount(() => {
  const editor = editorRef.value
  if (editor == null) return
  editor.destroy()
})
// 记录 editor 实例，重要！
const handleCreated = (editor) => {
  editorRef.value = editor
}
/* wangEditor5 初始化结束 */

const view = (content) => {
  data.content = content
  data.viewVisible = true
}


const load = () => {
  request.get('/posts/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      title: data.title,
      userId: data.user.id
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || []
      data.tableData.forEach(item => item.tags = JSON.parse(item.tags))  // JSON字符串转换成JSON数组
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
  request.post('/posts/add', data.form).then(res => {
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
  request.put('/posts/update', data.form).then(res => {
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
  data.form.tags = JSON.stringify(data.form.tags)  // JSON数组转换成JSON字符串 才能存到数据库
  data.form.id ? update() : add()
}

const del = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/posts/delete/' + id).then(res => {
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
    request.delete("/posts/delete/batch", {data: data.ids}).then(res => {
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
  data.title = null
  load()
}

load()
</script>