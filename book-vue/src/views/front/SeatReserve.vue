<template>
  <div class="main-content" style="width: 60%">
    <div style="display: flex; grid-gap: 20px; margin-bottom: 50px">
      <img :src="data.room.img" alt="" style="width: 400px; height: 260px">
      <div style="flex: 1">
        <div style="font-size: 24px">{{ data.room.name }}</div>
        <div style="margin: 30px 0">具体位置：{{ data.room.location }}</div>
        <div style="margin: 30px 0">开放时间：{{ data.room.openTime }}</div>
        <div style="color: #666">预约须知：请提前预约第二天的座位，预约成功后请及时使用，禁止违规占座、替他人预约</div>
      </div>
    </div>

    <div>
      <div style="display: flex; justify-content: center; margin-bottom: 20px">
        <div style="font-size: 24px; font-weight: bold; width: fit-content; padding-bottom: 10px; border-bottom: 5px solid red">座位预约</div>
      </div>
      <div style="display: flex; justify-content: center">

        <div class="card" style="padding: 20px; width: 100%">
          <div style="display: flex; align-items: left;padding: 10px;">
           <img src="@/assets/imgs/wxzw.png" alt="" style="width: 30px; height: 30px; margin-right: 2px" />
           <span style="margin-right: 20px"> 未选</span>
           <img src="@/assets/imgs/yxzw.png" alt="" style="width: 30px; height: 30px; margin-right: 2px" /> 已选
          </div>

          <el-form-item prop="data.yydate" label="预约日期">
            <el-date-picker 
              style="width: 100%" 
              v-model="data.yydate" 
              type="date" 
              placeholder="预约日期" 
              format="YYYY-MM-DD" 
              value-format="YYYY-MM-DD"
              :disabled-date="disabledDate" 
            />
          </el-form-item>
          <el-form-item prop="data.ks" label="开始时间">
            <el-select  v-model="data.kssj" style="width: 100%">
              <el-option 
                v-for="item in ['08:00', '09:00', '10:00', 
                '11:00', '12:00', '13:00', '14:00', '15:00',  '16:00', '17:00', '18:00', '19:00']" 
                :key="item" 
                :value="item" 
                :label="item"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="data.js" label="结束时间">
            <el-select  v-model="data.jssj" style="width: 100%">
              <el-option 
                v-for="item in ['08:00', '09:00', '10:00', 
                '11:00', '12:00', '13:00', '14:00', '15:00',  '16:00', '17:00', '18:00', '19:00']" 
                :key="item" 
                :value="item" 
                :label="item"
              ></el-option>
            </el-select>
          </el-form-item>

          <div style="margin: 40px 0; display: flex; justify-content: center">
            <div style="width: 230px; display: flex; align-items: center; flex-wrap: wrap">
              <div  @click="selectSeat(item.id)"  v-for="item in data.seatList" :key="item.id" class="seat-item">
                <img v-if="item.status === '已选'" src="@/assets/imgs/yxzw.png" alt="" style="width: 30px; height: 30px;"  />
                <img v-if="item.status !== '已选' && data.activeSeatId !== item.id" src="@/assets/imgs/wxzw.png" alt="" style="width: 30px; height: 30px;"  />
                <img v-if="item.status !== '已选' && data.activeSeatId === item.id" src="@/assets/imgs/xzzw.png" alt="" style="width: 30px; height: 30px;"  />
                <div>{{ item.no }}</div>
              </div>  
            </div>
          </div>

          <div style="text-align: center">
            <el-button @click="reserve" type="primary" style="padding: 20px 30px">座位预约</el-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";
import router from "@/router/index.js";
import { ElMessage } from "element-plus";

const data = reactive({
  id: router.currentRoute.value.query.id,
  room: {},
  seatList: [],
  activeSeatId: null,
  yydate: null,
  kssj: null,
  jssj: null,
})

const selectSeat = (seatId) => {
  data.activeSeatId = seatId
}

// 限制日期选择为未来日期
const disabledDate = (time) => {
  return time.getTime() < Date.now() - 8.64e7; // 8.64e7 是一天的毫秒数，确保不能选择今天及之前的日期
}

const reserve = () => {
  if (!data.activeSeatId) {  // 没有选择座位
    ElMessage.warning('请选择座位')
    return
  }
  if (!data.yydate) {  // 
    ElMessage.warning('请选择预约日期')
    return
  }
  if (!data.kssj) {  // 
    ElMessage.warning('请选择开始时间')
    return
  }
  if (!data.jssj) {  // 
    ElMessage.warning('请选择结束时间')
    return
  }

  // 确保开始时间小于结束时间
  const startTime = new Date(`2000-01-01T${data.kssj}:00`).getTime();
  const endTime = new Date(`2000-01-01T${data.jssj}:00`).getTime();
  if (endTime <= startTime) {
    ElMessage.warning('结束时间必须大于开始时间')
    return
  }

  request.post('/seatReserve/add', { seatId: data.activeSeatId, yydate: data.yydate, kssj: data.kssj, jssj: data.jssj }).then(res => {
    if (res.code === '200') {
      ElMessage.success('预约成功!')
      loadSeats()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

request.get('/room/selectById/' + data.id).then(res => {
  data.room = res.data
})

const loadSeats = () => {
  request.get('/seat/selectAll', {
    params: {
      roomId: data.id
    }
  }).then(res => {
    data.seatList = res.data
  })
}
loadSeats()
</script>

<style>
.seat-item {
  text-align: center;
  cursor: pointer;
  margin-right: 20px;
  margin-bottom: 20px;
}
.seat-item:nth-child(5n) {
  /* 去除第5n个item的右边距 */
  margin-right: 0;
}
</style>