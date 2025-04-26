<template>
  <div style="width: 100%" class="card">
    <el-form ref="form" :model="data.user" :rules="rules" label-width="70px" style="padding: 20px">
      <el-form-item prop="avatar" label="头像">
        <el-upload
          :action="baseUrl + '/files/upload'"
          :on-success="handleFileUpload"
          :show-file-list="false"
          class="avatar-uploader"
        >
          <img v-if="data.user.avatar" :src="data.user.avatar" class="avatar" />
          <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
        </el-upload>
      </el-form-item>
      <el-form-item prop="username" label="用户名">
        <el-input disabled v-model="data.user.username" placeholder="请输入用户名"></el-input>
      </el-form-item>
      <el-form-item prop="name" label="姓名">
        <el-input disabled v-model="data.user.name" placeholder="请输入姓名"></el-input>
      </el-form-item>
      <el-form-item prop="phone" label="电话">
        <el-input v-model="data.user.phone" placeholder="请输入电话"></el-input>
      </el-form-item>
      <el-form-item prop="email" label="邮箱">
        <el-input v-model="data.user.email" placeholder="请输入邮箱"></el-input>
      </el-form-item>
      <div style="text-align: center">
        <el-button type="primary" @click="update">保 存</el-button>
      </div>
    </el-form>
  </div>
</template>

<script setup>
import { reactive, ref } from "vue";
import request from "@/utils/request.js";
import { ElMessage } from "element-plus";
import { Plus } from "@element-plus/icons-vue";

const baseUrl = import.meta.env.VITE_BASE_URL;

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || {})
});

const form = ref(null);

// 表单验证规则
const rules = reactive({
  phone: [
    { required: true, message: '请输入电话', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '电话必须是11位数字', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱', trigger: 'blur' },
    { type: 'email', message: '请输入有效的邮箱地址', trigger: 'blur' }
  ]
});

const handleFileUpload = (res) => {
  data.user.avatar = res.data;
};

const emit = defineEmits(['updateUser']);

const update = () => {
  form.value.validate(valid => {
    if (valid) {
      if (data.user.role === 'ADMIN') {
        request.put('/admin/update', data.user).then(res => {
          if (res.code === '200') {
            ElMessage.success('保存成功');
            localStorage.setItem('xm-user', JSON.stringify(data.user));
            emit('updateUser');
          } else {
            ElMessage.error(res.msg);
          }
        });
      } else {
        // 如果不是管理员，可以处理其他逻辑
        ElMessage.warning('只有管理员可以更新信息');
      }
    } else {
      ElMessage.error('电话或邮箱错误，请检查输入');
    }
  });
};
</script>

<style>
.avatar-uploader {
  height: 120px;
}
.avatar-uploader .avatar {
  width: 120px;
  height: 120px;
  display: block;
}
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 120px;
  height: 120px;
  text-align: center;
}
</style>