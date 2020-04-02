package cn.doudou.domain;

import java.io.Serializable;

public class Register implements Serializable {
    private Integer id;
    private String username;
    private String useremail;
    private String userpassword;
    private String uuid;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    @Override
    public String toString() {
        return "Register{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", useremail='" + useremail + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", uuid='" + uuid + '\'' +
                '}';
    }
}
