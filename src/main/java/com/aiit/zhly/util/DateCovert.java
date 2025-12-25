package com.aiit.zhly.util;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */

import org.springframework.core.convert.converter.Converter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义日期转换器
 * 用于将字符串转换为Date类型
 */
public class DateCovert implements Converter<String, Date> {

    /**
     * 支持的日期格式
     */
    private static final String[] DATE_FORMATS = {
            "yyyy-MM-dd",
            "yyyy/MM/dd",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy/MM/dd HH:mm:ss",
            "yyyy年MM月dd日",
            "yyyy-MM-dd'T'HH:mm:ss",
            "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    };

    /**
     * 将字符串转换为Date对象
     * @param source 日期字符串
     * @return 转换后的Date对象
     */
    @Override
    public Date convert(String source) {
        if (source == null || source.trim().isEmpty()) {
            return null;
        }

        source = source.trim();

        // 尝试不同的日期格式进行解析
        for (String format : DATE_FORMATS) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(format);
                // 设置严格模式，避免"2023-13-01"这样的无效日期被解析
                sdf.setLenient(false);
                return sdf.parse(source);
            } catch (ParseException e) {
                // 当前格式解析失败，尝试下一个格式
                continue;
            }
        }

        // 如果所有格式都失败，尝试解析时间戳（毫秒）
        try {
            long timestamp = Long.parseLong(source);
            return new Date(timestamp);
        } catch (NumberFormatException e) {
            // 不是时间戳，继续尝试其他可能性
        }

        // 如果还是失败，尝试处理一些常见的中文日期格式变体
        try {
            // 处理"2023年12月24日 15:30:00"这样的格式
            String processedSource = source.replace("年", "-")
                    .replace("月", "-")
                    .replace("日", "")
                    .replace("时", ":")
                    .replace("分", ":")
                    .replace("秒", "");

            // 尝试用标准格式重新解析
            for (String format : DATE_FORMATS) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat(format);
                    sdf.setLenient(false);
                    return sdf.parse(processedSource);
                } catch (ParseException e) {
                    continue;
                }
            }
        } catch (Exception e) {
            // 忽略转换异常
        }

        // 如果所有尝试都失败，抛出异常
        throw new IllegalArgumentException("无法解析日期字符串: " + source +
                "。支持的格式：" + String.join(", ", DATE_FORMATS) + "，或时间戳（毫秒）");
    }
}
