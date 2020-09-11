package kybmig.ssm.model;

import java.io.Serializable;
import java.util.List;

public class TopicModel extends BaseModel {
    private Integer id;
    private String title;
    private String content;
    private Integer userId;
    private Integer boardId;
    private Integer topicId;
    private Long createdTime;
    private Long updatedTime;
    private List<TopicCommentModel> commentList;
    private List<UserModel> userList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public Long getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Long createdTime) {
        this.createdTime = createdTime;
    }

    public Long getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Long updatedTime) {
        this.updatedTime = updatedTime;
    }

    public void setCommentList(List<TopicCommentModel> commentList) {
        this.commentList = commentList;
    }

    public List<TopicCommentModel> getCommentList() {
        return commentList;
    }

    public List<UserModel> getUserList() {
        return userList;
    }

    public void setUserList(List<UserModel> userList) {
        this.userList = userList;
    }
}
