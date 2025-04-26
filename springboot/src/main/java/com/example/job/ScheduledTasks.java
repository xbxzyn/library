package com.example.job;

import cn.hutool.core.date.DateUtil;
import com.example.entity.*;
import com.example.mapper.*;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Component
@Slf4j
public class ScheduledTasks {

    @Autowired
    ActivityMapper activityMapper;
    @Autowired
    SignMapper signMapper;
    @Autowired
    MessageMapper messageMapper;

    @Resource
    private OrdersMapper ordersMapper;

    // 每天早上8点执行
    @Scheduled(cron = "0 0 8 * * ?")
   // @Scheduled(cron = "0 */5 * * * ?") // 每5分钟的第0秒执行（即每5分钟执行一次）
    public void performTask() {
        log.info("扫描活动举办前一天-自动发消息给用户: " + System.currentTimeMillis());

        // 获取当前日期
        LocalDate today = LocalDate.now();

        // 系统扫描是否有活动即将开始
        List<Activity> list = activityMapper.getActivity();
        list.forEach(activity -> {
            // 解析活动日期
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate activityDate = LocalDate.parse(activity.getStart(), formatter);

            // 判断活动日期是否是明天
            if (activityDate.isEqual(today.plusDays(1))) {
                log.info(activity.getId() + "");

                Sign param = new Sign();
                param.setActivityId(activity.getId());
                List<Sign> signList = signMapper.selectAll(param);
                signList.forEach(sign -> {
                    log.info(sign.getActivityName());

                    Message message = new Message();
                    message.setContent(sign.getActivityName() + ";活动开始日期" + activity.getStart() + " 即将开始，请准时参加");
                    message.setTime(DateUtil.now());
                    message.setStatus("未读");
                    message.setUserId(sign.getUserId());
                    message.setLeixing("活动提醒");
                    messageMapper.insert(message);
                });
            }
        });
    }



    @Scheduled(cron = "0 0 8 * * ?") // 每天早上8点10分执行
    //@Scheduled(cron = "0 */1 * * * ?") // 每5分钟的第0秒执行（即每5分钟执行一次）
    public void autoNotifyOverdueBooks() {
        log.info("开始自动通知逾期图书: " + System.currentTimeMillis());

        // 第一步：查询所有逾期的订单
        List<Orders> overdueOrders = ordersMapper.yqlist();
        if (overdueOrders.isEmpty()) {
            log.info("没有需要通知的逾期订单");
            return;
        }

        int processedCount = 0; // 统计已处理的逾期记录数量

        // 第二步：遍历逾期订单，发送通知并更新状态
        for (Orders order : overdueOrders) {
            log.info("处理逾期订单: " + order.getId());

            // 检查订单状态是否为“已借出”或“逾期”
            if ("已借出".equals(order.getStatus()) || "逾期".equals(order.getStatus())) {
                // 构造逾期通知消息
                Message message = new Message();
                message.setContent(order.getName() + " 该借书逾期，请及时归还;归还日期: " + order.getGhtime());
                message.setTime(DateUtil.now());

                message.setUserId(order.getUserId());
                message.setLeixing("图书借阅逾期");

                // 插入通知消息
                messageMapper.insert(message);

                // 更新订单状态为“逾期”
                Orders updatedOrder = new Orders();
                updatedOrder.setId(order.getId());
                updatedOrder.setStatus("逾期"); // 更新状态为“逾期”
                ordersMapper.updateById(updatedOrder);

                processedCount++;
            }
        }

        log.info("逾期通知发送完成，共处理了 {} 条记录", processedCount);
    }




    @Autowired
    @Resource
    private SeatReserveMapper seatReserveMapper;

    @Resource
    private SeatMapper seatMapper; // 注入 SeatMapper 实例


    /**
     * 定时任务：每天早上8点执行，检查并更新逾期的座位预约状态为“逾期”
     */
    @Scheduled(cron = "0 0 8-19 * * ?") // 每天的8点到19点，每小时的第0分钟执行
   //@Scheduled(cron = "0 */1 * * * ?") // 每5分钟的第0秒执行（即每5分钟执行一次）

