package com.genghis.prometheus.course.model;

import java.util.List;

/**
 * Created by V5-552G on 2015/1/13.
 */
public class TreeVO {
    //节点id
    private String id;
    //节点对应父节点id
    private String parentId;
    //节点名称
    private String name;
    //节点在页面中的显示标题
    private String title;
    //节点对应链接地址
    private String url;
    //树形菜单button键遍历顺序
    private int num;
    //课程审核状态
    private int flag;
    //题目id号
    private int exercise_id;
    //节点对应根节点id
    private String root_id;
    //节点图标
    private String icon;
    //前台节点能够提取的信息
    private List<TreeVO> treeVOList;

    public TreeVO() {
        this.id = "";
        this.parentId = "";
        this.name = "";
        this.url = "";
        this.num = -1;
        this.icon = "";
        this.flag = 0;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getExercise_id() {
        return exercise_id;
    }

    public void setExercise_id(int exercise_id) {
        this.exercise_id = exercise_id;
    }

    public String getRoot_id() { return root_id;}

    public void setRoot_id(String root_id) { this.root_id = root_id;}

    public void setIcon(String icon) {this.icon = icon;}

    public String getIcon() {return icon;}

    public List<TreeVO> getTreeVOList() {
        return treeVOList;
    }

    public void setTreeVOList(List<TreeVO> treeVOList) {
        this.treeVOList = treeVOList;
    }
}