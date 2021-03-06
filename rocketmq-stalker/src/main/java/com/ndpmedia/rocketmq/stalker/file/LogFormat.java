package com.ndpmedia.rocketmq.stalker.file;

import com.ndpmedia.rocketmq.stalker.dao.StalkerDao;

import java.util.Date;
import java.util.Map;

/**
 * Created by robert.xu on 2015/4/10.
 * log format just check log file
 */
public class LogFormat implements FileFormat {

    /**
     * appoint log must like XXXXlog.typeYYYY, and YYYY will translate to map.
     * @param log
     * @return
     */
    @Override
    public boolean check(String log) {
        if (log.matches("[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}.*"))
            log = log.substring(20);
        String base = log.substring(log.indexOf("-") + 1);

        Map<String, Object> map = TranslateHelper.translateStringToMap(base);

        String sql = "";
        if (null != map && !map.isEmpty())
            sql = TranslateHelper.translateSQLFromMap(map);

        try {
            //记录SQL影响行数
            if (null != sql && !sql.isEmpty()) {
                int i = StalkerDao.update(sql);
            }
        } catch (Exception e) {
            System.out.println(new Date().toString() + " try to save file analysis result failed.");

            return false;
        }

        return true;
    }
}
