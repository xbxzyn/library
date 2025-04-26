<template>
  <div class="login-container">
    <div style="display: flex; border-radius: 5px; overflow: hidden">
      <img src="@/assets/imgs/10.jpg" alt="" style="width: 600px">
      <div class="login-box">
        <div style="font-weight: bold; font-size: 24px; text-align: center; margin-bottom: 30px; color: #1450aa">中小学图书馆管理系统</div>
        <el-form ref="formRef" :model="data.form" :rules="data.rules">
          <el-form-item prop="username">
            <el-input :prefix-icon="User" size="large" v-model="data.form.username" placeholder="请输入账号"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input show-password :prefix-icon="Lock" size="large" v-model="data.form.password" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item prop="captcha">
              <div style="display: flex; gap: 10px; align-items: center">
                <el-input size="large" v-model="data.form.captcha" placeholder="请输入验证码" style="flex: 1"></el-input>
                <img :src="data.captchaImg" alt="验证码" style="height: 40px; cursor: pointer" @click="refreshCaptcha">
              </div>
            </el-form-item>
          <el-form-item prop="role">
            <el-select size="large" v-model="data.form.role">
              <el-option value="USER" label="普通用户"></el-option>
              <el-option value="ADMIN" label="管理员"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button size="large" type="primary" style="width: 100%" @click="login">登 录</el-button>
          </el-form-item>
          <div style="display: flex">
            <div style="flex: 1">
              <a style="color: #1890ff" href="/front/home">前台</a>
            </div>
            <div>
              <!-- 还没有账号？请 <a style="color: #1890ff" href="/register">注册</a> -->
            </div>
          </div>
        </el-form>
      </div>
    </div>
    
  </div>
</template>

<script setup>
import { reactive, ref } from "vue";
import { User, Lock } from "@element-plus/icons-vue";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";
import router from "@/router/index.js";

const data = reactive({
  dialogVisible: true,
  form: { role: 'USER',captcha: '' },
  captchaImg: '',
  rules: {
    username: [
      { required: true, message: '请输入账号', trigger: 'blur' }
    ],
    password: [
      { required: true, message: '请输入密码', trigger: 'blur' }
    ],
    captcha: [
      { required: true, message: '请输入验证码', trigger: 'blur' }
    ]
  }
})

const formRef = ref()

const refreshCaptcha = () => {
  const timestamp = new Date().getTime();
    request.get(`/captcha?t=${timestamp}`, {
      responseType: 'blob' , // 指定响应类型为blob
      withCredentials: true
    }).then(res => {
      // 将blob数据转换为base64
      const reader = new FileReader()
      reader.readAsDataURL(res)
      reader.onload = () => {
        data.captchaImg = reader.result
      }
    }).catch(() => {
      ElMessage.error('获取验证码失败')
    })
  }

// 页面加载时生成验证码
refreshCaptcha()

const login = () => {
  formRef.value.validate(valid => {
    if (valid) { // 表示表单校验通过
      request.post('/login', data.form).then(res => {
        if (res.code === '200') {
          // 存储用户信息到浏览器的缓存
          localStorage.setItem('xm-user', JSON.stringify(res.data))
          ElMessage.success('登录成功')
          setTimeout(() => {
            if (res.data.role === 'ADMIN') {
              location.href = '/manager/home'
            } else {
              location.href = '/front/home'
            }
          }, 500)
        } else {
          ElMessage.error(res.msg)
          refreshCaptcha()
        }
      })
    }
  })
}
</script>

<style scoped>
.login-container {
  height: 100vh;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: url("@/assets/imgs/9.jpg");
  background-size: cover;
}
.login-box {
  width: 350px;
  padding: 30px;
  background-color: white;
}
</style>