    public void updateOverdueSeatsStatus() {
        log.info("开始自动更新逾期座位预约状态: " + System.currentTimeMillis());

        // 第一步：查询所有逾期的座位预约
        List<SeatReserve> overdueSeats = seatReserveMapper.selectYqlist();

        if (overdueSeats.isEmpty()) {
            log.info("没有需要更新的逾期座位预约");
            return;
        }

        int updatedSeatReserveCount = 0; // 统计已更新的逾期座位预约记录数量
        int updatedSeatCount = 0; // 统计已更新的座位状态数量

        // 第二步：遍历逾期座位预约，更新状态为“过期”，并同步更新对应座位的状态为“未选”
        for (SeatReserve seat : overdueSeats) {
            log.info("处理逾期座位预约: ID=" + seat.getId());

            // 更新座位预约状态为“过期”
            SeatReserve updatedSeatReserve = new SeatReserve();
            updatedSeatReserve.setId(seat.getId());
            updatedSeatReserve.setStatus("过期"); // 设置新的状态为“过期”

            try {
                seatReserveMapper.updateById(updatedSeatReserve);
                updatedSeatReserveCount++;

                // 更新对应座位的状态为“未选”
                Seat seatToUpdate = new Seat();
                seatToUpdate.setId(seat.getSeatId()); // 获取座位ID
                seatToUpdate.setStatus("未选"); // 设置座位状态为“未选”

                try {
                    seatMapper.updateById(seatToUpdate);
                    updatedSeatCount++;
                } catch (Exception e) {
                    log.error("更新座位状态失败，座位ID=" + seat.getSeatId(), e);
                }
            } catch (Exception e) {
                log.error("更新座位预约状态失败，座位预约ID=" + seat.getId(), e);
            }
        }

        log.info("逾期座位预约状态更新完成，共更新了 {} 条座位预约记录，{} 条座位状态记录", updatedSeatReserveCount, updatedSeatCount);
    }


    //年级的自动更新
    @Resource
    private UserMapper userMapper;
    @Scheduled(cron = "0 0 8 1 9 ?") // 每年9月1日8点执
   //@Scheduled(cron = "0 */1 * * * ?") // 每5分钟的第0秒执行（即每5分钟执行一次）
    public void updateUsersGradeAutomatically() {
        log.info("开始执行用户年级自动更新任务: " + System.currentTimeMillis());

        // 获取当前日期
        LocalDate today = LocalDate.now();

        // 判断今天是否为9月1日
        if (today.getMonthValue() == 9 && today.getDayOfMonth() == 1) {
            try {
                // 获取所有用户
                List<User> users = userMapper.selectAll(null); // 假设传入 null 可以查询所有用户
                int updatedCount = 0; // 统计更新的用户数量

                for (User user : users) {
                    String currentGrade = user.getNianji();

                    // 直接判断当前年级并更新
                    String newGrade = getNextGrade(currentGrade);
                    if (newGrade != null) {
                        user.setNianji(newGrade);
                        boolean isUpdated = updateUser(user);
                        if (isUpdated) {
                            updatedCount++;
                        } else {
                            log.warn("用户ID={} 的年级更新失败。", user.getId());
                        }
                    } else {
                        // 当前年级为九年级或无法识别的年级，不进行更新
                        if ("九年级".equals(currentGrade)) {
                            log.info("用户ID={} 已经是九年级，不进行更新。", user.getId());
                        } else {
                            log.warn("用户ID={} 的年级 {} 无法识别，跳过更新。", user.getId(), currentGrade);
                        }
                    }
                }

                log.info("用户年级自动更新完成，共更新了 {} 名用户的年级。", updatedCount);
            } catch (Exception e) {
                log.error("执行用户年级自动更新任务时发生错误", e);
            }
        } else {
            log.info("今天不是9月1日，跳过用户年级自动更新任务。");
        }
    }

    /**
     * 根据当前年级获取下一个年级
     *
     * @param currentGrade 当前年级（如 "一年级"）
     * @return 下一个年级（如 "二年级"），如果当前年级为 "九年级" 或无法识别，则返回 null
     */
    private String getNextGrade(String currentGrade) {
        if (currentGrade == null) {
            return null;
        }
        switch (currentGrade) {
            case "一年级":
                return "二年级";
            case "二年级":
                return "三年级";
            case "三年级":
                return "四年级";
            case "四年级":
                return "五年级";
            case "五年级":
                return "六年级";
            case "六年级":
                return "七年级";
            case "七年级":
                return "八年级";
            case "八年级":
                return "九年级";
            case "九年级":
                return null; // 已经是最高年级，不更新
            default:
                log.warn("无法识别的当前年级: {}", currentGrade);
                return null; // 无法识别的年级
        }
    }

    /**
     * 更新单个用户的信息
     *
     * @param user 用户实体
     * @return 更新是否成功
     */
    private boolean updateUser(User user) {
        try {
            int affectedRows = userMapper.updateById(user); // 使用现有的 updateById 方法
            return affectedRows > 0;
        } catch (Exception e) {
            log.error("更新用户ID={} 的信息时发生错误: {}", user.getId(), e.getMessage());
            return false;
        }
    }
}