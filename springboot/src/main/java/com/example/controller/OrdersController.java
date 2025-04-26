package com.example.controller;

import cn.hutool.core.text.StrSplitter;
import cn.hutool.core.text.split.SplitIter;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.write.style.column.LongestMatchColumnWidthStyleStrategy;
import com.alibaba.fastjson.JSONArray;
import com.example.common.Result;
import com.example.entity.ExportRequestDTO;
import com.example.entity.OrderExcelVO;
import com.example.entity.Orders;
import com.example.service.OrdersService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    private OrdersService ordersService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Orders orders) {
        ordersService.add(orders);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody Orders orders) {
        ordersService.updateById(orders);
        return Result.success();
    }

    @PutMapping("/xujie")
    public Result xujie(@RequestBody Orders orders) {
        ordersService.xujie(orders);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        ordersService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        ordersService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Orders orders = ordersService.selectById(id);
        return Result.success(orders);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Orders orders) {

            // 调用服务层方法，传递 orders 和 username
            List<Orders> list = ordersService.selectAll(orders);
            return Result.success(list);

    }
    @GetMapping("/selectyqlist")
    public Result selectYqlist(Orders orders) {
        List<Orders> list = ordersService.selectYulist(orders);
        return Result.success(list);
    }
    @GetMapping("/selectnum1")
    public Map<String, Object> getBorrowedCount() {
        int borrowedCount = ordersService.selectNum1();
        Map<String, Object> response = new HashMap<>();
        response.put("code", "200"); // 添加状态码
        response.put("msg", "success"); // 添加消息
        response.put("data", borrowedCount); // 添加数据
        return response;
    }

    @GetMapping("/selectnum2")
    public Map<String, Object> getOverdueCount() {
        int overdueCount = ordersService.selectNum2();
        Map<String, Object> response = new HashMap<>();
        response.put("code", "200"); // 添加状态码
        response.put("msg", "success"); // 添加消息
        response.put("data", overdueCount); // 添加数据
        return response;
    }
    /*
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Orders orders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Orders> pageInfo = ordersService.selectPage(orders, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    @PostMapping("/export")
    public void export(HttpServletResponse response, @RequestBody ExportRequestDTO exportRequestDTO) throws Exception {
        // 设置响应头
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        String fileName = URLEncoder.encode("借书订单", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
        // 查询数据（使用与页面相同的查询条件）
        List<Integer> ids=exportRequestDTO.getIds();
        List<OrderExcelVO> exportList=ordersService.selectByIds(ids);

        // 转换为Excel数据对象
        List<OrderExcelVO> excelData = exportList.stream().map(order -> {
            OrderExcelVO vo = new OrderExcelVO();
            vo.setName(order.getName());//名称
            vo.setOrderNo(order.getOrderNo());//编号
            vo.setTime(order.getTime());//借阅时间
            vo.setUsername(order.getUsername());//学生姓名
            vo.setUseraccount(order.getUseraccount());//学号
            vo.setBanji(order.getBanji());//班级
            vo.setNianji(order.getNianji());//年级
            vo.setPhone(order.getPhone());//电话
            vo.setGhtime(order.getGhtime());//归还时间
            vo.setStatus(order.getStatus());//状态


            return vo;
        }).collect(Collectors.toList());

        // 导出Excel
        EasyExcel.write(response.getOutputStream(), OrderExcelVO.class)
                .registerWriteHandler(new LongestMatchColumnWidthStyleStrategy()) // 自适应列宽
                .sheet("借书订单")
                .doWrite(excelData);
    }

}
