package com.example.controller;

import com.example.common.Result;
import com.example.entity.Seat;
import com.example.service.SeatService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/seat")
public class SeatController {

    @Resource
    private SeatService seatService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Seat seat) {
        seatService.add(seat);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody Seat seat) {
        seatService.updateById(seat);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        seatService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        seatService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Seat seat = seatService.selectById(id);
        return Result.success(seat);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Seat seat) {
        List<Seat> list = seatService.selectAll(seat);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Seat seat,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Seat> pageInfo = seatService.selectPage(seat, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
