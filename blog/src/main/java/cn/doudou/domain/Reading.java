package cn.doudou.domain;

import java.io.Serializable;
import java.util.Date;

public class Reading implements Serializable {
    private String bId;
    private String username;
    private Date time;
    private String txt;

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    @Override
    public String toString() {
        return "Reading{" +
                "bId='" + bId + '\'' +
                ", username='" + username + '\'' +
                ", time=" + time +
                ", txt='" + txt + '\'' +
                '}';
    }
}
