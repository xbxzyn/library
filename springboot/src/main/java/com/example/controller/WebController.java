package com.example.controller;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Dict;
import com.alibaba.fastjson.JSON;
import com.example.common.Result;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.mapper.PostsMapper;
import com.example.mapper.SignMapper;
import com.example.service.*;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@RestController
public class WebController {

    @Resource
    private AdminService adminService;
    @Resource
    private UserService userService;
    @Resource
    OrdersService ordersService;
    @Resource
    SeatReserveService seatReserveService;
    @Resource
    ActivityService activityService;
    @Resource
    SignMapper signMapper;
    @Resource
    PostsSectionService postsSectionService;
    @Resource
    PostsMapper postsMapper;

    /**
     * 默认请求接口
     */
    @GetMapping("/")
    public Result hello() {
        return Result.success();
    }

    /**
     * 登录
     */
    @PostMapping("/login")
    public Result login(@RequestBody Account account, HttpServletRequest request) {

//        // 获取session中的验证码
//        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
        String sessionCaptcha=CaptchaController.CAPTCHA_MAP.get("captcha");
        System.out.println(sessionCaptcha);
        String userCaptcha = account.getCaptcha();

        // 验证码校验
        if (sessionCaptcha == null || !sessionCaptcha.equals(userCaptcha.toLowerCase())) {
            return Result.error("验证码错误");
        }

        Account loginAccount = null;
        if (RoleEnum.ADMIN.name().equals(account.getRole())) {
            loginAccount = adminService.login(account);
        } else if (RoleEnum.USER.name().equals(account.getRole()) ) {
            loginAccount = userService.login(account);
        }

        log.info(JSON.toJSONString(loginAccount));
        return Result.success(loginAccount);
    }

    /**
     * 注册
     */
    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        userService.add(user);
        return Result.success();
    }

    /**
     * 修改密码
     */
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody Account account) {
        if (RoleEnum.ADMIN.name().equals(account.getRole())) {
            adminService.updatePassword(account);
        } else if (RoleEnum.USER.name().equals(account.getRole())) {
            userService.updatePassword(account);
        }
        return Result.success();
    }

    @GetMapping("/lineData")
    public Result lineDate() {
        List<Dict> list = new ArrayList<>();
        Date date = new Date();
        DateTime start = DateUtil.offsetDay(date, -30);  // 开日期
        List<DateTime> dateList = DateUtil.rangeToList(start, date, DateField.DAY_OF_YEAR);
        List<String> dateStrList = dateList.stream().map(DateUtil::formatDate).sorted(Comparator.naturalOrder()).collect(Collectors.toList());
        for (String day : dateStrList) {
            // 查询这一天的借书量
            Integer count = ordersService.selectDayCount(day);
            Dict dict = Dict.create().set("date", day).set("count", count);
            list.add(dict);
        }
        return Result.success(list);
    }

    @GetMapping("/lineData1")
    public Result lineDate1() {
        List<Dict> list = new ArrayList<>();
        Date date = new Date();
        DateTime start = DateUtil.offsetDay(date, -30);  // 开日期
        List<DateTime> dateList = DateUtil.rangeToList(start, date, DateField.DAY_OF_YEAR);
        List<String> dateStrList = dateList.stream().map(DateUtil::formatDate).sorted(Comparator.naturalOrder()).collect(Collectors.toList());
        for (String day : dateStrList) {
            // 查询这一天的借书量
            Integer count = seatReserveService.selectDayCount(day);
            Dict dict = Dict.create().set("date", day).set("count", count);
            list.add(dict);
        }
        return Result.success(list);
    }

    @GetMapping("/barData")
    public Result barData() {
        List<Dict> list = new ArrayList<>();
        List<Activity> activityList = activityService.selectAll(null);
        for (Activity activity : activityList) {
            Integer count = signMapper.selectByActivityId(activity.getId());
            Dict dict = Dict.create().set("name", activity.getName()).set("count", count);
            list.add(dict);
        }
        return Result.success(list);
    }

    @GetMapping("/pieData")
    public Result pieData() {
        List<Dict> list = new ArrayList<>();
        List<PostsSection> postsSectionList = postsSectionService.selectAll(null);
        for (PostsSection section : postsSectionList) {
            Integer count = postsMapper.selectBySectionId(section.getId());
            Dict dict = Dict.create().set("name", section.getName()).set("value", count);  // 注意  pie数据格式必须是name:value 对象
            list.add(dict);
        }
        return Result.success(list);
    }
    //社区发帖可视化图表
    @GetMapping("/pieData4")//
    public Result pieData4() {
        return Result.success(postsSectionService.pie4());
    }
    //图书借阅可视化图表
    @GetMapping("/pieData5")
    public Result pieData5() {
        return Result.success(ordersService.pie5());
    }

}
