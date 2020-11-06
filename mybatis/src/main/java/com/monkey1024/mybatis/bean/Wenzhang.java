package com.monkey1024.mybatis.bean;

public class Wenzhang {

    private Integer id;
    private String title;
    private String content;
    private Integer lanmu_id;

    private  Lanmu lanmu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getLanmu_id() {
        return lanmu_id;
    }

    public void setLanmu_id(Integer lanmu_id) {
        this.lanmu_id = lanmu_id;
    }


    public Lanmu getLanmu() {
        return lanmu;
    }

    public void setLanmu(Lanmu lanmu) {
        this.lanmu = lanmu;
    }
}
