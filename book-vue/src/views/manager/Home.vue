<template>
  <div>
    <div style="display: flex;grid-gap: 10px; margin-bottom: 10px">
      <div style="flex: 1" class="card">
        <div style="width: 100%; height: 400px" id="line"></div>
      </div>
      <div style="flex: 1" class="card">
        <div style="width: 100%; height: 400px" id="line1"></div>
      </div>
    </div>

    <div style="display: flex;grid-gap: 10px">
      <div style="flex: 1" class="card">
        <div style="width: 100%; height: 400px" id="bar"></div>
      </div>
      <div style="flex: 1" class="card">
        <div style="width: 100%; height: 400px" id="pie"></div>
      </div>
    </div>

    <div style="display: flex;grid-gap: 10px">
      <div style="flex: 1" class="card">
        <div style="width: 100%; height: 400px" id="pie4"></div>
      </div>
      <div style="flex: 1" class="card">
        <div style="width: 100%; height: 400px" id="bar5"></div>
      </div>
      </div>
  </div>
</template>

<script setup>

import {reactive, onMounted} from "vue";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";
import * as echarts from 'echarts'

const lineOption = {
  title: {
    text: '借书趋势图',
    left: 'center'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    left: 'left'
  },
  xAxis: {
    type: 'category',
    data: []
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [],
      type: 'line',
      smooth: true
    },
  ]
}

const lineOption1 = {
  title: {
    text: '座位预约趋势图',
    left: 'center'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    left: 'left'
  },
  xAxis: {
    type: 'category',
    data: []
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [],
      type: 'line',
      smooth: true
    },
  ]
}

const barOption = {
  title: {
    text: '活动报名统计图',
    subtext: '柱状图',
    left: 'center'
  },
  tooltip: {
    trigger: 'axis'
  },
  grid: {
    bottom: "25%"
  },
  legend: {
    left: 'left'
  },
  xAxis: {
    type: 'category',
    data: [],
    axisLabel:{
      rotate:30, //倾斜度 -90 至 90 默认为0
      margin: 10,
      textStyle:{
        fontWeight:"bolder",
        color:"#000000"
      }
    }
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [],
      type: 'bar',
      smooth: true,
      itemStyle: {
        normal: {
          color: function(params) { // 根据索引返回对应的颜色
            let colorList = ['#ffaa2e','#32C5E9','#fa4c4c','#08b448','#FFDB5C','#ff9f7f','#fb7293','#E062AE','#E690D1','#e7bcf3']
            return colorList[params.dataIndex];
          }
        }
      },
    }
  ]
}

const barOption5 = {
  title: {
    text: '年级借阅分布图',
    subtext: '柱状图',
    left: 'center'
  },
  tooltip: {
    trigger: 'axis'
  },
  grid: {
    bottom: "25%"
  },
  legend: {
    left: 'left'
  },
  xAxis: {
    type: 'category',
    data: [],
    axisLabel:{
      rotate:30, //倾斜度 -90 至 90 默认为0
      margin: 10,
      textStyle:{
        fontWeight:"bolder",
        color:"#000000"
      }
    }
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [],
      type: 'bar',
      smooth: true,
      itemStyle: {
        normal: {
          color: function(params) { // 根据索引返回对应的颜色
            let colorList = ['#ffaa2e','#32C5E9','#fa4c4c','#08b448','#FFDB5C','#ff9f7f','#fb7293','#E062AE','#E690D1','#e7bcf3']
            return colorList[params.dataIndex];
          }
        }
      },
    }
  ]
}

const pieOption = {
  title: {
    text: '社区发帖统计图',
    subtext: '比例图',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      type: 'pie',
      center: ['50%', '60%'],
      radius: '50%',
      data: [],
      label: {
        show: true,
        formatter(param) {
          return param.name + ' (' + param.percent + '%)';
        }
      },
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
}

const pieOption4 = {
  title: {
    text: '图书借阅分类统计图',
    subtext: '比例图',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      type: 'pie',
      center: ['50%', '60%'],
      radius: '50%',
      data: [],
      label: {
        show: true,
        formatter(param) {
          return param.name + ' (' + param.percent + '%)';
        }
      },
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
}

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),

})

onMounted(() => {
  // 折线图
  let lineDom = document.getElementById('line');
  let lineChart = echarts.init(lineDom);

  // 座位预约
  let lineDom1 = document.getElementById('line1');
  let lineChart1 = echarts.init(lineDom1);

  // 活动预约
  let barDom = document.getElementById('bar');
  let barChart = echarts.init(barDom);

  // 社区发帖
  let pieDom = document.getElementById('pie');
  let pieChart = echarts.init(pieDom);

  // 社区发帖阅读
  let pieDom4 = document.getElementById('pie4');
  let pieChart4 = echarts.init(pieDom4);
  // 年级借阅
  let barDom5 = document.getElementById('bar5');
  let barChart5 = echarts.init(barDom5);

  request.get('/lineData').then(res => {
    lineOption.xAxis.data = res.data.map(v => v.date)  
    lineOption.series[0].data = res.data.map(v => v.count)  
    lineChart.setOption(lineOption)
  })

  request.get('/lineData1').then(res => {
    lineOption1.xAxis.data = res.data.map(v => v.date)  
    lineOption1.series[0].data = res.data.map(v => v.count) 
    lineChart1.setOption(lineOption1)
  })

  request.get('/barData').then(res => {
    barOption.xAxis.data = res.data.map(v => v.name)  
    barOption.series[0].data = res.data.map(v => v.count)  
    barChart.setOption(barOption)
  })

  request.get('/pieData').then(res => {
    pieOption.series[0].data = res.data
    console.log(pieOption.series[0].data)
    pieChart.setOption(pieOption)
  })

  request.get('/pieData4').then(res => {
    pieOption4.series[0].data = res.data
    console.log(pieOption4.series[0].data)
    pieChart4.setOption(pieOption4)
  })

  request.get('/pieData5').then(res => {
    barOption5.xAxis.data = res.data.map(v => v.name)  //  ['2024-10-11', '2024-10-12'...]
    barOption5.series[0].data = res.data.map(v => v.value)  //  [1, 4, 5....]
    barChart5.setOption(barOption5)
  })

})

</script>