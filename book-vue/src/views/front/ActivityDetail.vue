<template>
  <div class="main-content" style="width: 60%">
    <div style="position: absolute; top: 100px; right: 100px">
      <div style="margin-bottom: 20px">
        <el-button @click="sign" type="primary" style="width: 120px; height: 50px; ">立即报名</el-button>
      </div>
      <div>
        <el-button @click="collect" type="info" style="width: 120px; height: 50px">收藏活动</el-button>
      </div>
    </div>

    <img style="width: 100%" :src="data.activity.img" alt="">

    <div style="margin: 20px 0; font-size: 20px; font-weight: bold">
      {{ data.activity.name }}
    </div>

    <div style="margin: 20px 0; color: #666; line-height: 24px; text-align: justify">{{ data.activity.descr }}</div>

    <div style="margin: 20px 0; padding: 20px; border: 1px dashed #ccc">
      <el-row :gutter="10">
       <el-col :span="8">
         <strong>活动时间：</strong> {{ data.activity.start }} ~ {{  data.activity.end }}
       </el-col>
       <el-col :span="8">
         <strong>活动地点：</strong> {{ data.activity.location  }}
       </el-col>
       <el-col :span="8">
         <strong>报名人数：</strong> {{ data.activity.signCount  }}
       </el-col>
      </el-row>
    </div>

    <div style="margin: 30px 0; text-align: justify; line-height: 24px">
      <div v-html="data.activity.content"></div>
    </div>

    <el-dialog title="活动报名" v-model="data.formVisible" width="30%" destroy-on-close>
      <el-form ref="formRef" :model="data.form" label-width="80px" style="padding: 20px" :rules="data.rules">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="data.form.name" placeholder="姓名"></el-input>
        </el-form-item>
        <el-form-item label="联系方式" prop="phone">
          <el-input v-model="data.form.phone" placeholder="联系方式"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible = false">取 消</el-button>
          <el-button type="primary" @click="sign">确 定</el-button>
        </span>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import { reactive, ref } from "vue";
import request from "@/utils/request.js";
import router from "@/router/index.js";
import {ElMessage} from "element-plus";

const formRef = ref()

const data = reactive({
  id: router.currentRoute.value.query.id,
  activity: {},
  formVisible: false,
  form: {},
  rules: {
    name: [
      { required: true, message: '请输入姓名', trigger: 'blur' }
    ],
    phone: [
      { required: true, message: '请输入联系方式', trigger: 'blur' }
    ],
  }
})

const collect = () => {
  request.post('/collect/add', { activityId: data.activity.id }).then(res => {
    if (res.code === '200') {
      ElMessage.success('收藏成功')
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const handleSign = () => {
  data.formVisible = true
  data.form = {}
}

const sign = () => {
  // formRef.value.validate((valid)=> {
    // 表单校验成功  valid就是true
    // if (valid) {
      data.form.activityId = data.id
      request.post('/sign/add', data.form).then(res => {
        if (res.code === '200') {
          ElMessage.success('报名成功')
          // data.formVisible = false
          load()
        } else {
          ElMessage.error(res.msg)
        }
      })
    // }
  // })
}

const load = () => {
  request.get('/activity/selectById/' + data.id).then(res => {
    data.activity = res.data
  })
}
load()
</script>