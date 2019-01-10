package com.genghis.prometheus.util;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.text.SimpleDateFormat;
/**
 * Created by Demon on 2015/1/28.
 */
public final class TimeFormatUtil {

    private static long hour;
    private static long minute;
    private static final int MILLISECOND_OF_SECOND = 1000;
    private static final int SECOND_OF_MINUTE = 60;
    private static final int MINUTE_OF_HOUR = 60;
    public static final String HOUR_AND_MINUTE = "HOUR_AND_MINUTE";

    private TimeFormatUtil(){};

    private static long getHourByMillisecond(long millisecond){
        return millisecond / (MILLISECOND_OF_SECOND * SECOND_OF_MINUTE * MINUTE_OF_HOUR);
    }

    private static long getMinuteByMillisecond(long millisecond){
        return millisecond / (MILLISECOND_OF_SECOND * SECOND_OF_MINUTE);
    }

    private static String getHourAndMinute(long time){
        hour = getHourByMillisecond(time);
        minute = getMinuteByMillisecond(time) % MINUTE_OF_HOUR;
        return hour + "小时" + minute + "分钟";
    }

    public static String get(String time,String pattern){
        long millisecond = new Long(time);
        if(HOUR_AND_MINUTE.equals(pattern)){
            return getHourAndMinute(millisecond);
        }
        return new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss",Locale.CHINA).format(new Date(millisecond));
    }
}
