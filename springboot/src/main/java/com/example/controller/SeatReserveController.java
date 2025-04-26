package com.example.controller;

import com.example.common.Result;
import com.example.entity.SeatReserve;
import com.example.service.SeatReserveService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/seatReserve")
public class SeatReserveController {

    @Resource
    private SeatReserveService seatReserveService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody SeatReserve seatReserve) {
        seatReserveService.add(seatReserve);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody SeatReserve seatReserve) {
        seatReserveService.updateById(seatReserve);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        seatReserveService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        seatReserveService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        SeatReserve seatReserve = seatReserveService.selectById(id);
        return Result.success(seatReserve);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(SeatReserve seatReserve) {
        List<SeatReserve> list = seatReserveService.selectAll(seatReserve);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(SeatReserve seatReserve,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<SeatReserve> pageInfo = seatReserveService.selectPage(seatReserve, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
