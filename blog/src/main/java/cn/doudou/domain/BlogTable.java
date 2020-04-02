package cn.doudou.domain;

import java.io.Serializable;
import java.util.Date;

public class BlogTable implements Serializable {
    private String bUid;
    private String bTitle;
    private String bIntroduce;
    private String bTxt;
    private String bTime;
    private String bReading;
    private String rName;

    public String getbTime() {
        return bTime;
    }

    public String getbUid() {
        return bUid;
    }

    public void setbUid(String bUid) {
        this.bUid = bUid;
    }

    public String getbTitle() {
        return bTitle;
    }

    public void setbTitle(String bTitle) {
        this.bTitle = bTitle;
    }

    public String getbIntroduce() {
        return bIntroduce;
    }

    public void setbIntroduce(String bIntroduce) {
        this.bIntroduce = bIntroduce;
    }

    public String getbTxt() {
        return bTxt;
    }

    public void setbTxt(String bTxt) {
        this.bTxt = bTxt;
    }


    public void setbTime(String bTime) {
        this.bTime = bTime;
    }

    public String getbReading() {
        return bReading;
    }

    public void setbReading(String bReading) {
        this.bReading = bReading;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    @Override
    public String toString() {
        return "BlogTable{" +
                "bUid='" + bUid + '\'' +
                ", bTitle='" + bTitle + '\'' +
                ", bIntroduce='" + bIntroduce + '\'' +
                ", bTxt='" + bTxt + '\'' +
                ", bTime='" + bTime + '\'' +
                ", bReading='" + bReading + '\'' +
                ", rName='" + rName + '\'' +
                '}';
    }
}
