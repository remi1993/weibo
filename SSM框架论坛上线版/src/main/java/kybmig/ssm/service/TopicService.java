package kybmig.ssm.service;


import com.mysql.cj.jdbc.MysqlDataSource;
import jdk.jshell.execution.Util;
import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TodoMapper;
import kybmig.ssm.mapper.TopicCommentMapper;
import kybmig.ssm.mapper.TopicMapper;
import kybmig.ssm.model.ModelFactory;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class TopicService {
    private TopicMapper mapper;
    private TopicCommentMapper topicCommentMapper;

    public TopicService(TopicMapper topicMapper, TopicCommentMapper topicCommentMapper) {
        this.mapper = topicMapper;
        this.topicCommentMapper = topicCommentMapper;
    }

    public Long createdTime (){
        Long time = System.currentTimeMillis() ;
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String time = sdf.format(new Date(Long.parseLong(String.valueOf(createdTime))));
        Utility.log("createdtime1 %s" ,time);
        return time;
    }

    public  Long updatedTime (){
        Long time = System.currentTimeMillis() ;
        Utility.log("updatedtimeLong %s" ,time);
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Utility.log("updatedtimeLong %s" ,updatedTime);
//        String time = sdf.format(updatedTime);
//        Utility.log("updatedtime1 %s" ,time);
        return time;
    }

    public TopicModel add(String title, String content, Integer userId,Integer boardId, Long createdTime, Long updatedTime) {
        TopicModel m = new TopicModel();
        m.setTitle(title);
        m.setContent(content);
        m.setUserId(userId);
        m.setBoardId(boardId);
        m.setCreatedTime(this.createdTime());
        m.setUpdatedTime(this.updatedTime());
        // Utility.log("topic add user: %s", m);
        mapper.insertTopic(m);
        return m;
    }


    public  void update(Integer id, String title, String content, Long updatedTime) {
        TopicModel m = new TopicModel();
        m.setId(id);
        m.setContent(content);
        m.setTitle(title);
        m.setUpdatedTime(this.updatedTime());
       mapper.updateTopic(m);
    }


    public void deleteById(Integer id) {
        mapper.deleteTopic(id);
    }


    public  TopicModel findById(Integer id) {
        TopicModel m = mapper.selectOneWithComments(id);
        Utility.log("TopicModel id %s", id);
        Utility.log("TopicModel m %s", m);
        return m;
    }

    public  TopicModel findByIdwithTopicComment(Integer id) {
        TopicModel m = mapper.selectOneWithCommentsUserid(id);
        Utility.log("TopicModel id %s", id);
        Utility.log("TopicModel m %s", m);
        return m;
    }

    public  List<TopicModel> all() {
        return mapper.selectAllTopic();
    }

    public List<TopicCommentModel> topicCommentList(Integer topicId) {
        return topicCommentMapper.selectAllTopicCommentByTopicId(topicId);
    }


}
