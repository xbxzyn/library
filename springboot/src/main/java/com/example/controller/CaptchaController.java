package com.example.controller;

import cn.hutool.db.AbstractDb;
import com.wf.captcha.SpecCaptcha;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@RestController
public class CaptchaController {

    public static Map<String, String> CAPTCHA_MAP = new ConcurrentHashMap<>();

    @GetMapping("/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 设置请求头
        response.setContentType("image/gif");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 创建验证码

        SpecCaptcha specCaptcha = new SpecCaptcha(120, 50, 4);
        // 验证码存入session
//        request.getSession().setAttribute("captcha", specCaptcha.text().toLowerCase());
        CAPTCHA_MAP.put("captcha", specCaptcha.text().toLowerCase());
        // 输出图片流
        specCaptcha.out(response.getOutputStream());
    }
}
