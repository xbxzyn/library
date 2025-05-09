package com.example.controller;

import com.example.common.Result;
import com.example.entity.OrdersItem;
import com.example.service.OrdersItemService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/ordersItem")
public class OrdersItemController {

    @Resource
    private OrdersItemService ordersItemService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody OrdersItem ordersItem) {
        ordersItemService.add(ordersItem);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody OrdersItem ordersItem) {
        ordersItemService.updateById(ordersItem);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        ordersItemService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        ordersItemService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        OrdersItem ordersItem = ordersItemService.selectById(id);
        return Result.success(ordersItem);
    }

    /**
     * 根据订单ID查询
     */
    @GetMapping("/selectByOrderId/{orderId}")
    public Result selectByOrderId(@PathVariable Integer orderId) {
        List<OrdersItem> ordersItem = ordersItemService.selectByOrderId(orderId);
        return Result.success(ordersItem);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(OrdersItem ordersItem) {
        List<OrdersItem> list = ordersItemService.selectAll(ordersItem);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(OrdersItem ordersItem,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<OrdersItem> pageInfo = ordersItemService.selectPage(ordersItem, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
